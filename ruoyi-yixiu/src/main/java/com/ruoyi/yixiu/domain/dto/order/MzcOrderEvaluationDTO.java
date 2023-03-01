package com.ruoyi.yixiu.domain.dto.order;

public class MzcOrderEvaluationDTO {

    private Long orderId;

    private String appraiseName;

    private Integer appraise;

    private String appraiseOpinion;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getAppraiseName() {
        return appraiseName;
    }

    public void setAppraiseName(String appraiseName) {
        this.appraiseName = appraiseName;
    }

    public Integer getAppraise() {
        return appraise;
    }

    public void setAppraise(Integer appraise) {
        this.appraise = appraise;
    }

    public String getAppraiseOpinion() {
        return appraiseOpinion;
    }

    public void setAppraiseOpinion(String appraiseOpinion) {
        this.appraiseOpinion = appraiseOpinion;
    }
}
