package com.ruoyi.yixiu.domain.dto.parts;

import io.swagger.annotations.ApiModelProperty;

public class MzcPartsAuditDTO {

    @ApiModelProperty(value = "配件id")
    private Long partsId;

    @ApiModelProperty(value = "审核状态（ 0 未审核 1 已审核 2未通过 ）")
    private String auditStatus;

    @ApiModelProperty(value = "审核意见")
    private String auditOpinion;

    public Long getPartsId() {
        return partsId;
    }

    public void setPartsId(Long partsId) {
        this.partsId = partsId;
    }

    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }
}
