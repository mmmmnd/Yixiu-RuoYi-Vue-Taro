package com.ruoyi.yixiu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 配件申请对象 mzc_parts
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public class MzcParts extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 配件id */
    @ApiModelProperty(value = "配件id")
    private Long partsId;

    /** 配件名称 */
    @ApiModelProperty(value = "配件名称")
    @Excel(name = "配件名称")
    private String name;

    /** 配件型号 */
    @ApiModelProperty(value = "配件型号")
    @Excel(name = "配件型号")
    private String model;

    /** 配件数量 */
    @ApiModelProperty(value = "配件数量")
    @Excel(name = "配件数量")
    private Long number;

    /** 用途 */
    @ApiModelProperty(value = "用途")
    @Excel(name = "用途")
    private String purpose;

    /** 是否急需 ( 0 false 1 true ) */
    @ApiModelProperty(value = "是否急需 ( 0 false 1 true )")
    @Excel(name = "是否急需 ( 0 false 1 true )")
    private Integer needStatus;

    /** 采购人 */
    @Excel(name = "采购人")
    @ApiModelProperty(value = "采购人")
    private String purchaseName;

    /** 审核状态（ 0 未审核 1 已审核 2未通过 ） */
    @ApiModelProperty(value = "审核状态（ 0 未审核 1 已审核 2未通过 ）")
    @Excel(name = "审核状态", readConverterExp = "0=,未=审核,1=,已=审核,2=未通过")
    private String auditStatus;

    /** 审核意见 */
    @Excel(name = "审核意见")
    @ApiModelProperty(value = "审核意见")
    private String auditOpinion;

    /** 审核人 */
    @Excel(name = "审核人")
    @ApiModelProperty(value = "审核人")
    private String auditBy;

    /** 审核时间 */
    @ApiModelProperty(value = "审核时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date auditTime;

    /** 状态 */
    @ApiModelProperty(value = "状态")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    public void setPartsId(Long partsId) 
    {
        this.partsId = partsId;
    }

    public Long getPartsId() 
    {
        return partsId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setModel(String model) 
    {
        this.model = model;
    }

    public String getModel() 
    {
        return model;
    }
    public void setNumber(Long number) 
    {
        this.number = number;
    }

    public Long getNumber() 
    {
        return number;
    }
    public void setPurpose(String purpose) 
    {
        this.purpose = purpose;
    }

    public String getPurpose() 
    {
        return purpose;
    }
    public void setNeedStatus(Integer needStatus) 
    {
        this.needStatus = needStatus;
    }

    public Integer getNeedStatus() 
    {
        return needStatus;
    }
    public void setPurchaseName(String purchaseName) 
    {
        this.purchaseName = purchaseName;
    }

    public String getPurchaseName() 
    {
        return purchaseName;
    }
    public void setAuditStatus(String auditStatus) 
    {
        this.auditStatus = auditStatus;
    }

    public String getAuditStatus() 
    {
        return auditStatus;
    }
    public void setAuditOpinion(String auditOpinion) 
    {
        this.auditOpinion = auditOpinion;
    }

    public String getAuditOpinion() 
    {
        return auditOpinion;
    }
    public void setAuditBy(String auditBy) 
    {
        this.auditBy = auditBy;
    }

    public String getAuditBy() 
    {
        return auditBy;
    }
    public void setAuditTime(Date auditTime) 
    {
        this.auditTime = auditTime;
    }

    public Date getAuditTime() 
    {
        return auditTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    public void setDeleteBy(String deleteBy) 
    {
        this.deleteBy = deleteBy;
    }

    public String getDeleteBy() 
    {
        return deleteBy;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("partsId", getPartsId())
            .append("name", getName())
            .append("model", getModel())
            .append("number", getNumber())
            .append("purpose", getPurpose())
            .append("needStatus", getNeedStatus())
            .append("purchaseName", getPurchaseName())
            .append("auditStatus", getAuditStatus())
            .append("auditOpinion", getAuditOpinion())
            .append("auditBy", getAuditBy())
            .append("auditTime", getAuditTime())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
