package com.ruoyi.yixiu.domain.vo;

public class FooterMenuVO {

    private String active;

    private String img;

    private String name;

    private String url;

    public FooterMenuVO() {
    }

    public FooterMenuVO(String active, String img, String name, String url) {
        this.active = active;
        this.img = img;
        this.name = name;
        this.url = url;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
