package com.ruoyi.yixiu.domain.dto.deploy;

import io.swagger.annotations.ApiModelProperty;

public class MzcDeployAddDTO {

    @ApiModelProperty(value = "设备id")
    private Long equipmentId;

    @ApiModelProperty(value = "申请单位id")
    private Long deptIdIn;

    @ApiModelProperty(value = "借配单位id")
    private Long deptIdOut;

    @ApiModelProperty(value = "借用目的")
    private String cause;

    @ApiModelProperty(value = "分管领导意见")
    private String leader_opinion;

    @ApiModelProperty(value = "调出部门负责人意见")
    private String department_opinion;

    @ApiModelProperty(value = "设备管理部负责人意见")
    private String equipment_opinion;

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public Long getDeptIdIn() {
        return deptIdIn;
    }

    public void setDeptIdIn(Long deptIdIn) {
        this.deptIdIn = deptIdIn;
    }

    public Long getDeptIdOut() {
        return deptIdOut;
    }

    public void setDeptIdOut(Long deptIdOut) {
        this.deptIdOut = deptIdOut;
    }

    public String getCause() {
        return cause;
    }

    public void setCause(String cause) {
        this.cause = cause;
    }

    public String getLeader_opinion() {
        return leader_opinion;
    }

    public void setLeader_opinion(String leader_opinion) {
        this.leader_opinion = leader_opinion;
    }

    public String getDepartment_opinion() {
        return department_opinion;
    }

    public void setDepartment_opinion(String department_opinion) {
        this.department_opinion = department_opinion;
    }

    public String getEquipment_opinion() {
        return equipment_opinion;
    }

    public void setEquipment_opinion(String equipment_opinion) {
        this.equipment_opinion = equipment_opinion;
    }
}
