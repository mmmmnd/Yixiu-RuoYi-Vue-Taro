package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 供应商对象 mzc_supplier
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public class MzcSupplier extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 供应商id */
    @ApiModelProperty(value = "供应商id")
    private Long supplierId;

    /** 供应商名称 */
    @ApiModelProperty(value = "供应商名称")
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 联系人 */
    @ApiModelProperty(value = "联系人")
    @Excel(name = "联系人")
    private String nickname;

    /** 联系电话 */
    @ApiModelProperty(value = "联系电话")
    @Excel(name = "联系电话")
    private String phone;

    /** 状态 (0 存在 1不存在 ) */
    @ApiModelProperty(value = "状态 (0 存在 1不存在 ) ")
    private String stauts;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    public void setSupplierId(Long supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Long getSupplierId() 
    {
        return supplierId;
    }
    public void setSupplierName(String supplierName) 
    {
        this.supplierName = supplierName;
    }

    public String getSupplierName() 
    {
        return supplierName;
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
    public void setStauts(String stauts) 
    {
        this.stauts = stauts;
    }

    public String getStauts() 
    {
        return stauts;
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
            .append("supplierId", getSupplierId())
            .append("supplierName", getSupplierName())
            .append("nickname", getNickname())
            .append("phone", getPhone())
            .append("stauts", getStauts())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createTime", getCreateTime())
            .append("createBy", getCreateBy())
            .append("updateTime", getUpdateTime())
            .append("updateBy", getUpdateBy())
            .toString();
    }
}
