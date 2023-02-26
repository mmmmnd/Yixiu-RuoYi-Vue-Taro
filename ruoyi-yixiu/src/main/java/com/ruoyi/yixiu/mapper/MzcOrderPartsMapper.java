package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrderParts;
import com.ruoyi.yixiu.domain.MzcParts;
import org.apache.ibatis.annotations.Param;

/**
 * 订单配件Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
public interface MzcOrderPartsMapper
{
    /**
     * 查询订单配件
     *
     * @param partsId 订单配件主键
     * @return 订单配件
     */
    public MzcOrderParts selectMzcOrderPartsByPartsId(Long partsId);

    /**
     * 查询订单配件列表
     *
     * @param mzcOrderParts 订单配件
     * @return 订单配件集合
     */
    public List<MzcOrderParts> selectMzcOrderPartsList(MzcOrderParts mzcOrderParts);

    /**
     * 新增订单配件
     *
     * @param mzcOrderParts 订单配件
     * @return 结果
     */
    public int insertMzcOrderParts(MzcOrderParts mzcOrderParts);

    /**
     * 修改订单配件
     *
     * @param mzcOrderParts 订单配件
     * @return 结果
     */
    public int updateMzcOrderParts(MzcOrderParts mzcOrderParts);

    /**
     * 删除订单配件
     *
     * @param partsId 订单配件主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderPartsByPartsId(@Param("partsId") Long partsId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除订单配件
     *
     * @param partsIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcOrderPartsByPartsIds(@Param("partsIds") Long[] partsIds, @Param("deleteByName") String deleteByName);

    /**
     * 批量新增配件申请
     *
     * @param mzcPartsList 配件申请列表
     * @return 结果
     */
    public int batchMzcParts(List<MzcOrderParts> mzcPartsList);
}
