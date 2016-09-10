package com.doubleview.jeebase.support.render;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *Render,提供向浏览器响应的抽象类
 */
public abstract class Render {

    protected HttpServletRequest request;
    protected HttpServletResponse response;

    public void setWebContext(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }


    public abstract void render();
}
