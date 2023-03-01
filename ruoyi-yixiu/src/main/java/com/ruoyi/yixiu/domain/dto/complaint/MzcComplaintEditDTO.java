package com.ruoyi.yixiu.domain.dto.complaint;

import io.swagger.annotations.ApiModelProperty;

public class MzcComplaintEditDTO {

    @ApiModelProperty(value = "投诉id")
    private Long complaintId;

    @ApiModelProperty(value = "备注")
    private String remark;

    public Long getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(Long complaintId) {
        this.complaintId = complaintId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
