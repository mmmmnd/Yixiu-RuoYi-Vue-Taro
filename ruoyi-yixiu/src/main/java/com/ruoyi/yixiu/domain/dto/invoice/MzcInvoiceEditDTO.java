package com.ruoyi.yixiu.domain.dto.invoice;

import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;

public class MzcInvoiceEditDTO {

    @ApiModelProperty(value = "发票id")
    private Long invoiceId;

    @ApiModelProperty(value = "单位名称")
    private Long deptName;

    @ApiModelProperty(value = "税号")
    private String dutyParagraph;

    @ApiModelProperty(value = "项目")
    private String project;

    @ApiModelProperty(value = "开票金额")
    private BigDecimal price;

    public Long getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(Long invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Long getDeptName() {
        return deptName;
    }

    public void setDeptName(Long deptName) {
        this.deptName = deptName;
    }

    public String getDutyParagraph() {
        return dutyParagraph;
    }

    public void setDutyParagraph(String dutyParagraph) {
        this.dutyParagraph = dutyParagraph;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
