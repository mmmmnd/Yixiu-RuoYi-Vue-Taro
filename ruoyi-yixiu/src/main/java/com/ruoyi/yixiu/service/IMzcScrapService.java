package com.ruoyi.yixiu.service;

import java.util.List;

import com.ruoyi.yixiu.domain.MzcEquipment;
import com.ruoyi.yixiu.domain.MzcScrap;

/**
 * 报废申请Service接口
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
public interface IMzcScrapService 
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
     * 批量删除报废申请
     * 
     * @param scrapIds 需要删除的报废申请主键集合
     * @return 结果
     */
    public int deleteMzcScrapByScrapIds(Long[] scrapIds);

    /**
     * 删除报废申请信息
     * 
     * @param scrapId 报废申请主键
     * @return 结果
     */
    public int deleteMzcScrapByScrapId(Long scrapId);
}
