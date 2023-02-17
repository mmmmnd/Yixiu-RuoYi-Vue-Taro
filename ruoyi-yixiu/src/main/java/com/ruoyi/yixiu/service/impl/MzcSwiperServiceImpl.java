package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcSwiperMapper;
import com.ruoyi.yixiu.domain.MzcSwiper;
import com.ruoyi.yixiu.service.IMzcSwiperService;

/**
 * 轮播图Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-17
 */
@Service
public class MzcSwiperServiceImpl implements IMzcSwiperService
{
    @Autowired
    private MzcSwiperMapper mzcSwiperMapper;

    /**
     * 查询轮播图
     *
     * @param swiperId 轮播图主键
     * @return 轮播图
     */
    @Override
    public MzcSwiper selectMzcSwiperBySwiperId(Long swiperId)
    {
        return mzcSwiperMapper.selectMzcSwiperBySwiperId(swiperId);
    }

    /**
     * 查询轮播图列表
     *
     * @param mzcSwiper 轮播图
     * @return 轮播图
     */
    @Override
    public List<MzcSwiper> selectMzcSwiperList(MzcSwiper mzcSwiper)
    {
        return mzcSwiperMapper.selectMzcSwiperList(mzcSwiper);
    }

    /**
     * 新增轮播图
     *
     * @param mzcSwiper 轮播图
     * @return 结果
     */
    @Override
    public int insertMzcSwiper(MzcSwiper mzcSwiper)
    {
        mzcSwiper.setCreateTime(DateUtils.getNowDate());
        mzcSwiper.setCreateBy(getUsername());
        return mzcSwiperMapper.insertMzcSwiper(mzcSwiper);
    }

    /**
     * 修改轮播图
     *
     * @param mzcSwiper 轮播图
     * @return 结果
     */
    @Override
    public int updateMzcSwiper(MzcSwiper mzcSwiper)
    {
        mzcSwiper.setUpdateTime(DateUtils.getNowDate());
        mzcSwiper.setUpdateBy(getUsername());
        return mzcSwiperMapper.updateMzcSwiper(mzcSwiper);
    }

    /**
     * 批量删除轮播图
     *
     * @param swiperIds 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteMzcSwiperBySwiperIds(Long[] swiperIds)
    {
        String deleteByName = getUsername();
        return mzcSwiperMapper.deleteMzcSwiperBySwiperIds(swiperIds,deleteByName);
    }

    /**
     * 删除轮播图信息
     *
     * @param swiperId 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteMzcSwiperBySwiperId(Long swiperId)
    {
        String deleteByName = getUsername();
        return mzcSwiperMapper.deleteMzcSwiperBySwiperId(swiperId,deleteByName);
    }
}
