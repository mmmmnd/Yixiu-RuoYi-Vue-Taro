package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcComplaintMapper;
import com.ruoyi.yixiu.domain.MzcComplaint;
import com.ruoyi.yixiu.service.IMzcComplaintService;

/**
 * 投诉Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@Service
public class MzcComplaintServiceImpl implements IMzcComplaintService
{
    @Autowired
    private MzcComplaintMapper mzcComplaintMapper;

    /**
     * 查询投诉
     *
     * @param complaintId 投诉主键
     * @return 投诉
     */
    @Override
    public MzcComplaint selectMzcComplaintByComplaintId(Long complaintId)
    {
        return mzcComplaintMapper.selectMzcComplaintByComplaintId(complaintId);
    }

    /**
     * 查询投诉列表
     *
     * @param mzcComplaint 投诉
     * @return 投诉
     */
    @Override
    public List<MzcComplaint> selectMzcComplaintList(MzcComplaint mzcComplaint)
    {
        return mzcComplaintMapper.selectMzcComplaintList(mzcComplaint);
    }

    /**
     * 新增投诉
     *
     * @param mzcComplaint 投诉
     * @return 结果
     */
    @Override
    public int insertMzcComplaint(MzcComplaint mzcComplaint)
    {
        mzcComplaint.setCreateTime(DateUtils.getNowDate());
        mzcComplaint.setCreateBy(getUsername());
        return mzcComplaintMapper.insertMzcComplaint(mzcComplaint);
    }

    /**
     * 修改投诉
     *
     * @param mzcComplaint 投诉
     * @return 结果
     */
    @Override
    public int updateMzcComplaint(MzcComplaint mzcComplaint)
    {
        mzcComplaint.setUpdateTime(DateUtils.getNowDate());
        mzcComplaint.setUpdateBy(getUsername());
        /*回复后将状态设置为已处理*/
        mzcComplaint.setStatus("1");
        return mzcComplaintMapper.updateMzcComplaint(mzcComplaint);
    }

    /**
     * 批量删除投诉
     *
     * @param complaintIds 需要删除的投诉主键
     * @return 结果
     */
    @Override
    public int deleteMzcComplaintByComplaintIds(Long[] complaintIds)
    {
        String deleteByName = getUsername();
        return mzcComplaintMapper.deleteMzcComplaintByComplaintIds(complaintIds,deleteByName);
    }

    /**
     * 删除投诉信息
     *
     * @param complaintId 投诉主键
     * @return 结果
     */
    @Override
    public int deleteMzcComplaintByComplaintId(Long complaintId)
    {
        String deleteByName = getUsername();
        return mzcComplaintMapper.deleteMzcComplaintByComplaintId(complaintId,deleteByName);
    }
}
