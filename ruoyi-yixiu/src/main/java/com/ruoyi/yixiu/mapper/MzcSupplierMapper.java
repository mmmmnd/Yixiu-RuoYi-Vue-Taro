package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcSupplier;
import org.apache.ibatis.annotations.Param;

/**
 * 供应商Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
public interface MzcSupplierMapper
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
     * 删除供应商
     *
     * @param supplierId 供应商主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSupplierBySupplierId(@Param("supplierId") Long supplierId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除供应商
     *
     * @param supplierIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcSupplierBySupplierIds(@Param("supplierIds") Long[] supplierIds, @Param("deleteByName") String deleteByName);
}
