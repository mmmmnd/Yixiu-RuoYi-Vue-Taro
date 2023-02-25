package com.ruoyi.yixiu.domain.dto.order;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

public class MzcOrderAddDTO {

    @ApiModelProperty(value = "单位id")
    private Long deptId;

    @ApiModelProperty(value = "设备id")
    private Long equipmentId;

    @ApiModelProperty(value = "报修人")
    private String repairman;

    @ApiModelProperty(value = "报修电话")
    private String repairPhone;

    @ApiModelProperty(value = "工作类别")
    private String workType;

    @ApiModelProperty(value = "期望上门服务时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone="GMT+8")
    private Date expectationTime;

    @ApiModelProperty(value = "故障描述")
    private String errorDescription;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getRepairman() {
        return repairman;
    }

    public void setRepairman(String repairman) {
        this.repairman = repairman;
    }

    public String getRepairPhone() {
        return repairPhone;
    }

    public void setRepairPhone(String repairPhone) {
        this.repairPhone = repairPhone;
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType;
    }

    public Date getExpectationTime() {
        return expectationTime;
    }

    public void setExpectationTime(Date expectationTime) {
        this.expectationTime = expectationTime;
    }

    public String getErrorDescription() {
        return errorDescription;
    }

    public void setErrorDescription(String errorDescription) {
        this.errorDescription = errorDescription;
    }
}
