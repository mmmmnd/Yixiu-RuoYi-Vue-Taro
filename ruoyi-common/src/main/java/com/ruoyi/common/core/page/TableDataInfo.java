package com.ruoyi.common.core.page;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.List;

/**
 * 表格分页数据对象
 * 
 * @author ruoyi
 */
public class TableDataInfo<T> implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 总记录数 */
    @ApiModelProperty(value = "总记录数")
    private long total;

    /*当前页*/
    @ApiModelProperty(value = "当前页")
    private Integer currentPage;

    /*总计页面*/
    @ApiModelProperty(value = "总计页面")
    private Integer totalPages;

    /** 列表数据 */
    @ApiModelProperty(value = "列表数据")
    private List<T> rows;

    /** 消息状态码 */
    @ApiModelProperty(value = "消息状态码")
    private int code;

    /** 消息内容 */
    @ApiModelProperty(value = "消息内容")
    private String msg;

    /**
     * 表格数据对象
     */
    public TableDataInfo()
    {
    }

    /**
     * 分页
     * 
     * @param list 列表数据
     * @param total 总记录数
     */
    public TableDataInfo(List<T> list, int total)
    {
        this.rows = list;
        this.total = total;
    }

    public long getTotal()
    {
        return total;
    }

    public void setTotal(long total)
    {
        this.total = total;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getRows()
    {
        return rows;
    }

    public void setRows(List<T> rows)
    {
        this.rows = rows;
    }

    public int getCode()
    {
        return code;
    }

    public void setCode(int code)
    {
        this.code = code;
    }

    public String getMsg()
    {
        return msg;
    }

    public void setMsg(String msg)
    {
        this.msg = msg;
    }
}
