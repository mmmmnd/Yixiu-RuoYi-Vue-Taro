package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcOrderParts;
import com.ruoyi.yixiu.domain.MzcParts;

/**
 * 订单配件Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-26
 */
public interface IMzcOrderPartsService 
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
     * 批量删除订单配件
     * 
     * @param partsIds 需要删除的订单配件主键集合
     * @return 结果
     */
    public int deleteMzcOrderPartsByPartsIds(Long[] partsIds);

    /**
     * 删除订单配件信息
     * 
     * @param partsId 订单配件主键
     * @return 结果
     */
    public int deleteMzcOrderPartsByPartsId(Long partsId);

    /**
     * 批量新增配件
     *
     * @param mzcPartsList 订单配件
     * @param feedbackId   反馈单id
     */
    public void batchMzcParts(List<MzcOrderParts> mzcPartsList, Long feedbackId);

    /**
     * 批量修改配件
     *
     * @param mzcPartsList 订单配件
     */
    public void batchUpdateMzcParts(List<MzcOrderParts> mzcPartsList);
}
