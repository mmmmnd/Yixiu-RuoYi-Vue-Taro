package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrder;
import org.apache.ibatis.annotations.Param;

/**
 * 订单Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-19
 */
public interface MzcOrderMapper
{
    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    public MzcOrder selectMzcOrderByOrderId(Long orderId);

    /**
     * 查询订单列表
     *
     * @param mzcOrder 订单
     * @return 订单集合
     */
    public List<MzcOrder> selectMzcOrderList(MzcOrder mzcOrder);

    /**
     * 新增订单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    public int insertMzcOrder(MzcOrder mzcOrder);

    /**
     * 修改订单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    public int updateMzcOrder(MzcOrder mzcOrder);

    /**
     * 删除订单
     *
     * @param orderId 订单主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderByOrderId(@Param("orderId") Long orderId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderByOrderIds(@Param("orderIds") Long[] orderIds, @Param("deleteByName") String deleteByName);
}
