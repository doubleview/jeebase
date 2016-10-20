package com.doubleview.jeebase.support.interceptor;

import com.doubleview.jeebase.support.config.SpringContext;
import com.doubleview.jeebase.support.utils.CommonUtils;
import com.doubleview.jeebase.support.utils.DateTimeUtils;
import com.doubleview.jeebase.support.utils.ServletUtils;
import com.doubleview.jeebase.system.model.Log;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.security.SystemAuthenticationFilter;
import com.doubleview.jeebase.system.service.LogService;
import com.doubleview.jeebase.system.utils.ShiroUtils;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * 日志拦截器
 */
public class LogInterceptor implements HandlerInterceptor {

    private static Logger logger = LoggerFactory.getLogger(LogInterceptor.class);

    //线程局部变量，用于记录访问耗时
    private static final ThreadLocal<Long> startTimeThreadLocal = new ThreadLocal<>();

    private LogService logService = SpringContext.getBean(LogService.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        long beginTime = System.currentTimeMillis();
        startTimeThreadLocal.set(beginTime);
        if(logger.isDebugEnabled()){
            logger.debug("开始计时: {}  URI: {}", new SimpleDateFormat("HH:mm:ss.SSS").format(beginTime), request.getRequestURI());
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {
            logger.info("view name: " + modelAndView.getViewName());
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 保存日志
        saveLog(request , handler , ex);
        long beginTime = startTimeThreadLocal.get();
        long endTime = System.currentTimeMillis();
        if(logger.isDebugEnabled()){
            logger.debug("计时结束：{}  耗时：{}  URI: {}  最大内存: {}m  已分配内存: {}m  已分配内存中的剩余空间: {}m  最大可用内存: {}m",
                    new SimpleDateFormat("hh:mm:ss.SSS").format(endTime),
                    DateTimeUtils.formatDateTime(endTime - beginTime),
                    request.getRequestURI(), Runtime.getRuntime().maxMemory() / 1024 / 1024,
                    Runtime.getRuntime().totalMemory() / 1024 / 1024,
                    Runtime.getRuntime().freeMemory() / 1024 / 1024,
                    (Runtime.getRuntime().maxMemory() - Runtime.getRuntime().totalMemory() + Runtime.getRuntime().freeMemory()) / 1024 / 1024);
        }
    }

    /**
     * 保存日志
     * @param request
     * @param handler
     * @param ex
     */
    private void saveLog(HttpServletRequest request , Object handler , Exception ex){
        String href = request.getRequestURI();
        List<Menu> menuList = SystemCacheUtils.getMenuList();
        boolean isContinue = false;
        //判断请求uri是否为菜单内路径
        for(Menu menu : menuList){
            if(StringUtils.isNotBlank(menu.getHref()) && href.contains(menu.getHref())){
                isContinue = true;
                break;
            }
        }
        if(!isContinue && ex == null){
            return;
        }
        Log log = new Log();
        log.setRemoteIp(ServletUtils.getRemoteAddr(request));
        log.setRequestUri(request.getRequestURI());
        log.setMethod(request.getMethod());
        log.setUserAgent(request.getHeader("user-agent"));
        Map<String , String[]> paramMap = request.getParameterMap();
        StringBuilder params = new StringBuilder();
        for (Map.Entry<String, String[]> param : paramMap.entrySet()){
            params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
            String paramValue = (param.getValue() != null && param.getValue().length > 0 ? StringUtils.join(param.getValue()) : "");
            //密码参数不显示
            if(StringUtils.endsWithIgnoreCase(param.getKey(), SystemAuthenticationFilter.DEFAULT_PASSWORD_PARAM)){
                paramValue = "******";
                params.append(paramValue);
                continue;
            }
            //控制显示字符数
            params.append(CommonUtils.abbr(paramValue, 100));
        }
        log.setParams(params.toString());
        //启动保存日志线程
        new LogThread(log, handler, ex).start();
    }

    private class LogThread extends Thread {

        private Log log;
        private Object handler;
        private Exception ex;

        public LogThread(Log log, Object handler, Exception ex) {
            this.log = log;
            this.handler = handler;
            this.ex = ex;
        }

        @Override
        public void run() {
            //得到拦截的类名和方法名
            HandlerMethod handlerMethod = (HandlerMethod)handler;
            String controllerClassName = handlerMethod.getBeanType().getName();
            String methodName = handlerMethod.getMethod().getName();

            log.setTitle(controllerClassName + "-->" + methodName);
            log.setType(ex != null ? Log.ACCESS : Log.EXCEPTION);
            User user = ShiroUtils.getCurrentUser();
            if(user == null){
                log.setCreateBy(new User("0"));
            }else {
                log.setCreateBy(user);
            }
            if(ex != null){
                log.setException(ex.getClass().getName() + ":" + ex.getMessage());
            }else {
                log.setException("正常");
            }
            logService.save(log);
        }
    }
}
