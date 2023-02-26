package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrder;

/**
 * 订单Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-24
 */
public interface IMzcOrderService 
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
     * 批量删除订单
     * 
     * @param orderIds 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteMzcOrderByOrderIds(Long[] orderIds);

    /**
     * 删除订单信息
     * 
     * @param orderId 订单主键
     * @return 结果
     */
    public int deleteMzcOrderByOrderId(Long orderId);

    /**
     * 自主接单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    public int pickOrder(MzcOrder mzcOrder);

    /**
     * 系统派单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    public int sendOrder(MzcOrder mzcOrder);

    /**
     * 订单检测
     *
     * @param orderId 订单ID
     * @return 结果
     */
    public int detectionOrder(Long orderId);
}
