package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSupplier;

/**
 * 供应商Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface IMzcSupplierService 
{
    /**
     * 查询供应商
     * 
     * @param supplierId 供应商主键
     * @return 供应商
     */
    public MzcSupplier selectMzcSupplierBySupplierId(Long supplierId);

    /**
     * 查询供应商列表
     * 
     * @param mzcSupplier 供应商
     * @return 供应商集合
     */
    public List<MzcSupplier> selectMzcSupplierList(MzcSupplier mzcSupplier);

    /**
     * 新增供应商
     * 
     * @param mzcSupplier 供应商
     * @return 结果
     */
    public int insertMzcSupplier(MzcSupplier mzcSupplier);

    /**
     * 修改供应商
     * 
     * @param mzcSupplier 供应商
     * @return 结果
     */
    public int updateMzcSupplier(MzcSupplier mzcSupplier);

    /**
     * 批量删除供应商
     * 
     * @param supplierIds 需要删除的供应商主键集合
     * @return 结果
     */
    public int deleteMzcSupplierBySupplierIds(Long[] supplierIds);

    /**
     * 删除供应商信息
     * 
     * @param supplierId 供应商主键
     * @return 结果
     */
    public int deleteMzcSupplierBySupplierId(Long supplierId);
}
