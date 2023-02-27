package com.ruoyi.yixiu.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.yixiu.domain.MzcOrderParts;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class MzcOrderFeedbackInfoVO {

    private Long feedbackId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date maintenanceStartTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date maintenanceEndTime;

    private Date warrantyPeriod;

    private String equipmentInspection;

    private String feedbackResult;

    private BigDecimal totalPrice;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date quotationDate;

    private String offeror;

    private List<MzcOrderParts> orderParts;

    public Long getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Long feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Date getMaintenanceStartTime() {
        return maintenanceStartTime;
    }

    public void setMaintenanceStartTime(Date maintenanceStartTime) {
        this.maintenanceStartTime = maintenanceStartTime;
    }

    public Date getMaintenanceEndTime() {
        return maintenanceEndTime;
    }

    public void setMaintenanceEndTime(Date maintenanceEndTime) {
        this.maintenanceEndTime = maintenanceEndTime;
    }

    public Date getWarrantyPeriod() {
        return warrantyPeriod;
    }

    public void setWarrantyPeriod(Date warrantyPeriod) {
        this.warrantyPeriod = warrantyPeriod;
    }

    public String getEquipmentInspection() {
        return equipmentInspection;
    }

    public void setEquipmentInspection(String equipmentInspection) {
        this.equipmentInspection = equipmentInspection;
    }

    public String getFeedbackResult() {
        return feedbackResult;
    }

    public void setFeedbackResult(String feedbackResult) {
        this.feedbackResult = feedbackResult;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getQuotationDate() {
        return quotationDate;
    }

    public void setQuotationDate(Date quotationDate) {
        this.quotationDate = quotationDate;
    }

    public String getOfferor() {
        return offeror;
    }

    public void setOfferor(String offeror) {
        this.offeror = offeror;
    }

    public List<MzcOrderParts> getOrderParts() {
        return orderParts;
    }

    public void setOrderParts(List<MzcOrderParts> orderParts) {
        this.orderParts = orderParts;
    }
}
