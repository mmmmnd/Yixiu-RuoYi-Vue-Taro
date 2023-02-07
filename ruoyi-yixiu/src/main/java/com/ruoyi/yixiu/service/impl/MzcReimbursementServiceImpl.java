package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcReimbursementMapper;
import com.ruoyi.yixiu.domain.MzcReimbursement;
import com.ruoyi.yixiu.service.IMzcReimbursementService;

/**
 * 报销Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Service
public class MzcReimbursementServiceImpl implements IMzcReimbursementService
{
    @Autowired
    private MzcReimbursementMapper mzcReimbursementMapper;

    /**
     * 查询报销
     *
     * @param reimbursementId 报销主键
     * @return 报销
     */
    @Override
    public MzcReimbursement selectMzcReimbursementByReimbursementId(Long reimbursementId)
    {
        return mzcReimbursementMapper.selectMzcReimbursementByReimbursementId(reimbursementId);
    }

    /**
     * 查询报销列表
     *
     * @param mzcReimbursement 报销
     * @return 报销
     */
    @Override
    public List<MzcReimbursement> selectMzcReimbursementList(MzcReimbursement mzcReimbursement)
    {
        return mzcReimbursementMapper.selectMzcReimbursementList(mzcReimbursement);
    }

    /**
     * 新增报销
     *
     * @param mzcReimbursement 报销
     * @return 结果
     */
    @Override
    public int insertMzcReimbursement(MzcReimbursement mzcReimbursement)
    {
        mzcReimbursement.setCreateTime(DateUtils.getNowDate());
        mzcReimbursement.setCreateBy(getUsername());
        return mzcReimbursementMapper.insertMzcReimbursement(mzcReimbursement);
    }

    /**
     * 修改报销
     *
     * @param mzcReimbursement 报销
     * @return 结果
     */
    @Override
    public int updateMzcReimbursement(MzcReimbursement mzcReimbursement)
    {
        mzcReimbursement.setUpdateTime(DateUtils.getNowDate());
        mzcReimbursement.setUpdateBy(getUsername());
        return mzcReimbursementMapper.updateMzcReimbursement(mzcReimbursement);
    }

    /**
     * 批量删除报销
     *
     * @param reimbursementIds 需要删除的报销主键
     * @return 结果
     */
    @Override
    public int deleteMzcReimbursementByReimbursementIds(Long[] reimbursementIds)
    {
        String deleteByName = getUsername();
        return mzcReimbursementMapper.deleteMzcReimbursementByReimbursementIds(reimbursementIds,deleteByName);
    }

    /**
     * 删除报销信息
     *
     * @param reimbursementId 报销主键
     * @return 结果
     */
    @Override
    public int deleteMzcReimbursementByReimbursementId(Long reimbursementId)
    {
        String deleteByName = getUsername();
        return mzcReimbursementMapper.deleteMzcReimbursementByReimbursementId(reimbursementId,deleteByName);
    }
}
