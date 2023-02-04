package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.MzcScrap;
import com.ruoyi.yixiu.domain.dto.supplier.MzcSupplierAddDTO;
import com.ruoyi.yixiu.domain.dto.supplier.MzcSupplierEditDTO;
import com.ruoyi.yixiu.domain.dto.supplier.MzcSupplierListDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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
import com.ruoyi.yixiu.domain.MzcSupplier;
import com.ruoyi.yixiu.service.IMzcSupplierService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 供应商Controller
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@Api(tags = "供应商")
@RestController
@RequestMapping("/yixiu/supplier")
public class MzcSupplierController extends BaseController
{
    @Autowired
    private IMzcSupplierService mzcSupplierService;

    /**
     * 查询供应商列表
     */
    @ApiOperation("供应商列表")
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcSupplier> list(MzcSupplierListDTO mzcSupplierListDTO)
    {
        MzcSupplier mzcSupplier = new MzcSupplier();
        BeanUtils.copyBeanProp(mzcSupplier, mzcSupplierListDTO);

        startPage();
        List<MzcSupplier> list = mzcSupplierService.selectMzcSupplierList(mzcSupplier);
        return getDataTable(list);
    }

    /**
     * 导出供应商列表
     */
    @ApiOperation(value = "导出供应商列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:export')")
    @Log(title = "供应商", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export",produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcSupplier mzcSupplier)
    {
        List<MzcSupplier> list = mzcSupplierService.selectMzcSupplierList(mzcSupplier);
        ExcelUtil<MzcSupplier> util = new ExcelUtil<MzcSupplier>(MzcSupplier.class);
        util.exportExcel(response, list, "供应商数据");
    }

    /**
     * 获取供应商详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:query')")
    @GetMapping(value = "/{supplierId}")
    public R<MzcSupplier> getInfo(@ApiParam(value = "供应商ID", defaultValue = "1", required = true) @PathVariable("supplierId") Long supplierId)
    {
        return R.ok(mzcSupplierService.selectMzcSupplierBySupplierId(supplierId));
    }

    /**
     * 新增供应商
     */
    @ApiOperation(value = "新增供应商")
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:add')")
    @Log(title = "供应商", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcSupplierAddDTO mzcSupplierAddDTO)
    {
        MzcSupplier mzcSupplier = new MzcSupplier();
        BeanUtils.copyBeanProp(mzcSupplier, mzcSupplierAddDTO);

        return  R.ok(mzcSupplierService.insertMzcSupplier(mzcSupplier));
    }

    /**
     * 修改供应商
     */
    @ApiOperation(value = "修改供应商")
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:edit')")
    @Log(title = "供应商", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcSupplierEditDTO mzcSupplierEditDTO)
    {
        MzcSupplier mzcSupplier = new MzcSupplier();
        BeanUtils.copyBeanProp(mzcSupplier, mzcSupplierEditDTO);

        return R.ok(mzcSupplierService.updateMzcSupplier(mzcSupplier));
    }

    /**
     * 删除供应商
     */
    @ApiOperation("删除报废申请")
    @ApiImplicitParam(name = "supplierIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:supplier:remove')")
    @Log(title = "供应商", businessType = BusinessType.DELETE)
	@DeleteMapping("/{supplierIds}")
    public R<Integer> remove(@PathVariable Long[] supplierIds)
    {
        return R.ok(mzcSupplierService.deleteMzcSupplierBySupplierIds(supplierIds));
    }
}
