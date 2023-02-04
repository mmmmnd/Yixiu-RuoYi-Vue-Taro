package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcMaterial;

/**
 * 耗材Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface IMzcMaterialService 
{
    /**
     * 查询耗材
     * 
     * @param materialId 耗材主键
     * @return 耗材
     */
    public MzcMaterial selectMzcMaterialByMaterialId(Long materialId);

    /**
     * 查询耗材列表
     * 
     * @param mzcMaterial 耗材
     * @return 耗材集合
     */
    public List<MzcMaterial> selectMzcMaterialList(MzcMaterial mzcMaterial);

    /**
     * 新增耗材
     * 
     * @param mzcMaterial 耗材
     * @return 结果
     */
    public int insertMzcMaterial(MzcMaterial mzcMaterial);

    /**
     * 修改耗材
     * 
     * @param mzcMaterial 耗材
     * @return 结果
     */
    public int updateMzcMaterial(MzcMaterial mzcMaterial);

    /**
     * 批量删除耗材
     * 
     * @param materialIds 需要删除的耗材主键集合
     * @return 结果
     */
    public int deleteMzcMaterialByMaterialIds(Long[] materialIds);

    /**
     * 删除耗材信息
     * 
     * @param materialId 耗材主键
     * @return 结果
     */
    public int deleteMzcMaterialByMaterialId(Long materialId);
}
