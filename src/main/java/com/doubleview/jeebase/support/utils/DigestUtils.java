package com.doubleview.jeebase.support.utils;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;

/**
 * 支持SHA-1/MD5消息摘要的工具类.
 */
public class DigestUtils {

    private static final String SHA1 = "SHA-1";
    private static final String MD5 = "MD5";

    /**
     * 对输入字符串进行md5散列.
     */
    public static byte[] md5(byte[] input) {
        return digest(input, MD5, null, 1);
    }

    /**
     * 对指定字节进行MD5散列
     * @param input
     * @param iterations 散列次数
     * @return
     */
    public static byte[] md5(byte[] input, int iterations) {
        return digest(input, MD5, null, iterations);
    }

    /**
     * 对输入字符串进行sha1散列.
     */
    public static byte[] sha1(byte[] input) {
        return digest(input, SHA1, null, 1);
    }

    /**
     * 对指定字节进行sha1散列
     * @param input
     * @param salt 盐
     * @return
     */
    public static byte[] sha1(byte[] input, byte[] salt) {
        return digest(input, SHA1, salt, 1);
    }

    /**
     * 对指定字节进行散列
     * @param input
     * @param salt 盐
     * @param iterations 散列次数
     * @return
     */
    public static byte[] sha1(byte[] input, byte[] salt, int iterations) {
        return digest(input, SHA1, salt, iterations);
    }

    /**
     * 对指定字节进行散列, 支持md5与sha1算法.
     */
    private static byte[] digest(byte[] input, String algorithm, byte[] salt, int iterations) {
        try {
            MessageDigest digest = MessageDigest.getInstance(algorithm);

            if (salt != null) {
                digest.update(salt);
            }

            byte[] result = digest.digest(input);

            for (int i = 1; i < iterations; i++) {
                digest.reset();
                result = digest.digest(result);
            }
            return result;
        } catch (GeneralSecurityException e) {
            throw ExceptionUtils.unchecked(e);
        }
    }


    /**
     * 对文件进行md5散列.
     */
    public static byte[] md5(InputStream input) throws IOException {
        return digest(input, MD5);
    }

    /**
     * 对文件进行sha1散列.
     */
    public static byte[] sha1(InputStream input) throws IOException {
        return digest(input, SHA1);
    }

    private static byte[] digest(InputStream input, String algorithm) throws IOException {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            int bufferLength = 8 * 1024;
            byte[] buffer = new byte[bufferLength];
            int read = input.read(buffer, 0, bufferLength);

            while (read > -1) {
                messageDigest.update(buffer, 0, read);
                read = input.read(buffer, 0, bufferLength);
            }

            return messageDigest.digest();
        } catch (GeneralSecurityException e) {
            throw ExceptionUtils.unchecked(e);
        }
    }

}