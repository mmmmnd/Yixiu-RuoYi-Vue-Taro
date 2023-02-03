package com.ruoyi.yixiu.service;

import com.ruoyi.yixiu.domain.MzcEquipment;

import java.util.List;

/**
 * 设备列表Service接口
 * 
 * @author mmmmnd
 * @date 2023-01-24
 */
public interface IMzcEquipmentService 
{
    /**
     * 查询设备列表
     * 
     * @param equipmentId 设备列表主键
     * @return 设备列表
     */
    public MzcEquipment selectMzcEquipmentByEquipmentId(Long equipmentId);

    /**
     * 查询设备列表列表
     * 
     * @param mzcEquipment 设备列表
     * @return 设备列表集合
     */
    public List<MzcEquipment> selectMzcEquipmentList(MzcEquipment mzcEquipment);

    /**
     * 通过报废id查询关联下的设备
     *
     * @param scrapId 报废id
     * @return 报废关联设备
     */
    public List<MzcEquipment> selectMzcScrapByScrapId(Long scrapId);

    /**
     * 通过单位id获取设备列表
     *
     * @param deptId 单位id
     * @return 单位设备列表
     */
    public List<MzcEquipment> selectDeptEquipmentByDeptId(Long deptId);

    /**
     * 新增设备列表
     * 
     * @param mzcEquipment 设备列表
     * @return 结果
     */
    public int insertMzcEquipment(MzcEquipment mzcEquipment);

    /**
     * 修改设备列表
     * 
     * @param mzcEquipment 设备列表
     * @return 结果
     */
    public int updateMzcEquipment(MzcEquipment mzcEquipment);

    /**
     * 批量删除设备列表
     * 
     * @param equipmentIds 需要删除的设备列表主键集合
     * @return 结果
     */
    public int deleteMzcEquipmentByEquipmentIds(Long[] equipmentIds);

    /**
     * 删除设备列表信息
     *
     * @param equipmentId 设备列表主键
     * @return 结果
     */
    public int deleteMzcEquipmentByEquipmentId(Long equipmentId);
}
