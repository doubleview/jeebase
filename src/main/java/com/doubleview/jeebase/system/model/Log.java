package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.base.BaseModel;

import java.util.Date;

/**
 * 日志
 */
public class Log extends BaseModel<Log>{

    private String type; 		// 日志类型（1：接入日志；2：错误日志）

    private String title;		// 日志标题

    private String remoteIp; 	// 操作用户的IP地址

    private String requestUri; 	// 操作的URI

    private String method; 		// 操作的方式

    private String params; 		// 操作提交的数据

    private String userAgent;	// 操作用户代理信息

    private String exception; 	// 异常信息

    private Date beginDate;		// 开始日期

    private Date endDate;		// 结束日期

    // 日志类型（1：接入日志；2：错误日志）
    public static final String TYPE_ACCESS = "1";
    public static final String TYPE_EXCEPTION = "2";

    public Log(){
        super();
    }

    public Log(String id){
        super(id);
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemoteIp() {
        return remoteIp;
    }

    public void setRemoteIp(String remoteIp) {
        this.remoteIp = remoteIp;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String requestUri) {
        this.requestUri = requestUri;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params;
    }

    public String getUserAgent() {
        return userAgent;
    }

    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
