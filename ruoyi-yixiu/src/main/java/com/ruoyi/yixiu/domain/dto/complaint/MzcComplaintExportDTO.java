package com.ruoyi.yixiu.domain.dto.complaint;

import io.swagger.annotations.ApiModelProperty;

public class MzcComplaintExportDTO {

    @ApiModelProperty(value = "投诉id")
    private Long complaint_id;

    @ApiModelProperty(value = "分页",example = "1")
    private Integer pageNum;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

}
