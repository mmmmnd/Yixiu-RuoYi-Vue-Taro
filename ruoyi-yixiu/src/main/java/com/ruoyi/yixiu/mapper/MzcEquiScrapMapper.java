package com.ruoyi.yixiu.mapper;

import java.util.List;

import com.ruoyi.system.domain.SysUserPost;
import com.ruoyi.yixiu.domain.MzcEquiScrap;

/**
 * 设备报废关联Mapper接口
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public interface MzcEquiScrapMapper 
{
    /**
     * 查询设备报废关联
     * 
     * @param equipmentId 设备报废关联主键
     * @return 设备报废关联
     */
    public MzcEquiScrap selectMzcEquiScrapByScrapId(Long equipmentId);

    /**
     * 查询设备报废关联列表
     * 
     * @param mzcEquiScrap 设备报废关联
     * @return 设备报废关联集合
     */
    public List<MzcEquiScrap> selectMzcEquiScrapList(MzcEquiScrap mzcEquiScrap);

    /**
     * 新增设备报废关联
     * 
     * @param mzcEquiScrap 设备报废关联
     * @return 结果
     */
    public int insertMzcEquiScrap(MzcEquiScrap mzcEquiScrap);

    /**
     * 批量新增设备报废关联
     * @param userPostList
     * @return 结果
     */
    public int batchMzcEquiScrap(List<MzcEquiScrap> userPostList);
    /**
     * 修改设备报废关联
     * 
     * @param mzcEquiScrap 设备报废关联
     * @return 结果
     */
    public int updateMzcEquiScrap(MzcEquiScrap mzcEquiScrap);

    /**
     * 删除设备报废关联
     * 
     * @param equipmentId 设备报废关联主键
     * @return 结果
     */
    public int deleteMzcEquiScrapByScrapId(Long equipmentId);

    /**
     * 批量删除设备报废关联
     * 
     * @param equipmentIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMzcEquiScrapByScrapIds(Long[] equipmentIds);
}
