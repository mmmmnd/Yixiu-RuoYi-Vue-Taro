package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcScrap;
import org.apache.ibatis.annotations.Param;

/**
 * 报废申请Mapper接口
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public interface MzcScrapMapper 
{
    /**
     * 查询报废申请
     * 
     * @param scrapId 报废申请主键
     * @return 报废申请
     */
    public MzcScrap selectMzcScrapByScrapId(Long scrapId);

    /**
     * 查询报废申请列表
     * 
     * @param mzcScrap 报废申请
     * @return 报废申请集合
     */
    public List<MzcScrap> selectMzcScrapList(MzcScrap mzcScrap);

    /**
     * 新增报废申请
     * 
     * @param mzcScrap 报废申请
     * @return 结果
     */
    public int insertMzcScrap(MzcScrap mzcScrap);

    /**
     * 修改报废申请
     * 
     * @param mzcScrap 报废申请
     * @return 结果
     */
    public int updateMzcScrap(MzcScrap mzcScrap);

    /**
     * 删除报废申请
     * 
     * @param scrapId 报废申请主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcScrapByScrapId(@Param("scrapId") Long scrapId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除报废申请
     * 
     * @param scrapIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcScrapByScrapIds(@Param("scrapIds") Long[] scrapIds, @Param("deleteByName") String deleteByName);
}
