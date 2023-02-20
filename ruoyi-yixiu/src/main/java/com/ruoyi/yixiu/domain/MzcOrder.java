package com.ruoyi.yixiu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 mzc_order
 * 
 * @author mmmmnd
 * @date 2023-02-19
 */
public class MzcOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单id */
    private Long orderId;

    /** 维修点id */
    @Excel(name = "维修点id")
    private Long deptId;

    /** 设备id */
    @Excel(name = "设备id")
    private Long equipmentId;

    /** 报修人 */
    @Excel(name = "报修人")
    private String repairman;

    /** 报修电话 */
    @Excel(name = "报修电话")
    private String repairPhone;

    /** 工作类别 */
    @Excel(name = "工作类别")
    private String workType;

    /** 期望上门服务时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    @Excel(name = "期望上门服务时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date expectationTime;

    /** 故障描述 */
    @Excel(name = "故障描述")
    private String errorDescription;

    /** 申请科室意见 */
    @Excel(name = "申请科室意见")
    private String applyDeptOpinion;

    /** 装备部意见 */
    @Excel(name = "装备部意见")
    private String equipmentOpinion;

    /** 分管院长审批意见 */
    @Excel(name = "分管院长审批意见")
    private String subheadOpinion;

    /** 院长审批意见 */
    @Excel(name = "院长审批意见")
    private String deanOpinion;

    /** 状态（0等待处理 1系统派单 2自主接单 3开始检测 4出具报告 5提供报价 6审核 7 开始维修 8维修完成 9 验收） */
    @Excel(name = "状态", readConverterExp = "0=等待处理,1=系统派单,2=自主接单,3=开始检测,4=出具报告,5=提供报价,6=审核,7=,开=始维修,8=维修完成,9=,验=收")
    private String status;

    /** 评价意见 */
    @Excel(name = "评价意见")
    private String appraiseOpinion;

    /** 评价（1很差，2差，3一般，4好，5很好） */
    @Excel(name = "评价", readConverterExp = "1=很差，2差，3一般，4好，5很好")
    private Integer appraise;

    /** 评价人（用户id） */
    @Excel(name = "评价人", readConverterExp = "用=户id")
    private Long userId;

    /** 删除人 */
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /*设备列表*/
    private MzcEquipment equipment;

    /* 部门列表*/
    private SysDept dept;

    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public void setRepairman(String repairman)
    {
        this.repairman = repairman;
    }

    public String getRepairman() 
    {
        return repairman;
    }
    public void setRepairPhone(String repairPhone) 
    {
        this.repairPhone = repairPhone;
    }

    public String getRepairPhone() 
    {
        return repairPhone;
    }
    public void setWorkType(String workType) 
    {
        this.workType = workType;
    }

    public String getWorkType() 
    {
        return workType;
    }
    public void setExpectationTime(Date expectationTime) 
    {
        this.expectationTime = expectationTime;
    }

    public Date getExpectationTime() 
    {
        return expectationTime;
    }
    public void setErrorDescription(String errorDescription) 
    {
        this.errorDescription = errorDescription;
    }

    public String getErrorDescription() 
    {
        return errorDescription;
    }
    public void setApplyDeptOpinion(String applyDeptOpinion) 
    {
        this.applyDeptOpinion = applyDeptOpinion;
    }

    public String getApplyDeptOpinion() 
    {
        return applyDeptOpinion;
    }
    public void setEquipmentOpinion(String equipmentOpinion) 
    {
        this.equipmentOpinion = equipmentOpinion;
    }

    public String getEquipmentOpinion() 
    {
        return equipmentOpinion;
    }
    public void setSubheadOpinion(String subheadOpinion) 
    {
        this.subheadOpinion = subheadOpinion;
    }

    public String getSubheadOpinion() 
    {
        return subheadOpinion;
    }
    public void setDeanOpinion(String deanOpinion) 
    {
        this.deanOpinion = deanOpinion;
    }

    public String getDeanOpinion() 
    {
        return deanOpinion;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setAppraiseOpinion(String appraiseOpinion) 
    {
        this.appraiseOpinion = appraiseOpinion;
    }

    public String getAppraiseOpinion() 
    {
        return appraiseOpinion;
    }
    public void setAppraise(Integer appraise) 
    {
        this.appraise = appraise;
    }

    public Integer getAppraise() 
    {
        return appraise;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setDeleteBy(String deleteBy) 
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy() 
    {
        return deleteBy;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public MzcEquipment getEquipment() {
        return equipment;
    }

    public void setEquipment(MzcEquipment equipment) {
        this.equipment = equipment;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderId", getOrderId())
            .append("deptId", getDeptId())
            .append("equipmentId", getEquipmentId())
            .append("repairman", getRepairman())
            .append("repairPhone", getRepairPhone())
            .append("workType", getWorkType())
            .append("expectationTime", getExpectationTime())
            .append("errorDescription", getErrorDescription())
            .append("applyDeptOpinion", getApplyDeptOpinion())
            .append("equipmentOpinion", getEquipmentOpinion())
            .append("subheadOpinion", getSubheadOpinion())
            .append("deanOpinion", getDeanOpinion())
            .append("status", getStatus())
            .append("appraiseOpinion", getAppraiseOpinion())
            .append("appraise", getAppraise())
            .append("userId", getUserId())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
