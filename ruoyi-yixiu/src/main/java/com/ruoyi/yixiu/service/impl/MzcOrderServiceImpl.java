package com.ruoyi.yixiu.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.common.annotation.DataScope;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.DateUtils;

import static com.ruoyi.common.utils.SecurityUtils.getUsername;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.MzcOrderFeedback;
import com.ruoyi.yixiu.domain.MzcOrderParts;
import com.ruoyi.yixiu.domain.dto.order.*;
import com.ruoyi.yixiu.domain.vo.MzcOrderFeedbackInfoVO;
import com.ruoyi.yixiu.domain.vo.MzcOrderOfferVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcOrderMapper;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

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

    @Resource
    private MzcOrderFeedbackServiceImpl mzcOrderFeedbackService;

    @Resource
    private MzcOrderPartsServiceImpl mzcOrderPartsService;

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
     * @param mzcOrderListDTO 订单
     * @return 订单
     */
    @Override
    @DataScope(deptAlias = "o",userAlias = "o")
    public List<MzcOrder> selectMzcOrderList(MzcOrderListDTO mzcOrderListDTO)
    {

        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder, mzcOrderListDTO);


        /*自主接单不显示派单 其他都显示*/
         if (mzcOrder.getOrderType() != null && mzcOrder.getOrderType() == 2){
             mzcOrder.setOrderType(null);
         }

        /*小程序类型*/
        Integer type = mzcOrderListDTO.getStatusType();
        if (type != null){
            switch (type){
                case 0:
                    mzcOrder.setStatus(null);
                    break;
                case 1:
                    mzcOrder.setStatus("2");
                    break;
                case 2:
                    mzcOrder.setStatus("1");
                    break;
                case 3:
                    mzcOrder.setStatus("5");
                    break;
                case 4:
                    mzcOrder.setStatus("7");
                    break;
                case 5:
                    mzcOrder.setStatus("8");
                    break;
            }
        }

        List<MzcOrder> mzcOrders = mzcOrderMapper.selectMzcOrderList(mzcOrder);
        if (type == null){
            /*系统派单*/
            if (mzcOrder.getOrderType() != null && mzcOrder.getOrderType() == 1) {
                mzcOrders = mzcOrders.stream().filter(order -> order.getOrderType() == 1).collect(Collectors.toList());
            /*自主接单*/
            } else {
                mzcOrders = mzcOrders.stream().filter(order -> order.getOrderType() == null || order.getOrderType() == 2).collect(Collectors.toList());
            }
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
    @Transactional
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
        MzcOrder order = selectMzcOrderByOrderId(mzcOrder.getOrderId());

        if (StringUtils.isNotNull(order)){
            if (order.getStatus().equals("0")) {
                order.setOrderType(2);
                order.setDateTime(DateUtils.getNowDate());
                order.setStatus("2");

                return updateMzcOrder(order);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }

    }

    /**
     * 系统派单
     *
     * @param mzcOrder 订单
     * @return 结果
     */
    @Override
    public int sendOrder(MzcOrder mzcOrder) {
        MzcOrder order = selectMzcOrderByOrderId(mzcOrder.getOrderId());

        if (StringUtils.isNotNull(order)){
            if (order.getStatus().equals("0")) {
                mzcOrder.setOrderType(1);
                mzcOrder.setDateTime(DateUtils.getNowDate());
                mzcOrder.setStatus("1");

                return updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
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

        if (StringUtils.isNotNull(mzcOrder)){
            if (mzcOrder.getStatus().equals("1") || mzcOrder.getStatus().equals("2")) {
                mzcOrder.setStatus("3");
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }

        return updateMzcOrder(mzcOrder);
    }

    /**
     * 检测报告
     *
     * @param mzcOrderReportDTO 配件信息
     */
    @Override
    @Transactional
    public void reportOrder(MzcOrderReportDTO mzcOrderReportDTO) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(mzcOrderReportDTO.getOrderId());

        if (StringUtils.isNotNull(mzcOrder)){
            if (mzcOrder.getStatus().equals("3")) {

                /*反馈单*/
                MzcOrderFeedback mzcOrderFeedback = new MzcOrderFeedback();
                mzcOrderFeedback.setEquipmentInspection(mzcOrderReportDTO.getEquipmentInspection());
                /*主键*/
                mzcOrderFeedbackService.insertMzcOrderFeedback(mzcOrderFeedback);
                Long feedbackId = mzcOrderFeedback.getFeedbackId();

                /*记录反馈单*/
                mzcOrder.setFeedbackId(feedbackId);
                mzcOrder.setStatus("4");
                updateMzcOrder(mzcOrder);

                /*设备单*/
                List<MzcOrderParts> orderParts = mzcOrderReportDTO.getOrderParts();
                mzcOrderPartsService.batchMzcParts(orderParts,feedbackId);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 检测报告
     *
     * @param feedbackId 反馈单id
     * @return 结果
     */
    @Override
    public List<MzcOrderOfferVO> partsOrder(Long feedbackId) {
        MzcOrderParts mzcOrderParts = new MzcOrderParts();
        mzcOrderParts.setFeedbackId(feedbackId);

        List<MzcOrderOfferVO> mzcOrderOfferVO = new ArrayList<>();
        List<MzcOrderParts> orderParts = mzcOrderPartsService.selectMzcOrderPartsList(mzcOrderParts);

        if (StringUtils.isNotNull(orderParts)){
            for (MzcOrderParts orderPart:orderParts) {
                MzcOrderOfferVO orderOfferVO = new MzcOrderOfferVO();
                BeanUtils.copyBeanProp(orderOfferVO,orderPart);
                mzcOrderOfferVO.add(orderOfferVO);
            }
        }

        return mzcOrderOfferVO;
    }

    /**
     * 配件报价
     *
     * @param mzcOrderFeedbackDTO 配件报价
     */
    @Override
    public void feedbackOrder(MzcOrderFeedbackDTO mzcOrderFeedbackDTO) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(mzcOrderFeedbackDTO.getOrderId());

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("4")) {

                /*记录报价信息*/
                MzcOrderFeedback mzcOrderFeedback = mzcOrderFeedbackService.selectMzcOrderFeedbackByFeedbackId(mzcOrderFeedbackDTO.getFeedbackId());
                mzcOrderFeedback.setOfferor(getUsername());
                mzcOrderFeedback.setQuotationDate(DateUtils.getNowDate());
                mzcOrderFeedback.setTotalPrice(mzcOrderFeedbackDTO.getTotalPrice());
                mzcOrderFeedbackService.updateMzcOrderFeedback(mzcOrderFeedback);

                /*记录配件价格*/
                mzcOrderPartsService.batchUpdateMzcParts(mzcOrderFeedbackDTO.getOrderParts());

                mzcOrder.setStatus("5");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 订单审核
     *
     * @param mzcOrderAuditDTO 配件报价
     */
    @Override
    public void auditOrder(MzcOrderAuditDTO mzcOrderAuditDTO) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(mzcOrderAuditDTO.getOrderId());

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("5")) {

                BeanUtils.copyBeanProp(mzcOrder,mzcOrderAuditDTO);
                mzcOrder.setStatus("6");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 获取反馈单详情
     *
     * @param feedbackId 反馈单id
     * @return 结果
     */
    @Override
    public MzcOrderFeedbackInfoVO feedbackInfoOrder(Long feedbackId) {
        MzcOrderFeedbackInfoVO mzcOrderFeedbackInfoVO = new MzcOrderFeedbackInfoVO();

        /*反馈单*/
        MzcOrderFeedback mzcOrderFeedback = mzcOrderFeedbackService.selectMzcOrderFeedbackByFeedbackId(feedbackId);
        BeanUtils.copyBeanProp(mzcOrderFeedbackInfoVO, mzcOrderFeedback);

        /*通过反馈单id获取设备详情*/
        MzcOrderParts mzcOrderParts = new MzcOrderParts();
        mzcOrderParts.setFeedbackId(feedbackId);
        List<MzcOrderParts> mzcOrderPartsList = mzcOrderPartsService.selectMzcOrderPartsList(mzcOrderParts);
        mzcOrderFeedbackInfoVO.setOrderParts(mzcOrderPartsList);

        return mzcOrderFeedbackInfoVO;
    }

    /**
     * 开始订单维修
     *
     * @param orderId 订单id
     */
    @Override
    public void startRepairOrder(Long orderId) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(orderId);

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("6")) {

                /*维修开始时间*/
                MzcOrderFeedback mzcOrderFeedback = mzcOrderFeedbackService.selectMzcOrderFeedbackByFeedbackId(mzcOrder.getFeedbackId());
                mzcOrderFeedback.setMaintenanceStartTime(DateUtils.getNowDate());
                mzcOrderFeedbackService.updateMzcOrderFeedback(mzcOrderFeedback);

                mzcOrder.setStatus("7");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 结束订单维修
     *
     * @param mzcOrderEndRepairDTO 反馈单
     */
    @Override
    public void endRepairOrder(MzcOrderEndRepairDTO mzcOrderEndRepairDTO) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(mzcOrderEndRepairDTO.getOrderId());

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("7")) {

                /*维修结束时间*/
                MzcOrderFeedback mzcOrderFeedback = mzcOrderFeedbackService.selectMzcOrderFeedbackByFeedbackId(mzcOrder.getFeedbackId());
                mzcOrderFeedback.setMaintenanceEndTime(DateUtils.getNowDate());
                mzcOrderFeedback.setFeedbackResult(mzcOrderEndRepairDTO.getFeedbackResult());
                mzcOrderFeedbackService.updateMzcOrderFeedback(mzcOrderFeedback);

                mzcOrder.setStatus("8");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 订单验收
     *
     * @param orderId 订单ID
     */
    @Override
    public void acceptanceOrder(Long orderId) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(orderId);

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("8")) {

                mzcOrder.setStatus("9");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }

    /**
     * 评价
     *
     * @param mzcOrderEvaluationDTO 评价
     */
    @Override
    public void evaluationOrder(MzcOrderEvaluationDTO mzcOrderEvaluationDTO) {
        MzcOrder mzcOrder = selectMzcOrderByOrderId(mzcOrderEvaluationDTO.getOrderId());

        if (StringUtils.isNotNull(mzcOrder)) {
            if (mzcOrder.getStatus().equals("9")) {

                BeanUtils.copyBeanProp(mzcOrder, mzcOrderEvaluationDTO);
                mzcOrder.setStatus("10");
                updateMzcOrder(mzcOrder);
            } else {
                throw new ServiceException("非法参数！");
            }
        } else {
            throw new ServiceException("订单不存在！");
        }
    }
}
