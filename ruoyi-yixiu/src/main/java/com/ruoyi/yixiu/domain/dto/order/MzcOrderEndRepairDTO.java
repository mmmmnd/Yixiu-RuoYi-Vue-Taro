package com.ruoyi.yixiu.domain.dto.order;

public class MzcOrderEndRepairDTO {

    private Long orderId;

    private String feedbackResult;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getFeedbackResult() {
        return feedbackResult;
    }

    public void setFeedbackResult(String feedbackResult) {
        this.feedbackResult = feedbackResult;
    }
}
