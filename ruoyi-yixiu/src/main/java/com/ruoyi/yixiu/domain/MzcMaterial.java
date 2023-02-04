package com.ruoyi.yixiu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 耗材对象 mzc_material
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public class MzcMaterial extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 耗材id */
    private Long materialId;

    /** 设备id */
    @Excel(name = "设备id")
    private Long equipmentId;

    /** 供应商 */
    @Excel(name = "供应商")
    private Long supplierId;

    /** 耗材名称 */
    @Excel(name = "耗材名称")
    private String materialName;

    /** 品牌 */
    @Excel(name = "品牌")
    private String brand;

    /** 耗材类型 ( 0 普通耗材 1专用耗材 ) */
    @Excel(name = "耗材类型 ( 0 普通耗材 1专用耗材 )")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 删除者 */
    private String deleteBy;

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setSupplierId(Long supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Long getSupplierId() 
    {
        return supplierId;
    }
    public void setMaterialName(String materialName) 
    {
        this.materialName = materialName;
    }

    public String getMaterialName() 
    {
        return materialName;
    }
    public void setBrand(String brand) 
    {
        this.brand = brand;
    }

    public String getBrand() 
    {
        return brand;
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
            .append("materialId", getMaterialId())
            .append("equipmentId", getEquipmentId())
            .append("supplierId", getSupplierId())
            .append("materialName", getMaterialName())
            .append("brand", getBrand())
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
