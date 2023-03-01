package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcComplaint;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintListDTO;

/**
 * 投诉Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface IMzcComplaintService 
{
    /**
     * 查询投诉
     * 
     * @param complaintId 投诉主键
     * @return 投诉
     */
    public MzcComplaint selectMzcComplaintByComplaintId(Long complaintId);

    /**
     * 查询投诉列表
     * 
     * @param mzcComplaintListDTO 投诉
     * @return 投诉集合
     */
    public List<MzcComplaint> selectMzcComplaintList(MzcComplaintListDTO mzcComplaintListDTO);

    /**
     * 新增投诉
     * 
     * @param mzcComplaint 投诉
     * @return 结果
     */
    public int insertMzcComplaint(MzcComplaint mzcComplaint);

    /**
     * 修改投诉
     * 
     * @param mzcComplaint 投诉
     * @return 结果
     */
    public int updateMzcComplaint(MzcComplaint mzcComplaint);

    /**
     * 批量删除投诉
     * 
     * @param complaintIds 需要删除的投诉主键集合
     * @return 结果
     */
    public int deleteMzcComplaintByComplaintIds(Long[] complaintIds);

    /**
     * 删除投诉信息
     * 
     * @param complaintId 投诉主键
     * @return 结果
     */
    public int deleteMzcComplaintByComplaintId(Long complaintId);
}
