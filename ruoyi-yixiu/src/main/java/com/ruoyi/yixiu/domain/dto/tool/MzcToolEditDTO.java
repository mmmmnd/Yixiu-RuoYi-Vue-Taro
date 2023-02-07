package com.ruoyi.yixiu.domain.dto.tool;

import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;

public class MzcToolEditDTO {

    @ApiModelProperty(value = "工具id")
    private Long toolId;

    @ApiModelProperty(value = "归属单位ID")
    private Long deptId;

    @ApiModelProperty(value = "工具名称")
    private String toolName;

    @ApiModelProperty(value = "规格型号")
    private String model;

    @ApiModelProperty(value = "数量")
    private Long number;

    @ApiModelProperty(value = "工具价格")
    private BigDecimal toolPrice;

    @ApiModelProperty(value = "用途")
    private String purpose;

    @ApiModelProperty(value = "技术指标")
    private String technical;

    @ApiModelProperty(value = "性能")
    private String performance;

    @ApiModelProperty(value = "推荐厂家及理由")
    private String reason;

    @ApiModelProperty(value = "申请科室意见")
    private String deptOpinion;

    @ApiModelProperty(value = "工程部意见")
    private String engineeringOpinion;

    @ApiModelProperty(value = "相关科室意见")
    private String correlationDeptOpinion;

    public Long getToolId() {
        return toolId;
    }

    public void setToolId(Long toolId) {
        this.toolId = toolId;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getToolName() {
        return toolName;
    }

    public void setToolName(String toolName) {
        this.toolName = toolName;
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

    public BigDecimal getToolPrice() {
        return toolPrice;
    }

    public void setToolPrice(BigDecimal toolPrice) {
        this.toolPrice = toolPrice;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getTechnical() {
        return technical;
    }

    public void setTechnical(String technical) {
        this.technical = technical;
    }

    public String getPerformance() {
        return performance;
    }

    public void setPerformance(String performance) {
        this.performance = performance;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDeptOpinion() {
        return deptOpinion;
    }

    public void setDeptOpinion(String deptOpinion) {
        this.deptOpinion = deptOpinion;
    }

    public String getEngineeringOpinion() {
        return engineeringOpinion;
    }

    public void setEngineeringOpinion(String engineeringOpinion) {
        this.engineeringOpinion = engineeringOpinion;
    }

    public String getCorrelationDeptOpinion() {
        return correlationDeptOpinion;
    }

    public void setCorrelationDeptOpinion(String correlationDeptOpinion) {
        this.correlationDeptOpinion = correlationDeptOpinion;
    }
}
