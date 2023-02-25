package com.ruoyi.yixiu.domain.dto.order;

import io.swagger.annotations.ApiModelProperty;

public class MzcOrderSendDTO {

    @ApiModelProperty(value = "订单id")
    private Long orderId;

    @ApiModelProperty(value = "工程师id")
    private Long engineerId;

    @ApiModelProperty(value = "派单操作人")
    private String sendOrders;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getEngineerId() {
        return engineerId;
    }

    public void setEngineerId(Long engineerId) {
        this.engineerId = engineerId;
    }

    public String getSendOrders() {
        return sendOrders;
    }

    public void setSendOrders(String sendOrders) {
        this.sendOrders = sendOrders;
    }
}
