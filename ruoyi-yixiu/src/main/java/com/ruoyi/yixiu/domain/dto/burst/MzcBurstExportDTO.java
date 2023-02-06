package com.ruoyi.yixiu.domain.dto.burst;

import io.swagger.annotations.ApiModelProperty;

public class MzcBurstExportDTO {
    @ApiModelProperty(value = "不良情况id")
    private Long burstId;

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    public Long getBurstId() {
        return burstId;
    }

    public void setBurstId(Long burstId) {
        this.burstId = burstId;
    }

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
}
