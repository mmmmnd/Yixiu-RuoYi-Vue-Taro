package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcParts;

/**
 * 配件申请Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-06
 */
public interface IMzcPartsService 
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
     * 批量删除配件申请
     * 
     * @param partsIds 需要删除的配件申请主键集合
     * @return 结果
     */
    public int deleteMzcPartsByPartsIds(Long[] partsIds);

    /**
     * 删除配件申请信息
     * 
     * @param partsId 配件申请主键
     * @return 结果
     */
    public int deleteMzcPartsByPartsId(Long partsId);
}
