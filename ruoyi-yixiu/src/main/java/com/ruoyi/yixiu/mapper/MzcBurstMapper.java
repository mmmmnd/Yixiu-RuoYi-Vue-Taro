package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcBurst;
import org.apache.ibatis.annotations.Param;

/**
 * 不良事件Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface MzcBurstMapper
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
     * 删除不良事件
     *
     * @param burstId 不良事件主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcBurstByBurstId(@Param("burstId") Long burstId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除不良事件
     *
     * @param burstIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcBurstByBurstIds(@Param("burstIds") Long[] burstIds, @Param("deleteByName") String deleteByName);
}
