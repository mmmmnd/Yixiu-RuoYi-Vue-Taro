package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 配件清单对象 mzc_inventory
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public class MzcInventory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配件id */
    @ApiModelProperty(value = "配件id")
    private Long inventoryId;

    /** 配件名 */
    @ApiModelProperty(value = "配件名")
    @Excel(name = "配件名")
    private String name;

    /** 配件型号 */
    @ApiModelProperty(value = "配件型号")
    @Excel(name = "配件型号")
    private String model;

    /** 数量 */
    @ApiModelProperty(value = "数量")
    @Excel(name = "数量")
    private Long number;

    /** 状态 (0 存在 1不存在 ) */
    @ApiModelProperty(value = "状态 (0 存在 1不存在 )")
    private String stauts;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    public void setInventoryId(Long inventoryId) 
    {
        this.inventoryId = inventoryId;
    }

    public Long getInventoryId() 
    {
        return inventoryId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setStauts(String stauts) 
    {
        this.stauts = stauts;
    }

    public String getStauts() 
    {
        return stauts;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setDeleteBy(String deleteBy) 
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy() 
    {
        return deleteBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("inventoryId", getInventoryId())
            .append("name", getName())
            .append("model", getModel())
            .append("number", getNumber())
            .append("stauts", getStauts())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
