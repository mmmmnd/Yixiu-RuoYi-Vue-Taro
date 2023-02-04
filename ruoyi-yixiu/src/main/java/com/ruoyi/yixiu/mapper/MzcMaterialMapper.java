package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcMaterial;
import org.apache.ibatis.annotations.Param;

/**
 * 耗材Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface MzcMaterialMapper
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
     * 删除耗材
     *
     * @param materialId 耗材主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcMaterialByMaterialId(@Param("materialId") Long materialId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除耗材
     *
     * @param materialIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcMaterialByMaterialIds(@Param("materialIds") Long[] materialIds, @Param("deleteByName") String deleteByName);
}
