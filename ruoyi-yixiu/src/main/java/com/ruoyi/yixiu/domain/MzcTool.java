package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 工具对象 mzc_tool
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public class MzcTool extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工具id */
    @ApiModelProperty(value = "工具id")
    private Long toolId;

    /** 单位id */
    @ApiModelProperty(value = "单位id")
    @Excel(name = "单位id")
    private Long deptId;

    /** 工具名称 */
    @ApiModelProperty(value = "工具名称")
    @Excel(name = "工具名称")
    private String toolName;

    /** 规格型号 */
    @ApiModelProperty(value = "规格型号")
    @Excel(name = "规格型号")
    private String model;

    /** 数量 */
    @ApiModelProperty(value = "数量")
    @Excel(name = "数量")
    private Long number;

    /** 性能 */
    @ApiModelProperty(value = "性能")
    @Excel(name = "性能")
    private String performance;

    /** 用途 */
    @ApiModelProperty(value = "用途")
    @Excel(name = "用途")
    private String purpose;

    /** 技术指标 */
    @ApiModelProperty(value = "技术指标")
    @Excel(name = "技术指标")
    private String technical;

    /** 推荐厂家及理由 */
    @ApiModelProperty(value = "推荐厂家及理由")
    @Excel(name = "推荐厂家及理由")
    private String reason;

    /** 工具价格 */
    @ApiModelProperty(value = "工具价格")
    @Excel(name = "工具价格")
    private BigDecimal toolPrice;

    /** 申请科室意见 */
    @ApiModelProperty(value = "申请科室意见")
    @Excel(name = "申请科室意见")
    private String deptOpinion;

    /** 工程部意见 */
    @ApiModelProperty(value = "工程部意见")
    @Excel(name = "工程部意见")
    private String engineeringOpinion;

    /** 相关科室意见 */
    @ApiModelProperty(value = "相关科室意见")
    @Excel(name = "相关科室意见")
    private String correlationDeptOpinion;

    /** 状态 (0 存在 1不存在 ) */
    @ApiModelProperty(value = "状态 (0 存在 1不存在 )")
    private String stauts;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    @ApiModelProperty(value = "归属单位名称")
    private String deptName;

    public void setToolId(Long toolId) 
    {
        this.toolId = toolId;
    }

    public Long getToolId() 
    {
        return toolId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setToolName(String toolName) 
    {
        this.toolName = toolName;
    }

    public String getToolName() 
    {
        return toolName;
    }
    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setPerformance(String performance) 
    {
        this.performance = performance;
    }

    public String getPerformance() 
    {
        return performance;
    }
    public void setPurpose(String purpose) 
    {
        this.purpose = purpose;
    }

    public String getPurpose() 
    {
        return purpose;
    }
    public void setTechnical(String technical) 
    {
        this.technical = technical;
    }

    public String getTechnical() 
    {
        return technical;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setToolPrice(BigDecimal toolPrice) 
    {
        this.toolPrice = toolPrice;
    }

    public BigDecimal getToolPrice() 
    {
        return toolPrice;
    }
    public void setDeptOpinion(String deptOpinion) 
    {
        this.deptOpinion = deptOpinion;
    }

    public String getDeptOpinion() 
    {
        return deptOpinion;
    }
    public void setEngineeringOpinion(String engineeringOpinion) 
    {
        this.engineeringOpinion = engineeringOpinion;
    }

    public String getEngineeringOpinion() 
    {
        return engineeringOpinion;
    }
    public void setCorrelationDeptOpinion(String correlationDeptOpinion) 
    {
        this.correlationDeptOpinion = correlationDeptOpinion;
    }

    public String getCorrelationDeptOpinion() 
    {
        return correlationDeptOpinion;
    }
    public void setStauts(String stauts) 
    {
        this.stauts = stauts;
    }

    public String getStauts() 
    {
        return stauts;
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

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("toolId", getToolId())
            .append("deptId", getDeptId())
            .append("toolName", getToolName())
            .append("model", getModel())
            .append("number", getNumber())
            .append("performance", getPerformance())
            .append("purpose", getPurpose())
            .append("technical", getTechnical())
            .append("reason", getReason())
            .append("toolPrice", getToolPrice())
            .append("deptOpinion", getDeptOpinion())
            .append("engineeringOpinion", getEngineeringOpinion())
            .append("correlationDeptOpinion", getCorrelationDeptOpinion())
            .append("stauts", getStauts())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
