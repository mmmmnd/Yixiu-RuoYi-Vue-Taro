package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcComplaint;
import org.apache.ibatis.annotations.Param;

/**
 * 投诉Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface MzcComplaintMapper
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
     * @param mzcComplaint 投诉
     * @return 投诉集合
     */
    public List<MzcComplaint> selectMzcComplaintList(MzcComplaint mzcComplaint);

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
     * 删除投诉
     *
     * @param complaintId 投诉主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcComplaintByComplaintId(@Param("complaintId") Long complaintId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除投诉
     *
     * @param complaintIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcComplaintByComplaintIds(@Param("complaintIds") Long[] complaintIds, @Param("deleteByName") String deleteByName);
}
