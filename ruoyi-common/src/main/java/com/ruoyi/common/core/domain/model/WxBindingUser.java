package com.ruoyi.common.core.domain.model;

import javax.validation.constraints.NotNull;

public class WxBindingUser {

    private String openId;

    private String phone;

    @NotNull(message = "openId不能为空")
    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    @NotNull(message = "phone不能为空")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
