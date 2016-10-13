package com.doubleview.jeebase.support.utils;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *普通工具类
 */
public class CommonUtils {


    private static String defaultCharset = "UTF-8";

    /**
     * 转换为字节数组
     * @param str
     * @return
     */
    public static byte[] getBytes(String str){
        if (str != null){
            try {
                return str.getBytes(defaultCharset);
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
            return new String(bytes, defaultCharset);
        } catch (UnsupportedEncodingException e) {
            throw  ExceptionUtils.unchecked(e);
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
     * 缩略字符串（不区分中英文字符）
     * @param str 目标字符串
     * @param length 截取长度
     * @return
     */
    public static String abbr(String str, int length) {
        if (str == null) {
            return "";
        }
        try {
            StringBuilder sb = new StringBuilder();
            int currentLength = 0;
            for (char c : replaceHtml(StringEscapeUtils.unescapeHtml4(str)).toCharArray()) {
                currentLength += String.valueOf(c).getBytes("GBK").length;
                if (currentLength <= length - 3) {
                    sb.append(c);
                } else {
                    sb.append("...");
                    break;
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 替换掉HTML标签方法
     */
    public static String replaceHtml(String html) {
        if (StringUtils.isBlank(html)){
            return "";
        }
        String regEx = "<.+?>";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(html);
        String s = m.replaceAll("");
        return s;
    }

    public static void main(String[] args){
        System.out.println(CommonUtils.toCamelCase("hello_world"));
        System.out.println(CommonUtils.toCapitalizeCamelCase("hello_world"));
        System.out.println(CommonUtils.toUnderScoreCase("hello_world"));
    }
}
