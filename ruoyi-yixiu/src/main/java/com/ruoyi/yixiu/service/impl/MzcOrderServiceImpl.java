package com.ruoyi.yixiu.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;

import static com.ruoyi.common.utils.SecurityUtils.getUsername;

import com.ruoyi.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcOrderMapper;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;

/**
 * 订单Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-24
 */
@Service
public class MzcOrderServiceImpl implements IMzcOrderService
{
    @Autowired
    private MzcOrderMapper mzcOrderMapper;

    /**
     * 查询订单
     *
     * @param orderId 订单主键
     * @return 订单
     */
    @Override
    public MzcOrder selectMzcOrderByOrderId(Long orderId)
    {
        return mzcOrderMapper.selectMzcOrderByOrderId(orderId);
    }

    /**
     * 查询订单列表
     *
     * @param mzcOrder 订单
     * @return 订单
     */
    @Override
    @DataScope(deptAlias = "o",userAlias = "o")
    public List<MzcOrder> selectMzcOrderList(MzcOrder mzcOrder)
    {

        /*自主接单不显示派单 其他都显示*/
         if (mzcOrder.getOrderType() != null && mzcOrder.getOrderType() == 2){
             mzcOrder.setOrderType(null);
         }

        List<MzcOrder> mzcOrders = mzcOrderMapper.selectMzcOrderList(mzcOrder);

        /*系统派单*/
        if (mzcOrder.getOrderType() != null && mzcOrder.getOrderType() == 1) {
            mzcOrders = mzcOrders.stream().filter(order -> order.getOrderType() == 1).collect(Collectors.toList());
        /*自主接单*/
        } else {
            mzcOrders = mzcOrders.stream().filter(order -> order.getOrderType() == null || order.getOrderType() == 2).collect(Collectors.toList());
        }

        return mzcOrders;
    }

    /**
     * 新增订单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    @Override
    public int insertMzcOrder(MzcOrder mzcOrder)
    {
        mzcOrder.setCreateBy(getUsername());
        mzcOrder.setUserId(SecurityUtils.getUserId());
        mzcOrder.setCreateTime(DateUtils.getNowDate());
        return mzcOrderMapper.insertMzcOrder(mzcOrder);
    }

    /**
     * 修改订单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    @Override
    public int updateMzcOrder(MzcOrder mzcOrder)
    {
        mzcOrder.setUpdateTime(DateUtils.getNowDate());
        mzcOrder.setUpdateBy(getUsername());
        return mzcOrderMapper.updateMzcOrder(mzcOrder);
    }

    /**
     * 批量删除订单
     *
     * @param orderIds 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderByOrderIds(Long[] orderIds)
    {
        String deleteByName = getUsername();
        return mzcOrderMapper.deleteMzcOrderByOrderIds(orderIds,deleteByName);
    }

    /**
     * 删除订单信息
     *
     * @param orderId 订单主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderByOrderId(Long orderId)
    {
        String deleteByName = getUsername();
        return mzcOrderMapper.deleteMzcOrderByOrderId(orderId,deleteByName);
    }

    /**
     * 自主接单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    @Override
    public int pickOrder(MzcOrder mzcOrder) {
        mzcOrder.setOrderType(2);
        mzcOrder.setDateTime(DateUtils.getNowDate());
        mzcOrder.setStatus("2");

        return updateMzcOrder(mzcOrder);
    }

    /**
     * 系统派单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    @Override
    public int sendOrder(MzcOrder mzcOrder) {
        mzcOrder.setOrderType(1);
        mzcOrder.setDateTime(DateUtils.getNowDate());
        mzcOrder.setStatus("1");

        return updateMzcOrder(mzcOrder);
    }

    /**
     * 订单检测
     *
     * @param orderId 订单ID
     * @return 结果
     */
    @Override
    public int detectionOrder(Long orderId) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(orderId);

        /*订单为接单或派单才进行操作*/
        if (mzcOrder.getStatus().equals("1") || mzcOrder.getStatus().equals("2")) {
            mzcOrder.setStatus("3");
            /*创建订单反馈*/
        } else {
            throw new ServiceException("非法参数！");
        }

        return updateMzcOrder(mzcOrder);
    }


}
