package com.doubleview.jeebase.support.config;

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

    private static String defaultLoadProperties = "common.properties";//默认加载配置文件

    /**
     * 静态加载配置文件
     */
    static{
        props = new Properties();
        InputStream is = null;
            try {
                is = Thread.currentThread().getContextClassLoader().getResourceAsStream(defaultLoadProperties);
                props.load(is);
            } catch (IOException ex) {
                logger.warn("Could not load common.properties {}" , ex.getMessage());
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

    public static final String defaultCharset = "UTF-8";//默认编码

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

    public static String getProductName(){
        return getConfig("productName");
    }
    /**
     * 获取URL后缀
     * @return
     */
    public static String getUrlSuffix() {
        return getConfig("urlSuffix");
    }

    public Integer getInt(String key) {
        return getInt(key, null);
    }

    public Integer getInt(String key, Integer defaultValue) {
        String value = getConfig(key);
        if (value != null)
            return Integer.parseInt(value.trim());
        return defaultValue;
    }

    public Long getLong(String key) {
        return getLong(key, null);
    }

    public Long getLong(String key, Long defaultValue) {
        String value = getConfig(key);
        if (value != null)
            return Long.parseLong(value.trim());
        return defaultValue;
    }


    public Boolean getBoolean(String key) {
        return getBoolean(key, null);
    }


    public Boolean getBoolean(String key, Boolean defaultValue) {
        String value = getConfig(key);
        if (value != null) {
            value = value.toLowerCase().trim();
            if ("true".equals(value))
                return true;
            else if ("false".equals(value))
                return false;
            throw new RuntimeException("The value can not parse to Boolean : "
                    + value);
        }
        return defaultValue;
    }


    public static void main(String[] args){
        System.out.println(Constant.getAdminPath());
    }

}
