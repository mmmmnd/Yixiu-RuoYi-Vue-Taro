package com.ruoyi.yixiu.domain.dto.order;

import io.swagger.annotations.ApiModelProperty;

public class MzcOrderPickDTO {

    @ApiModelProperty(value = "订单id")
    private Long orderId;

    @ApiModelProperty(value = "工程师id")
    private Long engineerId;

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
}
