package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备报废关联对象 mzc_equi_scrap
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public class MzcEquiScrap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备ID */
    @ApiModelProperty(value = "设备ID")
    private Long equipmentId;

    /** 报废ID */
    @ApiModelProperty(value = "报废ID")
    private Long scrapId;

    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setScrapId(Long scrapId) 
    {
        this.scrapId = scrapId;
    }

    public Long getScrapId() 
    {
        return scrapId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("equipmentId", getEquipmentId())
            .append("scrapId", getScrapId())
            .toString();
    }
}
