package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
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
import com.ruoyi.yixiu.domain.MzcOrderParts;
import com.ruoyi.yixiu.service.IMzcOrderPartsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单配件Controller
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
@RestController
@RequestMapping("/yixiu/orderParts")
public class MzcOrderPartsController extends BaseController
{
    @Autowired
    private IMzcOrderPartsService mzcOrderPartsService;

    /**
     * 查询订单配件列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcOrderParts> list(MzcOrderParts mzcOrderParts)
    {
        startPage();
        List<MzcOrderParts> list = mzcOrderPartsService.selectMzcOrderPartsList(mzcOrderParts);
        return getDataTable(list);
    }

    /**
     * 导出订单配件列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:export')")
    @Log(title = "订单配件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcOrderParts mzcOrderParts)
    {
        List<MzcOrderParts> list = mzcOrderPartsService.selectMzcOrderPartsList(mzcOrderParts);
        ExcelUtil<MzcOrderParts> util = new ExcelUtil<MzcOrderParts>(MzcOrderParts.class);
        util.exportExcel(response, list, "订单配件数据");
    }

    /**
     * 获取订单配件详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:query')")
    @GetMapping(value = "/{partsId}")
    public R<MzcOrderParts> getInfo(@PathVariable("partsId") Long partsId)
    {
        return R.ok(mzcOrderPartsService.selectMzcOrderPartsByPartsId(partsId));
    }

    /**
     * 新增订单配件
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:add')")
    @Log(title = "订单配件", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcOrderParts mzcOrderParts)
    {
        return  R.ok(mzcOrderPartsService.insertMzcOrderParts(mzcOrderParts));
    }

    /**
     * 修改订单配件
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:edit')")
    @Log(title = "订单配件", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcOrderParts mzcOrderParts)
    {
        return R.ok(mzcOrderPartsService.updateMzcOrderParts(mzcOrderParts));
    }

    /**
     * 删除订单配件
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:remove')")
    @Log(title = "订单配件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{partsIds}")
    public R<Integer> remove(@PathVariable Long[] partsIds)
    {
        return R.ok(mzcOrderPartsService.deleteMzcOrderPartsByPartsIds(partsIds));
    }
}
