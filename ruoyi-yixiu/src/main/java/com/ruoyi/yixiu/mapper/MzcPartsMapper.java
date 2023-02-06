package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcParts;
import org.apache.ibatis.annotations.Param;

/**
 * 配件申请Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface MzcPartsMapper
{
    /**
     * 查询配件申请
     *
     * @param partsId 配件申请主键
     * @return 配件申请
     */
    public MzcParts selectMzcPartsByPartsId(Long partsId);

    /**
     * 查询配件申请列表
     *
     * @param mzcParts 配件申请
     * @return 配件申请集合
     */
    public List<MzcParts> selectMzcPartsList(MzcParts mzcParts);

    /**
     * 新增配件申请
     *
     * @param mzcParts 配件申请
     * @return 结果
     */
    public int insertMzcParts(MzcParts mzcParts);

    /**
     * 修改配件申请
     *
     * @param mzcParts 配件申请
     * @return 结果
     */
    public int updateMzcParts(MzcParts mzcParts);

    /**
     * 删除配件申请
     *
     * @param partsId 配件申请主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcPartsByPartsId(@Param("partsId") Long partsId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除配件申请
     *
     * @param partsIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcPartsByPartsIds(@Param("partsIds") Long[] partsIds, @Param("deleteByName") String deleteByName);
}
