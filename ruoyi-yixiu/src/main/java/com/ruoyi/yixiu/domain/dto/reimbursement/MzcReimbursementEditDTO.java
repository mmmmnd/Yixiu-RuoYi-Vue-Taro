package com.ruoyi.yixiu.domain.dto.reimbursement;

import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;

public class MzcReimbursementEditDTO {

    @ApiModelProperty(value = "报销id")
    private Long reimbursement_id;

    @ApiModelProperty(value = "项目")
    private String project;

    @ApiModelProperty(value = "类别")
    private String category;

    @ApiModelProperty(value = "金额")
    private BigDecimal price;

    @ApiModelProperty(value = "总金额")
    private BigDecimal totalPrice;

    @ApiModelProperty(value = "负责人")
    private BigDecimal person;

    public Long getReimbursement_id() {
        return reimbursement_id;
    }

    public void setReimbursement_id(Long reimbursement_id) {
        this.reimbursement_id = reimbursement_id;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getPerson() {
        return person;
    }

    public void setPerson(BigDecimal person) {
        this.person = person;
    }
}
