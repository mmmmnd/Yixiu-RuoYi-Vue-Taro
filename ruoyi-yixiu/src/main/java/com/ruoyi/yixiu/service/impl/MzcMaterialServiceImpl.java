package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcMaterialMapper;
import com.ruoyi.yixiu.domain.MzcMaterial;
import com.ruoyi.yixiu.service.IMzcMaterialService;

/**
 * 耗材Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@Service
public class MzcMaterialServiceImpl implements IMzcMaterialService
{
    @Autowired
    private MzcMaterialMapper mzcMaterialMapper;

    /**
     * 查询耗材
     *
     * @param materialId 耗材主键
     * @return 耗材
     */
    @Override
    public MzcMaterial selectMzcMaterialByMaterialId(Long materialId)
    {
        return mzcMaterialMapper.selectMzcMaterialByMaterialId(materialId);
    }

    /**
     * 查询耗材列表
     *
     * @param mzcMaterial 耗材
     * @return 耗材
     */
    @Override
    public List<MzcMaterial> selectMzcMaterialList(MzcMaterial mzcMaterial)
    {
        return mzcMaterialMapper.selectMzcMaterialList(mzcMaterial);
    }

    /**
     * 新增耗材
     *
     * @param mzcMaterial 耗材
     * @return 结果
     */
    @Override
    public int insertMzcMaterial(MzcMaterial mzcMaterial)
    {
        mzcMaterial.setCreateTime(DateUtils.getNowDate());
        mzcMaterial.setCreateBy(getUsername());
        return mzcMaterialMapper.insertMzcMaterial(mzcMaterial);
    }

    /**
     * 修改耗材
     *
     * @param mzcMaterial 耗材
     * @return 结果
     */
    @Override
    public int updateMzcMaterial(MzcMaterial mzcMaterial)
    {
        mzcMaterial.setUpdateTime(DateUtils.getNowDate());
        mzcMaterial.setUpdateBy(getUsername());
        return mzcMaterialMapper.updateMzcMaterial(mzcMaterial);
    }

    /**
     * 批量删除耗材
     *
     * @param materialIds 需要删除的耗材主键
     * @return 结果
     */
    @Override
    public int deleteMzcMaterialByMaterialIds(Long[] materialIds)
    {
        String deleteByName = getUsername();
        return mzcMaterialMapper.deleteMzcMaterialByMaterialIds(materialIds,deleteByName);
    }

    /**
     * 删除耗材信息
     *
     * @param materialId 耗材主键
     * @return 结果
     */
    @Override
    public int deleteMzcMaterialByMaterialId(Long materialId)
    {
        String deleteByName = getUsername();
        return mzcMaterialMapper.deleteMzcMaterialByMaterialId(materialId,deleteByName);
    }
}
