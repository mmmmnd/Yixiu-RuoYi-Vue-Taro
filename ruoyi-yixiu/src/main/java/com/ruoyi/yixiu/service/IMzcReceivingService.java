package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcReceiving;

/**
 * 接单Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-21
 */
public interface IMzcReceivingService 
{
    /**
     * 查询接单
     * 
     * @param receivingId 接单主键
     * @return 接单
     */
    public MzcReceiving selectMzcReceivingByReceivingId(Long receivingId);

    /**
     * 查询接单列表
     * 
     * @param mzcReceiving 接单
     * @return 接单集合
     */
    public List<MzcReceiving> selectMzcReceivingList(MzcReceiving mzcReceiving);

    /**
     * 新增接单
     * 
     * @param mzcReceiving 接单
     * @return 结果
     */
    public int insertMzcReceiving(MzcReceiving mzcReceiving);

    /**
     * 修改接单
     * 
     * @param mzcReceiving 接单
     * @return 结果
     */
    public int updateMzcReceiving(MzcReceiving mzcReceiving);

    /**
     * 批量删除接单
     * 
     * @param receivingIds 需要删除的接单主键集合
     * @return 结果
     */
    public int deleteMzcReceivingByReceivingIds(Long[] receivingIds);

    /**
     * 删除接单信息
     * 
     * @param receivingId 接单主键
     * @return 结果
     */
    public int deleteMzcReceivingByReceivingId(Long receivingId);
}
