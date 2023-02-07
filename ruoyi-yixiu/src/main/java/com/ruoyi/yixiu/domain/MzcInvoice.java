package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 发票对象 mzc_invoice
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public class MzcInvoice extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 发票id */
    @Excel(name = "发票id")
    private Long invoiceId;

    /** 单位id */
    @Excel(name = "单位名称")
    private Long deptName;

    /** 税号 */
    @Excel(name = "税号")
    private String dutyParagraph;

    /** 项目 */
    @Excel(name = "项目")
    private String project;

    /** 开票金额 */
    @Excel(name = "开票金额")
    private BigDecimal price;

    /** 驳回时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "驳回时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date rejectTime;

    /** 状态 (0 未开票 1 已开票 2已驳回) */
    @Excel(name = "状态 (0 未开票 1 已开票 2已驳回)")
    private String status;

    /** 驳回理由 */
    @Excel(name = "驳回理由")
    private String remake;

    /** 删除者 */
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setInvoiceId(Long invoiceId) 
    {
        this.invoiceId = invoiceId;
    }

    public Long getInvoiceId() 
    {
        return invoiceId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getDeptName() {
        return deptName;
    }

    public void setDeptName(Long deptName) {
        this.deptName = deptName;
    }

    public void setDutyParagraph(String dutyParagraph)
    {
        this.dutyParagraph = dutyParagraph;
    }

    public String getDutyParagraph() 
    {
        return dutyParagraph;
    }
    public void setProject(String project) 
    {
        this.project = project;
    }

    public String getProject() 
    {
        return project;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setRejectTime(Date rejectTime) 
    {
        this.rejectTime = rejectTime;
    }

    public Date getRejectTime() 
    {
        return rejectTime;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setRemake(String remake) 
    {
        this.remake = remake;
    }

    public String getRemake() 
    {
        return remake;
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
            .append("invoiceId", getInvoiceId())
            .append("deptName", getDeptName())
            .append("dutyParagraph", getDutyParagraph())
            .append("project", getProject())
            .append("price", getPrice())
            .append("rejectTime", getRejectTime())
            .append("status", getStatus())
            .append("remake", getRemake())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
