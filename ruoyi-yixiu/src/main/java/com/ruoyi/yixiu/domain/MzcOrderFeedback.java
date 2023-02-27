package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 反馈单对象 mzc_order_feedback
 * 
 * @author mmmmnd
 * @date 2023-02-26
 */
public class MzcOrderFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 反馈单id */
    private Long feedbackId;

    /** 维修开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "维修开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date maintenanceStartTime;

    /** 维修结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "维修结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date maintenanceEndTime;

    /** 保修时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "保修时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date warrantyPeriod;

    /** 设备检测 */
    @Excel(name = "设备检测")
    private String equipmentInspection;

    /*处理结果*/
    private String feedbackResult;

    /** 总价 */
    @Excel(name = "总价")
    private BigDecimal totalPrice;

    /** 报价时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报价时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date quotationDate;

    /** 报价人 */
    @Excel(name = "报价人")
    private String offeror;

    /** 删除人 */
    @Excel(name = "删除人")
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setFeedbackId(Long feedbackId) 
    {
        this.feedbackId = feedbackId;
    }

    public Long getFeedbackId() 
    {
        return feedbackId;
    }
    public void setMaintenanceStartTime(Date maintenanceStartTime) 
    {
        this.maintenanceStartTime = maintenanceStartTime;
    }

    public Date getMaintenanceStartTime() 
    {
        return maintenanceStartTime;
    }
    public void setMaintenanceEndTime(Date maintenanceEndTime) 
    {
        this.maintenanceEndTime = maintenanceEndTime;
    }

    public Date getMaintenanceEndTime() 
    {
        return maintenanceEndTime;
    }
    public void setWarrantyPeriod(Date warrantyPeriod) 
    {
        this.warrantyPeriod = warrantyPeriod;
    }

    public Date getWarrantyPeriod() 
    {
        return warrantyPeriod;
    }
    public void setEquipmentInspection(String equipmentInspection) 
    {
        this.equipmentInspection = equipmentInspection;
    }

    public String getEquipmentInspection() 
    {
        return equipmentInspection;
    }

    public String getFeedbackResult() {
        return feedbackResult;
    }

    public void setFeedbackResult(String feedbackResult) {
        this.feedbackResult = feedbackResult;
    }

    public void setTotalPrice(BigDecimal totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getTotalPrice() 
    {
        return totalPrice;
    }
    public void setQuotationDate(Date quotationDate) 
    {
        this.quotationDate = quotationDate;
    }

    public Date getQuotationDate() 
    {
        return quotationDate;
    }
    public void setOfferor(String offeror) 
    {
        this.offeror = offeror;
    }

    public String getOfferor() 
    {
        return offeror;
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
            .append("feedbackId", getFeedbackId())
            .append("maintenanceStartTime", getMaintenanceStartTime())
            .append("maintenanceEndTime", getMaintenanceEndTime())
            .append("warrantyPeriod", getWarrantyPeriod())
            .append("equipmentInspection", getEquipmentInspection())
            .append("totalPrice", getTotalPrice())
            .append("quotationDate", getQuotationDate())
            .append("offeror", getOfferor())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
