package com.ruoyi.yixiu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 单页对象 mzc_singlepage
 * 
 * @author mmmmnd
 * @date 2023-03-03
 */
public class MzcSinglepage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 发布者 */
    private Long userId;

    /** 新闻标题 */
    @Excel(name = "新闻标题")
    private String title;

    /** 文章关键字 */
    @Excel(name = "文章关键字")
    private String keywords;

    /** 文章描述 */
    @Excel(name = "文章描述")
    private String description;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 封面 */
    @Excel(name = "封面")
    private String thumb;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 点击 */
    @Excel(name = "点击")
    private Integer clicks;

    /** 状态 */
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 删除者 */
    private String deleteBy;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setKeywords(String keywords) 
    {
        this.keywords = keywords;
    }

    public String getKeywords() 
    {
        return keywords;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setThumb(String thumb) 
    {
        this.thumb = thumb;
    }

    public String getThumb() 
    {
        return thumb;
    }
    public void setSort(Long sort) 
    {
        this.sort = sort;
    }

    public Long getSort() 
    {
        return sort;
    }
    public void setClicks(Integer clicks) 
    {
        this.clicks = clicks;
    }

    public Integer getClicks() 
    {
        return clicks;
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
            .append("id", getId())
            .append("userId", getUserId())
            .append("title", getTitle())
            .append("keywords", getKeywords())
            .append("description", getDescription())
            .append("content", getContent())
            .append("thumb", getThumb())
            .append("sort", getSort())
            .append("clicks", getClicks())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("deleteBy", getDeleteBy())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
