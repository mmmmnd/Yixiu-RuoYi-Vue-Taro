package com.ruoyi.yixiu.domain.dto.parts;

import io.swagger.annotations.ApiModelProperty;

public class MzcPartsListDTO {

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "是否急需")
    private Integer needStatus;

    @ApiModelProperty(value = "审核状态（ 0 未审核 1 已审核 2未通过 ）")
    private String auditStatus;

    @ApiModelProperty(value = "类型 （0 全部，1待审核，2已审核，3未通过）")
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

    public Integer getNeedStatus() {
        return needStatus;
    }

    public void setNeedStatus(Integer needStatus) {
        this.needStatus = needStatus;
    }

    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getStatusType() {
        return statusType;
    }

    public void setStatusType(Integer statusType) {
        this.statusType = statusType;
    }
}
