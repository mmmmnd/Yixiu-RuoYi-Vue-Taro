package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;

import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.order.MzcOrderAddDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcOrderMapper;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;

/**
 * 订单Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-19
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
    public List<MzcOrder> selectMzcOrderList(MzcOrder mzcOrder)
    {
        return mzcOrderMapper.selectMzcOrderList(mzcOrder);
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
        mzcOrder.setCreateTime(DateUtils.getNowDate());
        mzcOrder.setCreateBy(getUsername());
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
}
