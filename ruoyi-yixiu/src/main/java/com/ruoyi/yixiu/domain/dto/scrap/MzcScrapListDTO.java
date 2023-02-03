package com.ruoyi.yixiu.domain.dto.scrap;

import io.swagger.annotations.ApiModelProperty;

public class MzcScrapListDTO {

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "状态 0正常 1失败 2通过")
    private String status;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
