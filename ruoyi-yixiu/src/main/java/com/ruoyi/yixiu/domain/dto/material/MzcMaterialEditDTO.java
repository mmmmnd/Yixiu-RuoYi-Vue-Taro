package com.ruoyi.yixiu.domain.dto.material;

import io.swagger.annotations.ApiModelProperty;

public class MzcMaterialEditDTO {

    @ApiModelProperty(value = "耗材id")
    private Long materialId;

    @ApiModelProperty(value = "设备列表")
    private Long equipmentId;

    @ApiModelProperty(value = "供应商")
    private Long supplierId;

    @ApiModelProperty(value = "耗材名称")
    private String materialName;

    @ApiModelProperty(value = "品牌")
    private String brand;

    @ApiModelProperty(value = "耗材类型 ( 0 普通耗材 1专用耗材 )")
    private String status;

    @ApiModelProperty(value = "备注")
    private String remark;

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public Long getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
