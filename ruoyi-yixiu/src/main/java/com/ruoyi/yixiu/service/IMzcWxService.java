package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcWx;

/**
 * 微信用户Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-14
 */
public interface IMzcWxService 
{

    /**
     * 通过code获取用户信息
     *
     * @param code code
     * @return 用户信息
     */
    public String login(String code);

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
     * 批量删除微信用户
     * 
     * @param wxUserIds 需要删除的微信用户主键集合
     * @return 结果
     */
    public int deleteMzcWxByWxUserIds(Long[] wxUserIds);

    /**
     * 删除微信用户信息
     * 
     * @param wxUserId 微信用户主键
     * @return 结果
     */
    public int deleteMzcWxByWxUserId(Long wxUserId);
}
