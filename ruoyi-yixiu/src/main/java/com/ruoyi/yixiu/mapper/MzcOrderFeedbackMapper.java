package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrderFeedback;
import org.apache.ibatis.annotations.Param;

/**
 * 反馈单Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
public interface MzcOrderFeedbackMapper
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
     * 删除反馈单
     *
     * @param feedbackId 反馈单主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderFeedbackByFeedbackId(@Param("feedbackId") Long feedbackId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除反馈单
     *
     * @param feedbackIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderFeedbackByFeedbackIds(@Param("feedbackIds") Long[] feedbackIds, @Param("deleteByName") String deleteByName);
}
