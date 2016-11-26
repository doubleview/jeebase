package com.doubleview.jeebase.support.render;

import java.util.List;

/**
 * Render工厂
 */
public class RenderFactory {


    private static RenderFactory renderFactory = new RenderFactory();

    public static RenderFactory custome(){
        return renderFactory;
    }

    public Render getCaptchaRender(){
        return new CaptchaRender();
    }

    public Render getExcelRender(List<Object> dataList){
        return  new ExcelRender();
    }

}
