package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.order.MzcOrderAddDTO;
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
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 *
 * @author mmmmnd
 * @date 2023-02-19
 */
@RestController
@RequestMapping("/yixiu/order")
public class MzcOrderController extends BaseController
{
    @Autowired
    private IMzcOrderService mzcOrderService;

    /**
     * 查询订单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcOrder> list(MzcOrder mzcOrder)
    {
        startPage();
        List<MzcOrder> list = mzcOrderService.selectMzcOrderList(mzcOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:export')")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcOrder mzcOrder)
    {
        List<MzcOrder> list = mzcOrderService.selectMzcOrderList(mzcOrder);
        ExcelUtil<MzcOrder> util = new ExcelUtil<MzcOrder>(MzcOrder.class);
        util.exportExcel(response, list, "订单数据");
    }

    /**
     * 获取订单详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:query')")
    @GetMapping(value = "/{orderId}")
    public R<MzcOrder> getInfo(@PathVariable("orderId") Long orderId)
    {
        return R.ok(mzcOrderService.selectMzcOrderByOrderId(orderId));
    }

    /**
     * 新增订单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:add')")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcOrderAddDTO mzcOrderAddDTO)
    {
        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder,mzcOrderAddDTO);

        return R.ok(mzcOrderService.insertMzcOrder(mzcOrder));
    }

    /**
     * 修改订单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:edit')")
    @Log(title = "订单", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcOrder mzcOrder)
    {
        return R.ok(mzcOrderService.updateMzcOrder(mzcOrder));
    }

    /**
     * 删除订单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:order:remove')")
    @Log(title = "订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public R<Integer> remove(@PathVariable Long[] orderIds)
    {
        return R.ok(mzcOrderService.deleteMzcOrderByOrderIds(orderIds));
    }
}
