package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcBurst;

/**
 * 不良事件Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface IMzcBurstService 
{
    /**
     * 查询不良事件
     * 
     * @param burstId 不良事件主键
     * @return 不良事件
     */
    public MzcBurst selectMzcBurstByBurstId(Long burstId);

    /**
     * 查询不良事件列表
     * 
     * @param mzcBurst 不良事件
     * @return 不良事件集合
     */
    public List<MzcBurst> selectMzcBurstList(MzcBurst mzcBurst);

    /**
     * 新增不良事件
     * 
     * @param mzcBurst 不良事件
     * @return 结果
     */
    public int insertMzcBurst(MzcBurst mzcBurst);

    /**
     * 修改不良事件
     * 
     * @param mzcBurst 不良事件
     * @return 结果
     */
    public int updateMzcBurst(MzcBurst mzcBurst);

    /**
     * 批量删除不良事件
     * 
     * @param burstIds 需要删除的不良事件主键集合
     * @return 结果
     */
    public int deleteMzcBurstByBurstIds(Long[] burstIds);

    /**
     * 删除不良事件信息
     * 
     * @param burstId 不良事件主键
     * @return 结果
     */
    public int deleteMzcBurstByBurstId(Long burstId);
}
