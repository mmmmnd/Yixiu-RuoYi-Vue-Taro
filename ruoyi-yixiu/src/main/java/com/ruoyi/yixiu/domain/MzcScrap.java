package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.List;

/**
 * 报废申请对象 mzc_scrap
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public class MzcScrap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报废id */
    private Long scrapId;

    /** 报废关联单位id */
    @Excel(name = "报废关联单位id")
    private Long deptId;

    /** 报废编号 */
    @Excel(name = "报废编号")
    private String number;

    /** 联系人 */
    @Excel(name = "联系人")
    private String nickname;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 报废原因 */
    @Excel(name = "报废原因")
    private String cause;

    /** 报废情况记录 */
    @Excel(name = "报废情况记录")
    private String record;

    /** 部门意见 */
    @Excel(name = "部门意见")
    private String depaOpinion;

    /** 设备部门意见 */
    @Excel(name = "设备部门意见")
    private String equipmentOpinion;

    /** 院长意见 */
    @Excel(name = "院长意见")
    private String presidentOpinion;

    /** 分院长意见 */
    @Excel(name = "分院长意见")
    private String subPresident;

    /** 状态（0正常 1失败 2通过） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=失败,2=通过")
    private String status;

    /** 删除者 */
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /*当前单位名称*/
    private String deptName;

    /** 父部门名称 */
    private String parentName;

    /*设备列表*/
    private List<MzcEquipment> equipment;

    /*设备列表选中*/
    private List<Long> equipmentIds;

    public void setScrapId(Long scrapId) 
    {
        this.scrapId = scrapId;
    }

    public Long getScrapId() 
    {
        return scrapId;
    }
    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }
    public void setNumber(String number)
    {
        this.number = number;
    }

    public String getNumber() 
    {
        return number;
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
    public void setCause(String cause) 
    {
        this.cause = cause;
    }

    public String getCause() 
    {
        return cause;
    }
    public void setRecord(String record) 
    {
        this.record = record;
    }

    public String getRecord() 
    {
        return record;
    }
    public void setDepaOpinion(String depaOpinion) 
    {
        this.depaOpinion = depaOpinion;
    }

    public String getDepaOpinion() 
    {
        return depaOpinion;
    }
    public void setEquipmentOpinion(String equipmentOpinion) 
    {
        this.equipmentOpinion = equipmentOpinion;
    }

    public String getEquipmentOpinion() 
    {
        return equipmentOpinion;
    }
    public void setPresidentOpinion(String presidentOpinion) 
    {
        this.presidentOpinion = presidentOpinion;
    }

    public String getPresidentOpinion() 
    {
        return presidentOpinion;
    }
    public void setSubPresident(String subPresident) 
    {
        this.subPresident = subPresident;
    }

    public String getSubPresident() 
    {
        return subPresident;
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
    public List<MzcEquipment> getEquipment() {
        return equipment;
    }

    public void setEquipment(List<MzcEquipment> equipment) {
        this.equipment = equipment;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<Long> getEquipmentIds() {
        return equipmentIds;
    }

    public void setEquipmentIds(List<Long> equipmentIds) {
        this.equipmentIds = equipmentIds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("scrapId", getScrapId())
            .append("deptId", getDeptId())
            .append("number", getNumber())
            .append("nickname", getNickname())
            .append("phone", getPhone())
            .append("cause", getCause())
            .append("record", getRecord())
            .append("depaOpinion", getDepaOpinion())
            .append("equipmentOpinion", getEquipmentOpinion())
            .append("presidentOpinion", getPresidentOpinion())
            .append("subPresident", getSubPresident())
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
