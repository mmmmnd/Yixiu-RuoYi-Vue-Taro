package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcBurstMapper;
import com.ruoyi.yixiu.domain.MzcBurst;
import com.ruoyi.yixiu.service.IMzcBurstService;

/**
 * 不良事件Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Service
public class MzcBurstServiceImpl implements IMzcBurstService
{
    @Autowired
    private MzcBurstMapper mzcBurstMapper;

    /**
     * 查询不良事件
     *
     * @param burstId 不良事件主键
     * @return 不良事件
     */
    @Override
    public MzcBurst selectMzcBurstByBurstId(Long burstId)
    {
        return mzcBurstMapper.selectMzcBurstByBurstId(burstId);
    }

    /**
     * 查询不良事件列表
     *
     * @param mzcBurst 不良事件
     * @return 不良事件
     */
    @Override
    public List<MzcBurst> selectMzcBurstList(MzcBurst mzcBurst)
    {
        return mzcBurstMapper.selectMzcBurstList(mzcBurst);
    }

    /**
     * 新增不良事件
     *
     * @param mzcBurst 不良事件
     * @return 结果
     */
    @Override
    public int insertMzcBurst(MzcBurst mzcBurst)
    {
        mzcBurst.setCreateTime(DateUtils.getNowDate());
        mzcBurst.setCreateBy(getUsername());
        return mzcBurstMapper.insertMzcBurst(mzcBurst);
    }

    /**
     * 修改不良事件
     *
     * @param mzcBurst 不良事件
     * @return 结果
     */
    @Override
    public int updateMzcBurst(MzcBurst mzcBurst)
    {
        mzcBurst.setUpdateTime(DateUtils.getNowDate());
        mzcBurst.setUpdateBy(getUsername());
        return mzcBurstMapper.updateMzcBurst(mzcBurst);
    }

    /**
     * 批量删除不良事件
     *
     * @param burstIds 需要删除的不良事件主键
     * @return 结果
     */
    @Override
    public int deleteMzcBurstByBurstIds(Long[] burstIds)
    {
        String deleteByName = getUsername();
        return mzcBurstMapper.deleteMzcBurstByBurstIds(burstIds,deleteByName);
    }

    /**
     * 删除不良事件信息
     *
     * @param burstId 不良事件主键
     * @return 结果
     */
    @Override
    public int deleteMzcBurstByBurstId(Long burstId)
    {
        String deleteByName = getUsername();
        return mzcBurstMapper.deleteMzcBurstByBurstId(burstId,deleteByName);
    }
}
