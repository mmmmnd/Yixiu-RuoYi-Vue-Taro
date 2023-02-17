package com.ruoyi.yixiu.domain.vo;

public class HeaderMenuVO {

    private String activeNum;

    private String icon;

    private String name;

    private String type;

    private String url;

    public HeaderMenuVO() {
    }

    public HeaderMenuVO(String activeNum, String icon, String name, String type, String url) {
        this.activeNum = activeNum;
        this.icon = icon;
        this.name = name;
        this.type = type;
        this.url = url;
    }

    public String getActiveNum() {
        return activeNum;
    }

    public void setActiveNum(String activeNum) {
        this.activeNum = activeNum;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
