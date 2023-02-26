package com.ruoyi.yixiu.domain.dto.order;

import com.ruoyi.yixiu.domain.MzcOrderParts;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

public class MzcOrderReportDTO {

    @ApiModelProperty(value = "单位id")
    private Long orderId;

    @ApiModelProperty(value = "设备检测")
    private String equipmentInspection;

    @ApiModelProperty(value = "配件列表")
    private List<MzcOrderParts> orderParts;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getEquipmentInspection() {
        return equipmentInspection;
    }

    public void setEquipmentInspection(String equipmentInspection) {
        this.equipmentInspection = equipmentInspection;
    }

    public List<MzcOrderParts> getOrderParts() {
        return orderParts;
    }

    public void setOrderParts(List<MzcOrderParts> orderParts) {
        this.orderParts = orderParts;
    }
}
