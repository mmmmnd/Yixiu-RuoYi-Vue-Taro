package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.invoice.MzcInvoiceAddDTO;
import com.ruoyi.yixiu.domain.dto.invoice.MzcInvoiceEditDTO;
import com.ruoyi.yixiu.domain.dto.invoice.MzcInvoiceExportDTO;
import com.ruoyi.yixiu.domain.dto.invoice.MzcInvoiceListDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.yixiu.domain.MzcInvoice;
import com.ruoyi.yixiu.service.IMzcInvoiceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 发票Controller
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Api(tags = "发票")
@RestController
@RequestMapping("/yixiu/invoice")
public class MzcInvoiceController extends BaseController
{
    @Autowired
    private IMzcInvoiceService mzcInvoiceService;

    /**
     * 查询发票列表
     */
    @ApiOperation("发票列表")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcInvoice> list(MzcInvoiceListDTO mzcInvoiceListDTO)
    {
        MzcInvoice mzcInvoice = new MzcInvoice();
        BeanUtils.copyBeanProp(mzcInvoice,mzcInvoiceListDTO);

        startPage();
        List<MzcInvoice> list = mzcInvoiceService.selectMzcInvoiceList(mzcInvoice);
        return getDataTable(list);
    }

    /**
     * 导出发票列表
     */
    @ApiOperation("导出发票列表")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:export')")
    @Log(title = "发票", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export", produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcInvoiceExportDTO mzcInvoiceExportDTO)
    {
        MzcInvoice mzcInvoice = new MzcInvoice();
        BeanUtils.copyBeanProp(mzcInvoice,mzcInvoiceExportDTO);

        List<MzcInvoice> list = mzcInvoiceService.selectMzcInvoiceList(mzcInvoice);
        ExcelUtil<MzcInvoice> util = new ExcelUtil<MzcInvoice>(MzcInvoice.class);
        util.exportExcel(response, list, "发票数据");
    }

    /**
     * 获取发票详细信息
     */
    @ApiOperation(value = "获取发票详细信息", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:query')")
    @GetMapping(value = "/{invoiceId}")
    public R<MzcInvoice> getInfo(@PathVariable("invoiceId") Long invoiceId)
    {
        return R.ok(mzcInvoiceService.selectMzcInvoiceByInvoiceId(invoiceId));
    }

    /**
     * 新增发票
     */
    @ApiOperation("新增发票")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:add')")
    @Log(title = "发票", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcInvoiceAddDTO mzcInvoiceAddDTO)
    {
        MzcInvoice mzcInvoice = new MzcInvoice();
        BeanUtils.copyBeanProp(mzcInvoice,mzcInvoiceAddDTO);

        return  R.ok(mzcInvoiceService.insertMzcInvoice(mzcInvoice));
    }

    /**
     * 修改发票
     */
    @ApiOperation(value = "修改发票")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:edit')")
    @Log(title = "发票", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcInvoiceEditDTO mzcInvoiceEditDTO)
    {
        MzcInvoice mzcInvoice = new MzcInvoice();
        BeanUtils.copyBeanProp(mzcInvoice,mzcInvoiceEditDTO);

        return R.ok(mzcInvoiceService.updateMzcInvoice(mzcInvoice));
    }

    /**
     * 删除发票
     */
    @ApiOperation("删除发票")
    @ApiImplicitParam(name = "invoiceIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:invoice:remove')")
    @Log(title = "发票", businessType = BusinessType.DELETE)
	@DeleteMapping("/{invoiceIds}")
    public R<Integer> remove(@PathVariable Long[] invoiceIds)
    {
        return R.ok(mzcInvoiceService.deleteMzcInvoiceByInvoiceIds(invoiceIds));
    }
}
