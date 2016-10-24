package com.doubleview.jeebase.support.web;

import java.util.List;

/**
 * jstree json数据
 */
public class TreeDataResult {

    private String id;

    private String text;

    private State state;

    private List<TreeDataResult> children;

    private String icon;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
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


    static class  State{
        Boolean open;

        public Boolean getOpen() {
            return open;
        }

        public void setOpen(Boolean open) {
            this.open = open;
        }
    }

}
