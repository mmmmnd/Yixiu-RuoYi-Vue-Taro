package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSwiper;
import org.apache.ibatis.annotations.Param;

/**
 * 轮播图Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-17
 */
public interface MzcSwiperMapper
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
     * 删除轮播图
     *
     * @param swiperId 轮播图主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSwiperBySwiperId(@Param("swiperId") Long swiperId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除轮播图
     *
     * @param swiperIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSwiperBySwiperIds(@Param("swiperIds") Long[] swiperIds, @Param("deleteByName") String deleteByName);
}
