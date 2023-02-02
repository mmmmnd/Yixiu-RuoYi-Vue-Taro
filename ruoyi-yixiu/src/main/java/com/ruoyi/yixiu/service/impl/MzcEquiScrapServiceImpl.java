package com.ruoyi.yixiu.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.yixiu.domain.MzcScrap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcEquiScrapMapper;
import com.ruoyi.yixiu.domain.MzcEquiScrap;
import com.ruoyi.yixiu.service.IMzcEquiScrapService;

/**
 * 设备报废关联Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-01-30
 */
@Service
public class MzcEquiScrapServiceImpl implements IMzcEquiScrapService
{
    @Autowired
    private MzcEquiScrapMapper mzcEquiScrapMapper;

    /**
     * 查询设备报废关联
     *
     * @param equipmentId 设备报废关联主键
     * @return 设备报废关联
     */
    @Override
    public MzcEquiScrap selectMzcEquiScrapByEquipmentId(Long equipmentId)
    {
        return mzcEquiScrapMapper.selectMzcEquiScrapByScrapId(equipmentId);
    }

    /**
     * 查询设备报废关联列表
     *
     * @param mzcEquiScrap 设备报废关联
     * @return 设备报废关联
     */
    @Override
    public List<MzcEquiScrap> selectMzcEquiScrapList(MzcEquiScrap mzcEquiScrap)
    {
        return mzcEquiScrapMapper.selectMzcEquiScrapList(mzcEquiScrap);
    }

    /**
     * 新增设备报废关联
     *
     * @param mzcScrap 报废列表
     */
    @Override
    public void insertMzcEquiScrap(MzcScrap mzcScrap)
    {
        List<Long> equipmentIds = mzcScrap.getEquipmentIds();

        if (StringUtils.isNotEmpty(equipmentIds)){
            List<MzcEquiScrap> list = new ArrayList<>(equipmentIds.size());
            
            for (Long equipmentId :equipmentIds) {
                MzcEquiScrap equiScrap = new MzcEquiScrap();

                equiScrap.setScrapId(mzcScrap.getScrapId());
                equiScrap.setEquipmentId(equipmentId);

                list.add(equiScrap);
            }
         mzcEquiScrapMapper.batchMzcEquiScrap(list);
        }
    }

    /**
     * 修改设备报废关联
     *
     * @param mzcEquiScrap 设备报废关联
     * @return 结果
     */
    @Override
    public int updateMzcEquiScrap(MzcEquiScrap mzcEquiScrap)
    {
        return mzcEquiScrapMapper.updateMzcEquiScrap(mzcEquiScrap);
    }

    /**
     * 批量删除设备报废关联
     *
     * @param scrapIds 需要删除的设备报废关联主键
     * @return 结果
     */
    @Override
    public int deleteMzcEquiScrapByScrapIds(Long[] scrapIds)
    {
        return mzcEquiScrapMapper.deleteMzcEquiScrapByScrapIds(scrapIds);
    }

    /**
     * 删除设备报废关联信息
     *
     * @param scrapId 设备报废关联主键
     * @return 结果
     */
    @Override
    public int deleteMzcEquiScrapByScrapId(Long scrapId)
    {
        return mzcEquiScrapMapper.deleteMzcEquiScrapByScrapId(scrapId);
    }
}
