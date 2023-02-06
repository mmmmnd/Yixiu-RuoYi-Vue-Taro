package com.ruoyi.yixiu.domain.dto.complaint;

import io.swagger.annotations.ApiModelProperty;

public class MzcComplaintEditDTO {

    @ApiModelProperty(value = "备注")
    private String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
