package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSinglepage;
import org.apache.ibatis.annotations.Param;

/**
 * 单页Mapper接口
 *
 * @author mmmmnd
 * @date 2023-03-03
 */
public interface MzcSinglepageMapper
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
     * 删除单页
     *
     * @param id 单页主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSinglepageById(@Param("id") Long id, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除单页
     *
     * @param ids 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSinglepageByIds(@Param("ids") Long[] ids, @Param("deleteByName") String deleteByName);
}
