package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcEquipmentMapper;
import com.ruoyi.yixiu.domain.MzcEquipment;
import com.ruoyi.yixiu.service.IMzcEquipmentService;

import static com.ruoyi.common.utils.SecurityUtils.getUsername;

/**
 * 设备列表Service业务层处理
 * 
 * @author mmmmnd
 * @date 2023-01-24
 */
@Service
public class MzcEquipmentServiceImpl implements IMzcEquipmentService 
{
    @Autowired
    private MzcEquipmentMapper mzcEquipmentMapper;

    /**
     * 查询设备列表
     * 
     * @param equipmentId 设备列表主键
     * @return 设备列表
     */
    @Override
    public MzcEquipment selectMzcEquipmentByEquipmentId(Long equipmentId)
    {
        return mzcEquipmentMapper.selectMzcEquipmentByEquipmentId(equipmentId);
    }

    /**
     * 查询设备列表列表
     * 
     * @param mzcEquipment 设备列表
     * @return 设备列表
     */
    @Override
    public List<MzcEquipment> selectMzcEquipmentList(MzcEquipment mzcEquipment)
    {
        return mzcEquipmentMapper.selectMzcEquipmentList(mzcEquipment);
    }

    /**
     * 通过报废id查询关联下的设备
     *
     * @param scrapId 报废id
     * @return 报废关联设备
     */
    @Override
    public List<MzcEquipment> selectMzcScrapByScrapId(Long scrapId) {
        return mzcEquipmentMapper.selectMzcScrapByScrapId(scrapId);
    }

    /**
     * 通过单位id获取设备列表
     *
     * @param deptId 单位id
     * @return 单位设备列表
     */
    @Override
    public List<MzcEquipment> selectDeptEquipmentByDeptId(Long deptId) {
        return mzcEquipmentMapper.selectDeptEquipmentByDeptId(deptId);
    }


    /**
     * 新增设备列表
     * 
     * @param mzcEquipment 设备列表
     * @return 结果
     */
    @Override
    public int insertMzcEquipment(MzcEquipment mzcEquipment)
    {
        mzcEquipment.setCreateBy(getUsername());
        mzcEquipment.setCreateTime(DateUtils.getNowDate());
        return mzcEquipmentMapper.insertMzcEquipment(mzcEquipment);
    }

    /**
     * 修改设备列表
     * 
     * @param mzcEquipment 设备列表
     * @return 结果
     */
    @Override
    public int updateMzcEquipment(MzcEquipment mzcEquipment)
    {
        mzcEquipment.setUpdateBy(getUsername());
        mzcEquipment.setUpdateTime(DateUtils.getNowDate());

        return mzcEquipmentMapper.updateMzcEquipment(mzcEquipment);
    }

    /**
     * 批量删除设备列表
     * 
     * @param equipmentIds 需要删除的设备列表主键
     * @return 结果
     */
    @Override
    public int deleteMzcEquipmentByEquipmentIds(Long[] equipmentIds)
    {
        String deleteByName = getUsername();

        return mzcEquipmentMapper.deleteMzcEquipmentByEquipmentIds(equipmentIds,deleteByName);
    }

    /**
     * 删除设备列表信息
     * 
     * @param equipmentId 设备列表主键
     * @return 结果
     */
    @Override
    public int deleteMzcEquipmentByEquipmentId(Long equipmentId)
    {
        String deleteByName = getUsername();

        return mzcEquipmentMapper.deleteMzcEquipmentByEquipmentId(equipmentId,deleteByName);
    }
}
