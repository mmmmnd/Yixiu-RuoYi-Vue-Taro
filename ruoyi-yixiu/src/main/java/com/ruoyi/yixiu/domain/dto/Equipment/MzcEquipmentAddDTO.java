package com.ruoyi.yixiu.domain.dto.Equipment;

import io.swagger.annotations.ApiModelProperty;

public class MzcEquipmentAddDTO {

    @ApiModelProperty(value = "归属单位")
    private Long deptId;

    @ApiModelProperty(value = "设备名称")
    private String equipmentName;

    @ApiModelProperty(value = "序列号")
    private String serialNumber;

    @ApiModelProperty(value = "出厂编号")
    private String factoryNumber;

    @ApiModelProperty(value = "设备型号")
    private String modelNumber;

    @ApiModelProperty(value = "品牌")
    private String brand;

    @ApiModelProperty(value = "价格")
    private String price;

    @ApiModelProperty(value = "购买时间")
    private String purchaseTime;

    @ApiModelProperty(value = "报废时间")
    private String scrapTime;

    @ApiModelProperty(value = "保养预警")
    private String maintain;

    @ApiModelProperty(value = "备注")
    private String remark;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getFactoryNumber() {
        return factoryNumber;
    }

    public void setFactoryNumber(String factoryNumber) {
        this.factoryNumber = factoryNumber;
    }

    public String getModelNumber() {
        return modelNumber;
    }

    public void setModelNumber(String modelNumber) {
        this.modelNumber = modelNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(String purchaseTime) {
        this.purchaseTime = purchaseTime;
    }

    public String getScrapTime() {
        return scrapTime;
    }

    public void setScrapTime(String scrapTime) {
        this.scrapTime = scrapTime;
    }

    public String getMaintain() {
        return maintain;
    }

    public void setMaintain(String maintain) {
        this.maintain = maintain;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
