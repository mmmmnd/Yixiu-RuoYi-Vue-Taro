package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcEquiScrap;
import com.ruoyi.yixiu.domain.MzcScrap;

/**
 * 设备报废关联Service接口
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public interface IMzcEquiScrapService 
{
    /**
     * 查询设备报废关联
     * 
     * @param equipmentId 设备报废关联主键
     * @return 设备报废关联
     */
    public MzcEquiScrap selectMzcEquiScrapByEquipmentId(Long equipmentId);

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
     * @param mzcScrap 报废列表
     */
    public void insertMzcEquiScrap(MzcScrap mzcScrap);

    /**
     * 修改设备报废关联
     * 
     * @param mzcEquiScrap 设备报废关联
     * @return 结果
     */
    public int updateMzcEquiScrap(MzcEquiScrap mzcEquiScrap);

    /**
     * 批量删除设备报废关联
     * 
     * @param scrapIds 需要删除的设备报废关联主键集合
     * @return 结果
     */
    public int deleteMzcEquiScrapByScrapIds(Long[] scrapIds);

    /**
     * 删除设备报废关联信息
     * 
     * @param scrapId 设备报废关联主键
     * @return 结果
     */
    public int deleteMzcEquiScrapByScrapId(Long scrapId);
}
