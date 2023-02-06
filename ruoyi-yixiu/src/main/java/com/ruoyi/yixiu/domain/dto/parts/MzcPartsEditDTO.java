package com.ruoyi.yixiu.domain.dto.parts;

import io.swagger.annotations.ApiModelProperty;

public class MzcPartsEditDTO {

    @ApiModelProperty(value = "配件id")
    private Long partsId;

    @ApiModelProperty(value = "配件名称")
    private String name;

    @ApiModelProperty(value = "配件型号")
    private String model;

    @ApiModelProperty(value = "配件数量")
    private Long number;

    @ApiModelProperty(value = "用途")
    private String purpose;

    @ApiModelProperty(value = "是否急需")
    private Integer needStatus;

    @ApiModelProperty(value = "采购人")
    private String purchaseName;

    @ApiModelProperty(value = "备注")
    private String remark;

    public Long getPartsId() {
        return partsId;
    }

    public void setPartsId(Long partsId) {
        this.partsId = partsId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public Integer getNeedStatus() {
        return needStatus;
    }

    public void setNeedStatus(Integer needStatus) {
        this.needStatus = needStatus;
    }

    public String getPurchaseName() {
        return purchaseName;
    }

    public void setPurchaseName(String purchaseName) {
        this.purchaseName = purchaseName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
