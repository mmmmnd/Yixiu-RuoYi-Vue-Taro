package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 借配对象 mzc_deploy
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public class MzcDeploy extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 调配id */
    @ApiModelProperty(value = "调配id")
    private Long deployId;

    /** 设备id */
    @Excel(name = "设备id")
    @ApiModelProperty(value = "设备id")
    private Long equipmentId;

    /** 申请单位id */
    @Excel(name = "申请单位id")
    @ApiModelProperty(value = "申请单位id")
    private Long deptIdIn;

    /** 借配单位id */
    @Excel(name = "借配单位id")
    @ApiModelProperty(value = "借配单位id")
    private Long deptIdOut;

    /** 借用目的 */
    @Excel(name = "借用目的")
    @ApiModelProperty(value = "借用目的")
    private String cause;

    /** 分管领导意见 */
    @Excel(name = "分管领导意见")
    @ApiModelProperty(value = "分管领导意见")
    private String leaderOpinion;

    /** 调出部门负责人意见 */
    @Excel(name = "调出部门负责人意见")
    @ApiModelProperty(value = "调出部门负责人意见")
    private String departmentOpinion;

    /** 设备管理部负责人意见 */
    @Excel(name = "设备管理部负责人意见")
    @ApiModelProperty(value = "设备管理部负责人意见")
    private String equipmentOpinion;

    /** 状态 */
    @ApiModelProperty(value = "状态")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    /** 申请单位名称 */
    @ApiModelProperty(value = "申请单位名称")
    private String deptIdInName;

    /** 借配单位名称 */
    @ApiModelProperty(value = "借配单位名称")
    private String deptIdOutName;

    public void setDeployId(Long deployId) 
    {
        this.deployId = deployId;
    }

    public Long getDeployId() 
    {
        return deployId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setDeptIdIn(Long deptIdIn) 
    {
        this.deptIdIn = deptIdIn;
    }

    public Long getDeptIdIn() 
    {
        return deptIdIn;
    }
    public void setDeptIdOut(Long deptIdOut) 
    {
        this.deptIdOut = deptIdOut;
    }

    public Long getDeptIdOut() 
    {
        return deptIdOut;
    }
    public void setCause(String cause) 
    {
        this.cause = cause;
    }

    public String getCause() 
    {
        return cause;
    }
    public void setLeaderOpinion(String leaderOpinion) 
    {
        this.leaderOpinion = leaderOpinion;
    }

    public String getLeaderOpinion() 
    {
        return leaderOpinion;
    }
    public void setDepartmentOpinion(String departmentOpinion) 
    {
        this.departmentOpinion = departmentOpinion;
    }

    public String getDepartmentOpinion() 
    {
        return departmentOpinion;
    }
    public void setEquipmentOpinion(String equipmentOpinion) 
    {
        this.equipmentOpinion = equipmentOpinion;
    }

    public String getEquipmentOpinion() 
    {
        return equipmentOpinion;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setDeleteBy(String deleteBy) 
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy() 
    {
        return deleteBy;
    }

    public String getDeptIdInName() {
        return deptIdInName;
    }

    public void setDeptIdInName(String deptIdInName) {
        this.deptIdInName = deptIdInName;
    }

    public String getDeptIdOutName() {
        return deptIdOutName;
    }

    public void setDeptIdOutName(String deptIdOutName) {
        this.deptIdOutName = deptIdOutName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deployId", getDeployId())
            .append("equipmentId", getEquipmentId())
            .append("deptIdIn", getDeptIdIn())
            .append("deptIdOut", getDeptIdOut())
            .append("cause", getCause())
            .append("leaderOpinion", getLeaderOpinion())
            .append("departmentOpinion", getDepartmentOpinion())
            .append("equipmentOpinion", getEquipmentOpinion())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
