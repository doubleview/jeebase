package com.doubleview.jeebase.support.listener;

import com.doubleview.jeebase.support.config.Constant;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContext;

/**
 * web启动监听器
 */
public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {

    @Override
    public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");
        sb.append("\r\n       欢迎使用 "+ Constant.getConfig("productName") + "  ^_^\r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());
        return super.initWebApplicationContext(servletContext);
    }
}