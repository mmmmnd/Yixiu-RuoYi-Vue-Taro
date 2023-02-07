package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcInvoice;

/**
 * 发票Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface IMzcInvoiceService 
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
     * 批量删除发票
     * 
     * @param invoiceIds 需要删除的发票主键集合
     * @return 结果
     */
    public int deleteMzcInvoiceByInvoiceIds(Long[] invoiceIds);

    /**
     * 删除发票信息
     * 
     * @param invoiceId 发票主键
     * @return 结果
     */
    public int deleteMzcInvoiceByInvoiceId(Long invoiceId);
}
