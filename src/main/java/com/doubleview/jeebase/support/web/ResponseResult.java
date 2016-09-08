package com.doubleview.jeebase.support.web;

/**
 * 对Ajax的请求响应
 */
public class ResponseResult {

    // 标记成功失败，默认0:成功,1:失败
    private int code = 0;

    // 返回的中文消息
    private String message;

    // 成功时携带的数据
    private Object data;


    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
