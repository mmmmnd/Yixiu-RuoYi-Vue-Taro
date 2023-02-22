package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcReceivingMapper;
import com.ruoyi.yixiu.domain.MzcReceiving;
import com.ruoyi.yixiu.service.IMzcReceivingService;

/**
 * 接单Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-21
 */
@Service
public class MzcReceivingServiceImpl implements IMzcReceivingService
{
    @Autowired
    private MzcReceivingMapper mzcReceivingMapper;

    /**
     * 查询接单
     *
     * @param receivingId 接单主键
     * @return 接单
     */
    @Override
    public MzcReceiving selectMzcReceivingByReceivingId(Long receivingId)
    {
        return mzcReceivingMapper.selectMzcReceivingByReceivingId(receivingId);
    }

    /**
     * 查询接单列表
     *
     * @param mzcReceiving 接单
     * @return 接单
     */
    @Override
    public List<MzcReceiving> selectMzcReceivingList(MzcReceiving mzcReceiving)
    {
        return mzcReceivingMapper.selectMzcReceivingList(mzcReceiving);
    }

    /**
     * 新增接单
     *
     * @param mzcReceiving 接单
     * @return 结果
     */
    @Override
    public int insertMzcReceiving(MzcReceiving mzcReceiving)
    {
        mzcReceiving.setCreateTime(DateUtils.getNowDate());
        mzcReceiving.setCreateBy(getUsername());
        return mzcReceivingMapper.insertMzcReceiving(mzcReceiving);
    }

    /**
     * 修改接单
     *
     * @param mzcReceiving 接单
     * @return 结果
     */
    @Override
    public int updateMzcReceiving(MzcReceiving mzcReceiving)
    {
        mzcReceiving.setUpdateTime(DateUtils.getNowDate());
        mzcReceiving.setUpdateBy(getUsername());
        return mzcReceivingMapper.updateMzcReceiving(mzcReceiving);
    }

    /**
     * 批量删除接单
     *
     * @param receivingIds 需要删除的接单主键
     * @return 结果
     */
    @Override
    public int deleteMzcReceivingByReceivingIds(Long[] receivingIds)
    {
        String deleteByName = getUsername();
        return mzcReceivingMapper.deleteMzcReceivingByReceivingIds(receivingIds,deleteByName);
    }

    /**
     * 删除接单信息
     *
     * @param receivingId 接单主键
     * @return 结果
     */
    @Override
    public int deleteMzcReceivingByReceivingId(Long receivingId)
    {
        String deleteByName = getUsername();
        return mzcReceivingMapper.deleteMzcReceivingByReceivingId(receivingId,deleteByName);
    }
}
