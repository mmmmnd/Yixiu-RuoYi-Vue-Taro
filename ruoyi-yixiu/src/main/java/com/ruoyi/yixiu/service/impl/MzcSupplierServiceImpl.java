package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcSupplierMapper;
import com.ruoyi.yixiu.domain.MzcSupplier;
import com.ruoyi.yixiu.service.IMzcSupplierService;

/**
 * 供应商Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@Service
public class MzcSupplierServiceImpl implements IMzcSupplierService
{
    @Autowired
    private MzcSupplierMapper mzcSupplierMapper;

    /**
     * 查询供应商
     *
     * @param supplierId 供应商主键
     * @return 供应商
     */
    @Override
    public MzcSupplier selectMzcSupplierBySupplierId(Long supplierId)
    {
        return mzcSupplierMapper.selectMzcSupplierBySupplierId(supplierId);
    }

    /**
     * 查询供应商列表
     *
     * @param mzcSupplier 供应商
     * @return 供应商
     */
    @Override
    public List<MzcSupplier> selectMzcSupplierList(MzcSupplier mzcSupplier)
    {
        return mzcSupplierMapper.selectMzcSupplierList(mzcSupplier);
    }

    /**
     * 新增供应商
     *
     * @param mzcSupplier 供应商
     * @return 结果
     */
    @Override
    public int insertMzcSupplier(MzcSupplier mzcSupplier)
    {
        mzcSupplier.setCreateTime(DateUtils.getNowDate());
        mzcSupplier.setCreateBy(getUsername());
        return mzcSupplierMapper.insertMzcSupplier(mzcSupplier);
    }

    /**
     * 修改供应商
     *
     * @param mzcSupplier 供应商
     * @return 结果
     */
    @Override
    public int updateMzcSupplier(MzcSupplier mzcSupplier)
    {
        mzcSupplier.setUpdateTime(DateUtils.getNowDate());
        mzcSupplier.setUpdateBy(getUsername());
        return mzcSupplierMapper.updateMzcSupplier(mzcSupplier);
    }

    /**
     * 批量删除供应商
     *
     * @param supplierIds 需要删除的供应商主键
     * @return 结果
     */
    @Override
    public int deleteMzcSupplierBySupplierIds(Long[] supplierIds)
    {
        String deleteByName = getUsername();
        return mzcSupplierMapper.deleteMzcSupplierBySupplierIds(supplierIds,deleteByName);
    }

    /**
     * 删除供应商信息
     *
     * @param supplierId 供应商主键
     * @return 结果
     */
    @Override
    public int deleteMzcSupplierBySupplierId(Long supplierId)
    {
        String deleteByName = getUsername();
        return mzcSupplierMapper.deleteMzcSupplierBySupplierId(supplierId,deleteByName);
    }
}
