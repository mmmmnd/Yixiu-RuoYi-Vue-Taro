package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcReceiving;
import org.apache.ibatis.annotations.Param;

/**
 * 接单Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-21
 */
public interface MzcReceivingMapper
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
     * 删除接单
     *
     * @param receivingId 接单主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcReceivingByReceivingId(@Param("receivingId") Long receivingId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除接单
     *
     * @param receivingIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcReceivingByReceivingIds(@Param("receivingIds") Long[] receivingIds, @Param("deleteByName") String deleteByName);
}
