package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcTool;

/**
 * 工具Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface IMzcToolService 
{
    /**
     * 查询工具
     * 
     * @param toolId 工具主键
     * @return 工具
     */
    public MzcTool selectMzcToolByToolId(Long toolId);

    /**
     * 查询工具列表
     * 
     * @param mzcTool 工具
     * @return 工具集合
     */
    public List<MzcTool> selectMzcToolList(MzcTool mzcTool);

    /**
     * 新增工具
     * 
     * @param mzcTool 工具
     * @return 结果
     */
    public int insertMzcTool(MzcTool mzcTool);

    /**
     * 修改工具
     * 
     * @param mzcTool 工具
     * @return 结果
     */
    public int updateMzcTool(MzcTool mzcTool);

    /**
     * 批量删除工具
     * 
     * @param toolIds 需要删除的工具主键集合
     * @return 结果
     */
    public int deleteMzcToolByToolIds(Long[] toolIds);

    /**
     * 删除工具信息
     * 
     * @param toolId 工具主键
     * @return 结果
     */
    public int deleteMzcToolByToolId(Long toolId);
}
