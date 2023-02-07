package com.ruoyi.yixiu.domain.dto.reimbursement;

import io.swagger.annotations.ApiModelProperty;

public class MzcReimbursementAuditDTO {

    @ApiModelProperty(value = "报销id")
    private Long reimbursement_id;

    @ApiModelProperty(value = "状态 (0 未审核 1已审核 2未通过)")
    private String status;

    public Long getReimbursement_id() {
        return reimbursement_id;
    }

    public void setReimbursement_id(Long reimbursement_id) {
        this.reimbursement_id = reimbursement_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
