package com.doubleview.jeebase.common.utils;

import com.doubleview.jeebase.common.config.Constant;
import org.apache.commons.lang3.StringUtils;

import java.io.UnsupportedEncodingException;

/**
 *普通工具类
 */
public class CommonUtils {


    /**
     * 转换为字节数组
     * @param str
     * @return
     */
    public static byte[] getBytes(String str){
        if (str != null){
            try {
                return str.getBytes(Constant.defaultCharset);
            } catch (UnsupportedEncodingException e) {
                return null;
            }
        }else{
            return null;
        }
    }

    /**
     * 转换为字节数组
     * @param bytes
     * @return
     */
    public static String toString(byte[] bytes){
        try {
            return new String(bytes, Constant.defaultCharset);
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }
    /**
     * 驼峰命名法工具
     * @return toCamelCase("hello_world") == "helloWorld"
     */
    public static String toCamelCase(String s) {
        if (s == null) {
            return null;
        }
        s = s.toLowerCase();
        StringBuilder sb = new StringBuilder(s.length());
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            if (c == '_') {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(c));
                upperCase = false;
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    /**
     * 驼峰命名法工具
     * @return toCapitalizeCamelCase("hello_world") == "HelloWorld"
     */
    public static String toCapitalizeCamelCase(String s) {
        if (s == null) {
            return null;
        }
        s = toCamelCase(s);
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    /**
     * 驼峰命名法工具
     * @return toUnderScoreCase("helloWorld") = "hello_world"
     */
    public static String toUnderScoreCase(String s) {
        if (s == null) {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        boolean upperCase = false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);

            boolean nextUpperCase = true;

            if (i < (s.length() - 1)) {
                nextUpperCase = Character.isUpperCase(s.charAt(i + 1));
            }

            if ((i > 0) && Character.isUpperCase(c)) {
                if (!upperCase || !nextUpperCase) {
                    sb.append('_');
                }
                upperCase = true;
            } else {
                upperCase = false;
            }

            sb.append(Character.toLowerCase(c));
        }

        return sb.toString();
    }

    /**
     * 转换为JS获取对象值，生成三目运算返回结果
     * @param objectString 对象串
     */
    public static String jsGetVal(String objectString){
        StringBuilder result = new StringBuilder();
        StringBuilder val = new StringBuilder();
        String[] vals = StringUtils.split(objectString, ".");
        for (int i=0; i<vals.length; i++){
            val.append("." + vals[i]);
            result.append("!"+(val.substring(1))+"?'':");
        }
        result.append(val.substring(1));
        return result.toString();
    }

    public static void main(String[] args){
        System.out.println(CommonUtils.jsGetVal("abc.def"));
        System.out.println(CommonUtils.toCamelCase("hello_world"));
        System.out.println(CommonUtils.toCapitalizeCamelCase("hello_world"));
        System.out.println(CommonUtils.toUnderScoreCase("hello_world"));
    }
}
