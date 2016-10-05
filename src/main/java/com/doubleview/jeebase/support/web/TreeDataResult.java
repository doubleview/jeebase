package com.doubleview.jeebase.support.web;

import java.util.List;

/**
 * jstree json数据
 */
public class TreeDataResult {

    private String text;

    private String state;

    private List<TreeDataResult> children;

    private String icon;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<TreeDataResult> getChildren() {
        return children;
    }

    public void setChildren(List<TreeDataResult> children) {
        this.children = children;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
