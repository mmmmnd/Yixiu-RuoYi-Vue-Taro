package com.ruoyi.yixiu.domain.dto.order;

import com.ruoyi.yixiu.domain.MzcOrderParts;

import java.math.BigDecimal;
import java.util.List;

public class MzcOrderFeedbackDTO {

    private Long orderId;

    private Long feedbackId;

    private BigDecimal totalPrice;

    private List<MzcOrderParts> orderParts;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Long feedbackId) {
        this.feedbackId = feedbackId;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public List<MzcOrderParts> getOrderParts() {
        return orderParts;
    }

    public void setOrderParts(List<MzcOrderParts> orderParts) {
        this.orderParts = orderParts;
    }
}
