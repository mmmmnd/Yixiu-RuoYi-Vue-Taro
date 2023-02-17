package com.ruoyi.yixiu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 轮播图对象 mzc_swiper
 * 
 * @author mmmmnd
 * @date 2023-02-17
 */
public class MzcSwiper extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 轮播id */
    private Long swiperId;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String filePath;

    /** 远程路径 */
    private String remotePath;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 状态 */
    private String status;

    /** 删除者 */
    private String deleteBy;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setSwiperId(Long swiperId) 
    {
        this.swiperId = swiperId;
    }

    public Long getSwiperId() 
    {
        return swiperId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setFilePath(String filePath) 
    {
        this.filePath = filePath;
    }

    public String getFilePath() 
    {
        return filePath;
    }
    public void setRemotePath(String remotePath) 
    {
        this.remotePath = remotePath;
    }

    public String getRemotePath() 
    {
        return remotePath;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
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
            .append("swiperId", getSwiperId())
            .append("title", getTitle())
            .append("filePath", getFilePath())
            .append("remotePath", getRemotePath())
            .append("sort", getSort())
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
