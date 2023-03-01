package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 投诉对象 mzc_complaint
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public class MzcComplaint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 投诉id */
    @ApiModelProperty(value = "投诉id")
    @Excel(name = "投诉id")
    private Long complaintId;

    /** 订单id */
    @ApiModelProperty(value = "订单id")
    @Excel(name = "订单id")
    private Long orderId;

    /** 设备id */
    @ApiModelProperty(value = "设备id")
    @Excel(name = "设备id")
    private Long equipmentId;

    /** 设备名 */
    @ApiModelProperty(value = "设备名")
    @Excel(name = "设备名")
    private String equipmentName;

    /** 投诉类型 （0 普通投诉 1 订单投诉） */
    @ApiModelProperty(value = "投诉类型 （0 普通投诉 1 订单投诉）")
    @Excel(name = "投诉类型 ", readConverterExp = "0=,普=通投诉,1=,订=单投诉")
    private String complaintType;

    /** 投诉人 */
    @ApiModelProperty(value = "投诉人")
    @Excel(name = "投诉人")
    private String nickname;

    /** 联系电话 */
    @ApiModelProperty(value = "联系电话")
    @Excel(name = "联系电话")
    private String phone;

    /** 状态 （0 未处理 1已处理） */
    @ApiModelProperty(value = "状态 （0 未处理 1已处理）")
    @Excel(name = "状态 ", readConverterExp = "0=,未=处理,1=已处理")
    private String status;

    /*标题*/
    @ApiModelProperty(value = "标题")
    @Excel(name = "标题")
    private String title;

    /*系统回复*/
    @ApiModelProperty(value = "系统回复")
    @Excel(name = "系统回复")
    private String reply;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    public void setComplaintId(Long complaintId) 
    {
        this.complaintId = complaintId;
    }

    public Long getComplaintId() 
    {
        return complaintId;
    }
    public void setOrderId(Long orderId) 
    {
        this.orderId = orderId;
    }

    public Long getOrderId() 
    {
        return orderId;
    }

    public Long getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Long equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public void setComplaintType(String complaintType)
    {
        this.complaintType = complaintType;
    }

    public String getComplaintType() 
    {
        return complaintType;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
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
            .append("complaintId", getComplaintId())
            .append("orderId", getOrderId())
            .append("complaintType", getComplaintType())
            .append("nickname", getNickname())
            .append("phone", getPhone())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
