package com.ruoyi.yixiu.domain.dto.burst;

import io.swagger.annotations.ApiModelProperty;

public class MzcBurstAddDTO {

    @ApiModelProperty(value = "单位id")
    private Long deptId;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "备注")
    private String remark;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
