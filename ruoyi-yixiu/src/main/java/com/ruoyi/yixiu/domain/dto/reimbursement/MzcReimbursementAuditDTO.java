package com.ruoyi.yixiu.domain.dto.reimbursement;

import io.swagger.annotations.ApiModelProperty;

public class MzcReimbursementAuditDTO {

    @ApiModelProperty(value = "报销id")
    private Long reimbursementId;

    @ApiModelProperty(value = "状态 (0 未审核 1已审核 2未通过)")
    private String status;

    @ApiModelProperty(value = "状态 (0 未审核 1已审核 2未通过)")
    private String remark;

    public Long getReimbursementId() {
        return reimbursementId;
    }

    public void setReimbursementId(Long reimbursementId) {
        this.reimbursementId = reimbursementId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
