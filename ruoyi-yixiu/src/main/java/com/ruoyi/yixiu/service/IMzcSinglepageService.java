package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSinglepage;

/**
 * 单页Service接口
 * 
 * @author mmmmnd
 * @date 2023-03-03
 */
public interface IMzcSinglepageService 
{
    /**
     * 查询单页
     * 
     * @param id 单页主键
     * @return 单页
     */
    public MzcSinglepage selectMzcSinglepageById(Long id);

    /**
     * 查询单页列表
     * 
     * @param mzcSinglepage 单页
     * @return 单页集合
     */
    public List<MzcSinglepage> selectMzcSinglepageList(MzcSinglepage mzcSinglepage);

    /**
     * 新增单页
     * 
     * @param mzcSinglepage 单页
     * @return 结果
     */
    public int insertMzcSinglepage(MzcSinglepage mzcSinglepage);

    /**
     * 修改单页
     * 
     * @param mzcSinglepage 单页
     * @return 结果
     */
    public int updateMzcSinglepage(MzcSinglepage mzcSinglepage);

    /**
     * 批量删除单页
     * 
     * @param ids 需要删除的单页主键集合
     * @return 结果
     */
    public int deleteMzcSinglepageByIds(Long[] ids);

    /**
     * 删除单页信息
     * 
     * @param id 单页主键
     * @return 结果
     */
    public int deleteMzcSinglepageById(Long id);
}
