package com.ruoyi.yixiu.domain.dto.supplier;

import io.swagger.annotations.ApiModelProperty;

public class MzcSupplierAddDTO {

    @ApiModelProperty(value = "供应商")
    private String supplierName;

    @ApiModelProperty(value = "联系人")
    private String nickname;

    @ApiModelProperty(value = "联系电话")
    private String phone;

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
