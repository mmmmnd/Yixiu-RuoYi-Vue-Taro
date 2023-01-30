package com.ruoyi.yixiu.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import javax.validation.constraints.NotNull;

/**
 * 设备列表对象 mzc_equipment
 * 
 * @author mmmmnd
 * @date 2023-01-24
 */
public class MzcEquipment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备id */
    private Long equipmentId;

    /** 设备关联单位id */
    @Excel(name = "设备关联单位id")
    private Long deptId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String equipmentName;

    /** 设备序列号 */
    @Excel(name = "设备序列号")
    private String serialNumber;

    /** 出厂编号 */
    @Excel(name = "出厂编号")
    private String factoryNumber;

    /** 设备型号 */
    @Excel(name = "设备型号")
    private String modelNumber;

    /** 品牌 */
    @Excel(name = "品牌")
    private String brand;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 购买时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "购买时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchaseTime;

    /** 报废时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报废时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date scrapTime;

    /** 保养预警 */
    @Excel(name = "保养预警")
    private String maintain;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /*删除者*/
    private String deleteBy;

    private SysDept dept;

    public void setEquipmentId(Long equipmentId) 
    {
        this.equipmentId = equipmentId;
    }

    public Long getEquipmentId() 
    {
        return equipmentId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setEquipmentName(String equipmentName) 
    {
        this.equipmentName = equipmentName;
    }

    @NotNull(message = "设备名称不能为空")
    public String getEquipmentName() 
    {
        return equipmentName;
    }
    public void setSerialNumber(String serialNumber) 
    {
        this.serialNumber = serialNumber;
    }

    public String getSerialNumber() 
    {
        return serialNumber;
    }
    public void setFactoryNumber(String factoryNumber) 
    {
        this.factoryNumber = factoryNumber;
    }

    public String getFactoryNumber() 
    {
        return factoryNumber;
    }
    public void setModelNumber(String modelNumber) 
    {
        this.modelNumber = modelNumber;
    }

    public String getModelNumber() 
    {
        return modelNumber;
    }
    public void setBrand(String brand) 
    {
        this.brand = brand;
    }

    public String getBrand() 
    {
        return brand;
    }
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
    }
    public void setPurchaseTime(Date purchaseTime) 
    {
        this.purchaseTime = purchaseTime;
    }

    public Date getPurchaseTime() 
    {
        return purchaseTime;
    }
    public void setScrapTime(Date scrapTime) 
    {
        this.scrapTime = scrapTime;
    }

    public Date getScrapTime() 
    {
        return scrapTime;
    }
    public void setMaintain(String maintain) 
    {
        this.maintain = maintain;
    }

    public String getMaintain() 
    {
        return maintain;
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

    public String getDeleteBy() {
        return deleteBy;
    }

    public void setDeleteBy(String deleteBy) {
        this.deleteBy = deleteBy;
    }

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("equipmentId", getEquipmentId())
            .append("deptId", getDeptId())
            .append("equipmentName", getEquipmentName())
            .append("serialNumber", getSerialNumber())
            .append("factoryNumber", getFactoryNumber())
            .append("modelNumber", getModelNumber())
            .append("brand", getBrand())
            .append("price", getPrice())
            .append("purchaseTime", getPurchaseTime())
            .append("scrapTime", getScrapTime())
            .append("maintain", getMaintain())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("deleteBy",  getDeleteBy())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("dept", getDept())
            .toString();
    }
}
