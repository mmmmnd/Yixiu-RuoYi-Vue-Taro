package com.ruoyi.yixiu.domain.dto.order;

import com.ruoyi.common.annotation.Excel;

public class MzcOrderAuditDTO {

    /** 订单id */
    private Long orderId;

    /** 申请科室意见 */
    private String applyDeptOpinion;

    /** 装备部意见 */
    private String equipmentOpinion;

    /** 分管院长审批意见 */
    private String subheadOpinion;

    /** 院长审批意见 */
    private String deanOpinion;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getApplyDeptOpinion() {
        return applyDeptOpinion;
    }

    public void setApplyDeptOpinion(String applyDeptOpinion) {
        this.applyDeptOpinion = applyDeptOpinion;
    }

    public String getEquipmentOpinion() {
        return equipmentOpinion;
    }

    public void setEquipmentOpinion(String equipmentOpinion) {
        this.equipmentOpinion = equipmentOpinion;
    }

    public String getSubheadOpinion() {
        return subheadOpinion;
    }

    public void setSubheadOpinion(String subheadOpinion) {
        this.subheadOpinion = subheadOpinion;
    }

    public String getDeanOpinion() {
        return deanOpinion;
    }

    public void setDeanOpinion(String deanOpinion) {
        this.deanOpinion = deanOpinion;
    }
}
