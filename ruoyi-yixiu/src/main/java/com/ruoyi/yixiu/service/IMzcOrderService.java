package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.domain.dto.order.*;
import com.ruoyi.yixiu.domain.vo.MzcOrderFeedbackInfoVO;
import com.ruoyi.yixiu.domain.vo.MzcOrderOfferVO;

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
     * @param mzcOrderListDTO 订单
     * @return 订单集合
     */
    public List<MzcOrder> selectMzcOrderList(MzcOrderListDTO mzcOrderListDTO);

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

    /**
     * 检测报告
     *
     * @param mzcOrderReportDTO 配件信息
     */
    public void reportOrder(MzcOrderReportDTO mzcOrderReportDTO);

    /**
     * 配件列表
     *
     * @param feedbackId 反馈单id
     * @return 结果
     */
    public List<MzcOrderOfferVO> partsOrder(Long feedbackId);

    /**
     * 配件报价
     * @param mzcOrderFeedbackDTO 配件报价
     */
    public void feedbackOrder(MzcOrderFeedbackDTO mzcOrderFeedbackDTO);

    /**
     * 订单审核
     * @param mzcOrderAuditDTO 配件报价
     */
    public void auditOrder(MzcOrderAuditDTO mzcOrderAuditDTO);

    /**
     * 获取反馈单详情
     * @param feedbackId 反馈单id
     * @return 结果
     */
    public MzcOrderFeedbackInfoVO feedbackInfoOrder(Long feedbackId);

    /**
     * 开始订单维修
     * @param orderId 订单id
     */
    public void startRepairOrder(Long orderId);

    /**
     * 结束订单维修
     * @param mzcOrderEndRepairDTO 反馈单
     */
    public void endRepairOrder(MzcOrderEndRepairDTO mzcOrderEndRepairDTO);

    /**
     * 订单验收
     * @param orderId 订单ID
     */
    public void acceptanceOrder(Long orderId);

    /**
     * 评价
     * @param mzcOrderEvaluationDTO 评价
     */
    public void evaluationOrder(MzcOrderEvaluationDTO mzcOrderEvaluationDTO);

}
