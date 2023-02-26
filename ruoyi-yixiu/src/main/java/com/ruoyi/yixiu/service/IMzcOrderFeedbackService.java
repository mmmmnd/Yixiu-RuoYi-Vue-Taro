package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrderFeedback;

/**
 * 反馈单Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-26
 */
public interface IMzcOrderFeedbackService 
{
    /**
     * 查询反馈单
     * 
     * @param feedbackId 反馈单主键
     * @return 反馈单
     */
    public MzcOrderFeedback selectMzcOrderFeedbackByFeedbackId(Long feedbackId);

    /**
     * 查询反馈单列表
     * 
     * @param mzcOrderFeedback 反馈单
     * @return 反馈单集合
     */
    public List<MzcOrderFeedback> selectMzcOrderFeedbackList(MzcOrderFeedback mzcOrderFeedback);

    /**
     * 新增反馈单
     * 
     * @param mzcOrderFeedback 反馈单
     * @return 结果
     */
    public int insertMzcOrderFeedback(MzcOrderFeedback mzcOrderFeedback);

    /**
     * 修改反馈单
     * 
     * @param mzcOrderFeedback 反馈单
     * @return 结果
     */
    public int updateMzcOrderFeedback(MzcOrderFeedback mzcOrderFeedback);

    /**
     * 批量删除反馈单
     * 
     * @param feedbackIds 需要删除的反馈单主键集合
     * @return 结果
     */
    public int deleteMzcOrderFeedbackByFeedbackIds(Long[] feedbackIds);

    /**
     * 删除反馈单信息
     * 
     * @param feedbackId 反馈单主键
     * @return 结果
     */
    public int deleteMzcOrderFeedbackByFeedbackId(Long feedbackId);
}
