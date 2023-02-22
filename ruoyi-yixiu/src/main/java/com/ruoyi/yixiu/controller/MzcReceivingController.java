package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;
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
import com.ruoyi.yixiu.domain.MzcReceiving;
import com.ruoyi.yixiu.service.IMzcReceivingService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 接单Controller
 *
 * @author mmmmnd
 * @date 2023-02-21
 */
@RestController
@RequestMapping("/yixiu/receiving")
public class MzcReceivingController extends BaseController
{
    @Autowired
    private IMzcReceivingService mzcReceivingService;

    @Resource
    private IMzcOrderService mzcOrderService;

    /**
     * 查询接单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcReceiving> list(MzcReceiving mzcReceiving)
    {
        startPage();
        List<MzcReceiving> list = mzcReceivingService.selectMzcReceivingList(mzcReceiving);
        return getDataTable(list);
    }

    /**
     * 导出接单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:export')")
    @Log(title = "接单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcReceiving mzcReceiving)
    {
        List<MzcReceiving> list = mzcReceivingService.selectMzcReceivingList(mzcReceiving);
        ExcelUtil<MzcReceiving> util = new ExcelUtil<MzcReceiving>(MzcReceiving.class);
        util.exportExcel(response, list, "接单数据");
    }

    /**
     * 获取接单详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:query')")
    @GetMapping(value = "/{receivingId}")
    public R<MzcReceiving> getInfo(@PathVariable("receivingId") Long receivingId)
    {
        return R.ok(mzcReceivingService.selectMzcReceivingByReceivingId(receivingId));
    }

    /**
     * 新增接单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:add')")
    @Log(title = "接单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcReceiving mzcReceiving)
    {
        MzcOrder mzcOrder = new MzcOrder();
        mzcOrder.setStatus("2");
        mzcOrderService.updateMzcOrder(mzcOrder);

        return R.ok(mzcReceivingService.insertMzcReceiving(mzcReceiving));
    }

    /**
     * 修改接单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:edit')")
    @Log(title = "接单", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcReceiving mzcReceiving)
    {
        return R.ok(mzcReceivingService.updateMzcReceiving(mzcReceiving));
    }

    /**
     * 删除接单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:receiving:remove')")
    @Log(title = "接单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{receivingIds}")
    public R<Integer> remove(@PathVariable Long[] receivingIds)
    {
        return R.ok(mzcReceivingService.deleteMzcReceivingByReceivingIds(receivingIds));
    }
}
