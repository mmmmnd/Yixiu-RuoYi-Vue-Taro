package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单配件对象 mzc_order_parts
 * 
 * @author mmmmnd
 * @date 2023-02-26
 */
public class MzcOrderParts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单配件id */
    private Long partsId;

    /*反馈单id*/
    @Excel(name = "反馈单id")
    private Long feedbackId;

    /** 配件型号 */
    @Excel(name = "配件型号")
    private String partsModel;

    /** 配件名 */
    @Excel(name = "配件名")
    private String partsName;

    /** 数量 */
    @Excel(name = "数量")
    private Long number;

    /** 单位 */
    @Excel(name = "单位")
    private String unit;

    /** 配件价格 */
    @Excel(name = "配件价格")
    private BigDecimal partsPrice;

    /** 维修价格 */
    @Excel(name = "维修价格")
    private BigDecimal maintenancePrice;

    /** 单价 */
    @Excel(name = "单价")
    private BigDecimal unitPrice;

    /** 优惠价 */
    @Excel(name = "优惠价")
    private BigDecimal preferentialPrice;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setPartsId(Long partsId) 
    {
        this.partsId = partsId;
    }

    public Long getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Long feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Long getPartsId()
    {
        return partsId;
    }
    public void setPartsModel(String partsModel) 
    {
        this.partsModel = partsModel;
    }

    public String getPartsModel() 
    {
        return partsModel;
    }
    public void setPartsName(String partsName) 
    {
        this.partsName = partsName;
    }

    public String getPartsName() 
    {
        return partsName;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setPartsPrice(BigDecimal partsPrice) 
    {
        this.partsPrice = partsPrice;
    }

    public BigDecimal getPartsPrice() 
    {
        return partsPrice;
    }
    public void setMaintenancePrice(BigDecimal maintenancePrice) 
    {
        this.maintenancePrice = maintenancePrice;
    }

    public BigDecimal getMaintenancePrice() 
    {
        return maintenancePrice;
    }
    public void setUnitPrice(BigDecimal unitPrice) 
    {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getUnitPrice() 
    {
        return unitPrice;
    }
    public void setPreferentialPrice(BigDecimal preferentialPrice) 
    {
        this.preferentialPrice = preferentialPrice;
    }

    public BigDecimal getPreferentialPrice() 
    {
        return preferentialPrice;
    }
    public void setDeleteBy(String deleteBy) 
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy() 
    {
        return deleteBy;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("partsId", getPartsId())
            .append("partsModel", getPartsModel())
            .append("partsName", getPartsName())
            .append("number", getNumber())
            .append("unit", getUnit())
            .append("partsPrice", getPartsPrice())
            .append("maintenancePrice", getMaintenancePrice())
            .append("unitPrice", getUnitPrice())
            .append("preferentialPrice", getPreferentialPrice())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
