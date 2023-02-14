package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcWx;
import org.apache.ibatis.annotations.Param;

/**
 * 微信用户Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-14
 */
public interface MzcWxMapper
{
    /**
     * 查询微信用户
     *
     * @param wxUserId 微信用户主键
     * @return 微信用户
     */
    public MzcWx selectMzcWxByWxUserId(Long wxUserId);

    /**
     * 查询微信用户列表
     *
     * @param mzcWx 微信用户
     * @return 微信用户集合
     */
    public List<MzcWx> selectMzcWxList(MzcWx mzcWx);

    /**
     * 新增微信用户
     *
     * @param mzcWx 微信用户
     * @return 结果
     */
    public int insertMzcWx(MzcWx mzcWx);

    /**
     * 修改微信用户
     *
     * @param mzcWx 微信用户
     * @return 结果
     */
    public int updateMzcWx(MzcWx mzcWx);

    /**
     * 删除微信用户
     *
     * @param wxUserId 微信用户主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcWxByWxUserId(@Param("wxUserId") Long wxUserId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除微信用户
     *
     * @param wxUserIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcWxByWxUserIds(@Param("wxUserIds") Long[] wxUserIds, @Param("deleteByName") String deleteByName);
}
