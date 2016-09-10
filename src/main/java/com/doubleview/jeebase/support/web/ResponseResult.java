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


    public ResponseResult(){
        super();
    }

    public ResponseResult(int code , String message , Object data){
        this.code = code;
        this.message = message;
        this.data = data;
    }

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

    /**
     * 成功
     * @param data
     * @return
     */
    public static ResponseResult success(Object data){
        ResponseResult responseResult = new ResponseResult();
        responseResult.setCode(0);
        responseResult.setMessage("success");
        responseResult.setData(data);
        return responseResult;
    }

    /**
     * 失败
     * @return
     */
    public static ResponseResult fail(){
        ResponseResult responseResult = new ResponseResult();
        responseResult.setCode(1);
        responseResult.setMessage("fail");
        responseResult.setData(null);
        return  responseResult;
    }

}
