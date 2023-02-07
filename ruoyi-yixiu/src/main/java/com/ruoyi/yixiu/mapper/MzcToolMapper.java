package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcTool;
import org.apache.ibatis.annotations.Param;

/**
 * 工具Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface MzcToolMapper
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
     * 删除工具
     *
     * @param toolId 工具主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcToolByToolId(@Param("toolId") Long toolId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除工具
     *
     * @param toolIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcToolByToolIds(@Param("toolIds") Long[] toolIds, @Param("deleteByName") String deleteByName);
}
