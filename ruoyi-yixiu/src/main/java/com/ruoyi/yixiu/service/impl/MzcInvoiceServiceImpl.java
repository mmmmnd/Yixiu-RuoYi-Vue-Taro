package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcInvoiceMapper;
import com.ruoyi.yixiu.domain.MzcInvoice;
import com.ruoyi.yixiu.service.IMzcInvoiceService;

/**
 * 发票Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Service
public class MzcInvoiceServiceImpl implements IMzcInvoiceService
{
    @Autowired
    private MzcInvoiceMapper mzcInvoiceMapper;

    /**
     * 查询发票
     *
     * @param invoiceId 发票主键
     * @return 发票
     */
    @Override
    public MzcInvoice selectMzcInvoiceByInvoiceId(Long invoiceId)
    {
        return mzcInvoiceMapper.selectMzcInvoiceByInvoiceId(invoiceId);
    }

    /**
     * 查询发票列表
     *
     * @param mzcInvoice 发票
     * @return 发票
     */
    @Override
    public List<MzcInvoice> selectMzcInvoiceList(MzcInvoice mzcInvoice)
    {
        return mzcInvoiceMapper.selectMzcInvoiceList(mzcInvoice);
    }

    /**
     * 新增发票
     *
     * @param mzcInvoice 发票
     * @return 结果
     */
    @Override
    public int insertMzcInvoice(MzcInvoice mzcInvoice)
    {
        mzcInvoice.setCreateTime(DateUtils.getNowDate());
        mzcInvoice.setCreateBy(getUsername());
        return mzcInvoiceMapper.insertMzcInvoice(mzcInvoice);
    }

    /**
     * 修改发票
     *
     * @param mzcInvoice 发票
     * @return 结果
     */
    @Override
    public int updateMzcInvoice(MzcInvoice mzcInvoice)
    {
        mzcInvoice.setUpdateTime(DateUtils.getNowDate());
        mzcInvoice.setUpdateBy(getUsername());
        return mzcInvoiceMapper.updateMzcInvoice(mzcInvoice);
    }

    /**
     * 批量删除发票
     *
     * @param invoiceIds 需要删除的发票主键
     * @return 结果
     */
    @Override
    public int deleteMzcInvoiceByInvoiceIds(Long[] invoiceIds)
    {
        String deleteByName = getUsername();
        return mzcInvoiceMapper.deleteMzcInvoiceByInvoiceIds(invoiceIds,deleteByName);
    }

    /**
     * 删除发票信息
     *
     * @param invoiceId 发票主键
     * @return 结果
     */
    @Override
    public int deleteMzcInvoiceByInvoiceId(Long invoiceId)
    {
        String deleteByName = getUsername();
        return mzcInvoiceMapper.deleteMzcInvoiceByInvoiceId(invoiceId,deleteByName);
    }
}
