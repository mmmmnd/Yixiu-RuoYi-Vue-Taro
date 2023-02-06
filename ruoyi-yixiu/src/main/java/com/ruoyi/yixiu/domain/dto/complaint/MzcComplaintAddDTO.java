package com.ruoyi.yixiu.domain.dto.complaint;

import io.swagger.annotations.ApiModelProperty;

public class MzcComplaintAddDTO {

    @ApiModelProperty(value = "订单id")
    private Long orderId;

    @ApiModelProperty(value = "投诉类型 （0 普通投诉 1 订单投诉）")
    private String complaintType;

    @ApiModelProperty(value = "投诉人")
    private String nickname;

    @ApiModelProperty(value = "联系电话")
    private String phone;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getComplaintType() {
        return complaintType;
    }

    public void setComplaintType(String complaintType) {
        this.complaintType = complaintType;
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
