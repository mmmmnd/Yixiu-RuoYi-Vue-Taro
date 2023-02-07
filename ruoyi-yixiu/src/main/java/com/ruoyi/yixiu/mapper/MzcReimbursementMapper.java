package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcReimbursement;
import org.apache.ibatis.annotations.Param;

/**
 * 报销Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface MzcReimbursementMapper
{
    /**
     * 查询报销
     *
     * @param reimbursementId 报销主键
     * @return 报销
     */
    public MzcReimbursement selectMzcReimbursementByReimbursementId(Long reimbursementId);

    /**
     * 查询报销列表
     *
     * @param mzcReimbursement 报销
     * @return 报销集合
     */
    public List<MzcReimbursement> selectMzcReimbursementList(MzcReimbursement mzcReimbursement);

    /**
     * 新增报销
     *
     * @param mzcReimbursement 报销
     * @return 结果
     */
    public int insertMzcReimbursement(MzcReimbursement mzcReimbursement);

    /**
     * 修改报销
     *
     * @param mzcReimbursement 报销
     * @return 结果
     */
    public int updateMzcReimbursement(MzcReimbursement mzcReimbursement);

    /**
     * 删除报销
     *
     * @param reimbursementId 报销主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcReimbursementByReimbursementId(@Param("reimbursementId") Long reimbursementId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除报销
     *
     * @param reimbursementIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcReimbursementByReimbursementIds(@Param("reimbursementIds") Long[] reimbursementIds, @Param("deleteByName") String deleteByName);
}
