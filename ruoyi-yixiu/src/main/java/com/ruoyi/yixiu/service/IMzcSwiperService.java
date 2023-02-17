package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSwiper;

/**
 * 轮播图Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-17
 */
public interface IMzcSwiperService 
{
    /**
     * 查询轮播图
     * 
     * @param swiperId 轮播图主键
     * @return 轮播图
     */
    public MzcSwiper selectMzcSwiperBySwiperId(Long swiperId);

    /**
     * 查询轮播图列表
     * 
     * @param mzcSwiper 轮播图
     * @return 轮播图集合
     */
    public List<MzcSwiper> selectMzcSwiperList(MzcSwiper mzcSwiper);

    /**
     * 新增轮播图
     * 
     * @param mzcSwiper 轮播图
     * @return 结果
     */
    public int insertMzcSwiper(MzcSwiper mzcSwiper);

    /**
     * 修改轮播图
     * 
     * @param mzcSwiper 轮播图
     * @return 结果
     */
    public int updateMzcSwiper(MzcSwiper mzcSwiper);

    /**
     * 批量删除轮播图
     * 
     * @param swiperIds 需要删除的轮播图主键集合
     * @return 结果
     */
    public int deleteMzcSwiperBySwiperIds(Long[] swiperIds);

    /**
     * 删除轮播图信息
     * 
     * @param swiperId 轮播图主键
     * @return 结果
     */
    public int deleteMzcSwiperBySwiperId(Long swiperId);
}
