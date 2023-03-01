package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcReimbursement;
import com.ruoyi.yixiu.domain.dto.reimbursement.MzcReimbursementListDTO;

/**
 * 报销Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface IMzcReimbursementService 
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
     * @param mzcReimbursementListDTO 报销
     * @return 报销集合
     */
    public List<MzcReimbursement> selectMzcReimbursementList(MzcReimbursementListDTO mzcReimbursementListDTO);

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
     * 批量删除报销
     * 
     * @param reimbursementIds 需要删除的报销主键集合
     * @return 结果
     */
    public int deleteMzcReimbursementByReimbursementIds(Long[] reimbursementIds);

    /**
     * 删除报销信息
     * 
     * @param reimbursementId 报销主键
     * @return 结果
     */
    public int deleteMzcReimbursementByReimbursementId(Long reimbursementId);
}
