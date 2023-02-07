package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcInvoice;
import org.apache.ibatis.annotations.Param;

/**
 * 发票Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface MzcInvoiceMapper
{
    /**
     * 查询发票
     *
     * @param invoiceId 发票主键
     * @return 发票
     */
    public MzcInvoice selectMzcInvoiceByInvoiceId(Long invoiceId);

    /**
     * 查询发票列表
     *
     * @param mzcInvoice 发票
     * @return 发票集合
     */
    public List<MzcInvoice> selectMzcInvoiceList(MzcInvoice mzcInvoice);

    /**
     * 新增发票
     *
     * @param mzcInvoice 发票
     * @return 结果
     */
    public int insertMzcInvoice(MzcInvoice mzcInvoice);

    /**
     * 修改发票
     *
     * @param mzcInvoice 发票
     * @return 结果
     */
    public int updateMzcInvoice(MzcInvoice mzcInvoice);

    /**
     * 删除发票
     *
     * @param invoiceId 发票主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcInvoiceByInvoiceId(@Param("invoiceId") Long invoiceId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除发票
     *
     * @param invoiceIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcInvoiceByInvoiceIds(@Param("invoiceIds") Long[] invoiceIds, @Param("deleteByName") String deleteByName);
}
