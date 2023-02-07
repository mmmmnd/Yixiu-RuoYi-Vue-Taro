package com.ruoyi.yixiu.domain.dto.inventory;

import io.swagger.annotations.ApiModelProperty;

public class MzcInventoryEditDTO {

    @ApiModelProperty(value = "配件名")
    private Long inventoryId;

    @ApiModelProperty(value = "配件名")
    private String name;

    @ApiModelProperty(value = "配件型号")
    private String model;

    @ApiModelProperty(value = "数量")
    private Long number;

    public Long getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(Long inventoryId) {
        this.inventoryId = inventoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public Long getNumber() {
        return number;
    }

    public void setNumber(Long number) {
        this.number = number;
    }
}
