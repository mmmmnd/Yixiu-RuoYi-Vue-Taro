package com.ruoyi.yixiu.domain;

import io.swagger.annotations.ApiModelProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 不良事件对象 mzc_burst
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public class MzcBurst extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 不良情况id */
    @ApiModelProperty(value = "单位id")
    private Long burstId;

    /** 单位id */
    @ApiModelProperty(value = "单位id")
    @Excel(name = "单位id")
    private Long deptId;

    /** 标题 */
    @ApiModelProperty(value = "标题")
    @Excel(name = "标题")
    private String title;

    /** 状态 */
    @ApiModelProperty(value = "状态")
    private String status;

    @ApiModelProperty(value = "备注")
    private String remark;

    /** 删除者 */
    @ApiModelProperty(value = "删除者")
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    @ApiModelProperty(value = "删除标志（0代表存在 2代表删除）")
    private String delFlag;

    public void setBurstId(Long burstId) 
    {
        this.burstId = burstId;
    }

    public Long getBurstId() 
    {
        return burstId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
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
            .append("burstId", getBurstId())
            .append("deptId", getDeptId())
            .append("title", getTitle())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("deleteBy", getDeleteBy())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
