package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcWxMapper;
import com.ruoyi.yixiu.domain.MzcWx;
import com.ruoyi.yixiu.service.IMzcWxService;

/**
 * 微信用户Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-14
 */
@Service
public class MzcWxServiceImpl implements IMzcWxService
{
    @Autowired
    private MzcWxMapper mzcWxMapper;

    /**
     * 查询微信用户
     *
     * @param wxUserId 微信用户主键
     * @return 微信用户
     */
    @Override
    public MzcWx selectMzcWxByWxUserId(Long wxUserId)
    {
        return mzcWxMapper.selectMzcWxByWxUserId(wxUserId);
    }

    /**
     * 查询微信用户列表
     *
     * @param mzcWx 微信用户
     * @return 微信用户
     */
    @Override
    public List<MzcWx> selectMzcWxList(MzcWx mzcWx)
    {
        return mzcWxMapper.selectMzcWxList(mzcWx);
    }

    /**
     * 新增微信用户
     *
     * @param mzcWx 微信用户
     * @return 结果
     */
    @Override
    public int insertMzcWx(MzcWx mzcWx)
    {
        mzcWx.setCreateTime(DateUtils.getNowDate());
        mzcWx.setCreateBy(getUsername());
        return mzcWxMapper.insertMzcWx(mzcWx);
    }

    /**
     * 修改微信用户
     *
     * @param mzcWx 微信用户
     * @return 结果
     */
    @Override
    public int updateMzcWx(MzcWx mzcWx)
    {
        return mzcWxMapper.updateMzcWx(mzcWx);
    }

    /**
     * 批量删除微信用户
     *
     * @param wxUserIds 需要删除的微信用户主键
     * @return 结果
     */
    @Override
    public int deleteMzcWxByWxUserIds(Long[] wxUserIds)
    {
        String deleteByName = getUsername();
        return mzcWxMapper.deleteMzcWxByWxUserIds(wxUserIds,deleteByName);
    }

    /**
     * 删除微信用户信息
     *
     * @param wxUserId 微信用户主键
     * @return 结果
     */
    @Override
    public int deleteMzcWxByWxUserId(Long wxUserId)
    {
        String deleteByName = getUsername();
        return mzcWxMapper.deleteMzcWxByWxUserId(wxUserId,deleteByName);
    }
}
