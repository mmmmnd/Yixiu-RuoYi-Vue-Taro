package com.ruoyi.yixiu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 接单对象 mzc_receiving
 * 
 * @author mmmmnd
 * @date 2023-02-21
 */
public class MzcReceiving extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 接单id */
    private Long receivingId;

    /** 订单id */
    private Long orderId;

    /** 接单用户id */
    private Long userId;

    /** 状态 */
    private String status;

    /** 删除者 */
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setReceivingId(Long receivingId) 
    {
        this.receivingId = receivingId;
    }

    public Long getReceivingId() 
    {
        return receivingId;
    }
    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("receivingId", getReceivingId())
            .append("orderId", getOrderId())
            .append("userId", getUserId())
            .append("status", getStatus())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
