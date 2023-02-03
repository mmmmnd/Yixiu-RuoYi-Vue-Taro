package com.ruoyi.yixiu.domain.dto.scrap;

import io.swagger.annotations.ApiModelProperty;

import java.util.List;

public class MzcScrapAddDTO {

    @ApiModelProperty(value = "归属单位")
    private Integer deptId;

    @ApiModelProperty(value = "设备列表")
    private List<Long> equipmentIds;

    @ApiModelProperty(value = "联系人")
    private String nickname;

    @ApiModelProperty(value = "联系电话")
    private String phone;

    @ApiModelProperty(value = "报废原因")
    private String cause;

    @ApiModelProperty(value = "报废情况")
    private String record;

    @ApiModelProperty(value = "部门")
    private String deptOpinion;

    @ApiModelProperty(value = "设备部门")
    private String equipmentOpinion;

    @ApiModelProperty(value = "院长")
    private String presidentOpinion;

    @ApiModelProperty(value = "分院长")
    private String subPresident;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public List<Long> getEquipmentIds() {
        return equipmentIds;
    }

    public void setEquipmentIds(List<Long> equipmentIds) {
        this.equipmentIds = equipmentIds;
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

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getRecord() {
        return record;
    }

    public void setRecord(String record) {
        this.record = record;
    }

    public String getDeptOpinion() {
        return deptOpinion;
    }

    public void setDeptOpinion(String deptOpinion) {
        this.deptOpinion = deptOpinion;
    }

    public String getEquipmentOpinion() {
        return equipmentOpinion;
    }

    public void setEquipmentOpinion(String equipmentOpinion) {
        this.equipmentOpinion = equipmentOpinion;
    }

    public String getPresidentOpinion() {
        return presidentOpinion;
    }

    public void setPresidentOpinion(String presidentOpinion) {
        this.presidentOpinion = presidentOpinion;
    }

    public String getSubPresident() {
        return subPresident;
    }

    public void setSubPresident(String subPresident) {
        this.subPresident = subPresident;
    }
}
