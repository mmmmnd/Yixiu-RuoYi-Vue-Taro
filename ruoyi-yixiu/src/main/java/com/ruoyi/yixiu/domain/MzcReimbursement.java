package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报销对象 mzc_reimbursement
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public class MzcReimbursement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报销id */
    private Long reimbursementId;

    /** 项目 */
    @Excel(name = "项目")
    private String project;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal price;

    /** 总金额 */
    @Excel(name = "总金额")
    private BigDecimal totalPrice;

    /** 负责人 */
    @Excel(name = "负责人")
    private String person;

    /** 状态 (0 未审核 1已审核 2未通过) */
    @Excel(name = "状态 (0 未审核 1已审核 2未通过)")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 删除者 */
    private String deleteBy;

    public void setReimbursementId(Long reimbursementId) 
    {
        this.reimbursementId = reimbursementId;
    }

    public Long getReimbursementId() 
    {
        return reimbursementId;
    }
    public void setProject(String project) 
    {
        this.project = project;
    }

    public String getProject() 
    {
        return project;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setTotalPrice(BigDecimal totalPrice) 
    {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getTotalPrice() 
    {
        return totalPrice;
    }
    public void setPerson(String person) 
    {
        this.person = person;
    }

    public String getPerson() 
    {
        return person;
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
            .append("reimbursementId", getReimbursementId())
            .append("project", getProject())
            .append("category", getCategory())
            .append("price", getPrice())
            .append("totalPrice", getTotalPrice())
            .append("person", getPerson())
            .append("stauts", getStatus())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
