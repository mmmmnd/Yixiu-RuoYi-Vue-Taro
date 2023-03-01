package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintListDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcComplaintMapper;
import com.ruoyi.yixiu.domain.MzcComplaint;
import com.ruoyi.yixiu.service.IMzcComplaintService;

import javax.annotation.Resource;

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

    @Resource
    private MzcOrderServiceImpl mzcOrderService;

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
     * @param mzcComplaintListDTO 投诉
     * @return 投诉
     */
    @Override
    public List<MzcComplaint> selectMzcComplaintList(MzcComplaintListDTO mzcComplaintListDTO)
    {
        MzcComplaint mzcComplaint = new MzcComplaint();
        BeanUtils.copyBeanProp(mzcComplaint,mzcComplaintListDTO);

        if (StringUtils.isNotNull(mzcComplaintListDTO.getStatusType())){
            switch (mzcComplaintListDTO.getStatusType()) {
                case "0":
                    mzcComplaint.setStatus(null);
                    break;
                case "1":
                    mzcComplaint.setStatus("0");
                    break;
                case "2":
                    mzcComplaint.setStatus("1");
                    break;
            }
        }

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
        if (StringUtils.isNotNull(mzcComplaint.getOrderId())){
            mzcComplaint.setComplaintType("1");
        }

        /*订单投诉已投诉*/
        if (StringUtils.isNotNull(mzcComplaint.getOrderId())){
            MzcOrder mzcOrder = mzcOrderService.selectMzcOrderByOrderId(mzcComplaint.getOrderId());
            mzcOrder.setStatus("11");

            mzcOrderService.updateMzcOrder(mzcOrder);
        }

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
