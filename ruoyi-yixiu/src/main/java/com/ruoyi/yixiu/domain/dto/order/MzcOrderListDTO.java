package com.ruoyi.yixiu.domain.dto.order;

import io.swagger.annotations.ApiModelProperty;

public class MzcOrderListDTO {

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "单位id")
    private Long orderId;

    @ApiModelProperty(value = "设备id")
    private Long equipmentId;

    @ApiModelProperty(value = "工作类别")
    private String workType;

    @ApiModelProperty(value = "状态类型 （1系统派单 2自主接单）")
    private Integer orderType;

    @ApiModelProperty(value = "状态 （0等待处理 1系统派单 2自主接单 3开始检测 4出具报告 5提供报价 6审核 7 开始维修 8维修完成 9 验收）")
    private String status;

    @ApiModelProperty(value = "评价 （1很差，2差，3一般，4好，5很好）")
    private Integer appraise;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    public Integer getOrderType() {
        return orderType;
    }

    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getAppraise() {
        return appraise;
    }

    public void setAppraise(Integer appraise) {
        this.appraise = appraise;
    }
}
