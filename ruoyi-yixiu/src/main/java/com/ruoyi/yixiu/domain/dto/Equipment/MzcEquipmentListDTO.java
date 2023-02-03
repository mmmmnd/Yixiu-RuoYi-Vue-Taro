package com.ruoyi.yixiu.domain.dto.Equipment;

import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class MzcEquipmentListDTO {
    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "设备名称",example = "20")
    private String equipmentName;

    @ApiModelProperty(value = "品牌",example = "20")
    private String brand;

    @ApiModelProperty(value = "购买时间",example = "2023-02-01")
    private Date purchaseTime;

    @ApiModelProperty(value = "报废时间",example = "2023-02-04")
    private Date scrapTime;

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

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Date getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(Date purchaseTime) {
        this.purchaseTime = purchaseTime;
    }

    public Date getScrapTime() {
        return scrapTime;
    }

    public void setScrapTime(Date scrapTime) {
        this.scrapTime = scrapTime;
    }
}
