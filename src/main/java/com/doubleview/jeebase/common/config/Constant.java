package com.doubleview.jeebase.common.config;

import com.google.common.collect.Maps;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.Properties;

/**
 * 全局常量类
 */
public class Constant {

    private static Logger logger = LoggerFactory.getLogger(Constant.class);

    private static Properties props;

    static{
        props = new Properties();
        InputStream is = null;
            try {
                is = Thread.currentThread().getContextClassLoader().getResourceAsStream("common.properties");
                System.out.println(is);
                props.load(is);
            } catch (IOException ex) {
                logger.warn("Could not load common.properties" + ex.getMessage());
            } finally {
                IOUtils.closeQuietly(is);
            }
    }


    /**
     * 保存全局属性值(缓存)
     */
    private static Map<String, String> map = Maps.newHashMap();

    /**
     * 显示/隐藏
     */
    public static final String SHOW = "1";
    public static final String HIDE = "0";

    /**
     * 是/否
     */
    public static final String YES = "1";
    public static final String NO = "0";

    /**
     * 对/错
     */
    public static final String TRUE = "true";
    public static final String FALSE = "false";


    /**
     * 获取配置属性
     * @param key
     * @return
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null){
            value = props.getProperty(key);
            map.put(key, value != null ? value : StringUtils.EMPTY);
        }
        return value;
    }


    /**
     * 获取管理端路径
     * @return
     */
    public static String getAdminPath() {
        return getConfig("adminPath");
    }


    /**
     * 获取前端路径
     * @return
     */
    public static String getFrontPath() {
        return getConfig("frontPath");
    }


    /**
     * 获取URL后缀
     * @return
     */
    public static String getUrlSuffix() {
        return getConfig("urlSuffix");
    }


    /**
     * 是否是演示模式
     * @return
     */
    public static Boolean isDemoMode() {
        String dm = getConfig("demoMode");
        return "true".equals(dm) || "1".equals(dm);
    }


    public static void main(String[] args){
        Properties properties = new Properties();
        InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("common.properties");
        //InputStream inputStream = ClassLoader.getSystemResourceAsStream("common.properties");
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(properties.get("productName"));
    }

}
