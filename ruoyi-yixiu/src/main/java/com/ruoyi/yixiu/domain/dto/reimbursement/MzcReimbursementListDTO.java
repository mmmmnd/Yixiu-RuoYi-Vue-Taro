package com.ruoyi.yixiu.domain.dto.reimbursement;

import io.swagger.annotations.ApiModelProperty;

public class MzcReimbursementListDTO {

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "项目")
    private String project;

    @ApiModelProperty(value = "审核状态")
    private String status;

    @ApiModelProperty(value = "类型 （0全部，1申请中，2已通过，3驳回）")
    private Integer statusType;

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getStatusType() {
        return statusType;
    }

    public void setStatusType(Integer statusType) {
        this.statusType = statusType;
    }
}
