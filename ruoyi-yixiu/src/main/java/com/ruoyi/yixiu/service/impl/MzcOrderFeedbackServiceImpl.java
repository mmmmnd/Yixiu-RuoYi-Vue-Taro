package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcOrderFeedbackMapper;
import com.ruoyi.yixiu.domain.MzcOrderFeedback;
import com.ruoyi.yixiu.service.IMzcOrderFeedbackService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 反馈单Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
@Service
public class MzcOrderFeedbackServiceImpl implements IMzcOrderFeedbackService
{
    @Autowired
    private MzcOrderFeedbackMapper mzcOrderFeedbackMapper;

    /**
     * 查询反馈单
     *
     * @param feedbackId 反馈单主键
     * @return 反馈单
     */
    @Override
    public MzcOrderFeedback selectMzcOrderFeedbackByFeedbackId(Long feedbackId)
    {
        return mzcOrderFeedbackMapper.selectMzcOrderFeedbackByFeedbackId(feedbackId);
    }

    /**
     * 查询反馈单列表
     *
     * @param mzcOrderFeedback 反馈单
     * @return 反馈单
     */
    @Override
    public List<MzcOrderFeedback> selectMzcOrderFeedbackList(MzcOrderFeedback mzcOrderFeedback)
    {
        return mzcOrderFeedbackMapper.selectMzcOrderFeedbackList(mzcOrderFeedback);
    }

    /**
     * 新增反馈单
     *
     * @param mzcOrderFeedback 反馈单
     * @return 结果
     */
    @Override
    @Transactional
    public int insertMzcOrderFeedback(MzcOrderFeedback mzcOrderFeedback)
    {
        mzcOrderFeedback.setCreateTime(DateUtils.getNowDate());
        mzcOrderFeedback.setCreateBy(getUsername());
        return mzcOrderFeedbackMapper.insertMzcOrderFeedback(mzcOrderFeedback);
    }

    /**
     * 修改反馈单
     *
     * @param mzcOrderFeedback 反馈单
     * @return 结果
     */
    @Override
    public int updateMzcOrderFeedback(MzcOrderFeedback mzcOrderFeedback)
    {
        mzcOrderFeedback.setUpdateTime(DateUtils.getNowDate());
        mzcOrderFeedback.setUpdateBy(getUsername());
        return mzcOrderFeedbackMapper.updateMzcOrderFeedback(mzcOrderFeedback);
    }

    /**
     * 批量删除反馈单
     *
     * @param feedbackIds 需要删除的反馈单主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderFeedbackByFeedbackIds(Long[] feedbackIds)
    {
        String deleteByName = getUsername();
        return mzcOrderFeedbackMapper.deleteMzcOrderFeedbackByFeedbackIds(feedbackIds,deleteByName);
    }

    /**
     * 删除反馈单信息
     *
     * @param feedbackId 反馈单主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderFeedbackByFeedbackId(Long feedbackId)
    {
        String deleteByName = getUsername();
        return mzcOrderFeedbackMapper.deleteMzcOrderFeedbackByFeedbackId(feedbackId,deleteByName);
    }
}
