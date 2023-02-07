package com.ruoyi.yixiu.domain.dto.inventory;

import io.swagger.annotations.ApiModelProperty;

public class MzcInventoryExportDTO {

    @ApiModelProperty(value = "配件id",example = "20")
    private Long inventoryId;

    @ApiModelProperty(value = "行数",example = "20")
    private Integer pageSize;

    @ApiModelProperty(value = "配件名")
    private String name;

    public Long getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(Long inventoryId) {
        this.inventoryId = inventoryId;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
