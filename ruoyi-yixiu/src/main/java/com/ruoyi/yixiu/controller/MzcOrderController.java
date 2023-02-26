package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.order.*;
import io.swagger.annotations.Api;
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
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.yixiu.domain.MzcOrder;
import com.ruoyi.yixiu.service.IMzcOrderService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单Controller
 *
 * @author mmmmnd
 * @date 2023-02-24
 */
@Api(tags = "订单")
@RestController
@RequestMapping("/yixiu/order")
public class MzcOrderController extends BaseController
{
    @Autowired
    private IMzcOrderService mzcOrderService;

    /**
     * 查询订单列表
     */
    @ApiOperation("订单列表")
    @PreAuthorize("@ss.hasPermi('yixiu:order:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcOrder> list(MzcOrderListDTO mzcOrderListDTO)
    {
        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder, mzcOrderListDTO);

        startPage();
        List<MzcOrder> list = mzcOrderService.selectMzcOrderList(mzcOrder);
        return getDataTable(list);
    }

    /**
     * 导出订单列表
     */
    @ApiOperation(value = "导出订单列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:order:export')")
    @Log(title = "订单", businessType = BusinessType.EXPORT)
    @PostMapping(value="/export",produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcOrder mzcOrder)
    {
        List<MzcOrder> list = mzcOrderService.selectMzcOrderList(mzcOrder);
        ExcelUtil<MzcOrder> util = new ExcelUtil<MzcOrder>(MzcOrder.class);
        util.exportExcel(response, list, "订单数据");
    }

    /**
     * 获取订单详细信息
     */
    @ApiOperation("获取订单详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:order:query')")
    @GetMapping(value = "/{orderId}")
    public R<MzcOrder> getInfo(@ApiParam(value = "订单详细ID", defaultValue = "1", required = true) @PathVariable("orderId") Long orderId)
    {
        return R.ok(mzcOrderService.selectMzcOrderByOrderId(orderId));
    }

    /**
     * 新增订单
     */
    @ApiOperation("新增订单")
    @PreAuthorize("@ss.hasPermi('yixiu:order:add')")
    @Log(title = "订单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcOrderAddDTO mzcOrderAddDTO)
    {
        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder, mzcOrderAddDTO);

        return  R.ok(mzcOrderService.insertMzcOrder(mzcOrder));
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
    @ApiOperation("删除订单")
    @PreAuthorize("@ss.hasPermi('yixiu:order:remove')")
    @Log(title = "订单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{orderIds}")
    public R<Integer> remove(@PathVariable Long[] orderIds)
    {
        return R.ok(mzcOrderService.deleteMzcOrderByOrderIds(orderIds));
    }

    /**
     * 自主接单
     */
    @ApiOperation("自主接单")
    @PreAuthorize("@ss.hasPermi('yixiu:order:pick')")
    @Log(title = "自主接单", businessType = BusinessType.INSERT)
    @PostMapping("/pick")
    public R<Integer> pick(@RequestBody MzcOrderPickDTO mzcOrderPickDTO)
    {
        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder, mzcOrderPickDTO);

        return R.ok(mzcOrderService.pickOrder(mzcOrder));
    }

    /**
     * 系统派单
     */
    @ApiOperation("系统派单")
    @PreAuthorize("@ss.hasPermi('yixiu:order:send')")
    @Log(title = "系统派单", businessType = BusinessType.INSERT)
    @PostMapping("/send")
    public R<Integer> send(@RequestBody MzcOrderSendDTO mzcOrderSendDTO)
    {
        MzcOrder mzcOrder = new MzcOrder();
        BeanUtils.copyBeanProp(mzcOrder, mzcOrderSendDTO);

        return R.ok(mzcOrderService.sendOrder(mzcOrder));
    }

    /**
     * 订单检测
     */
    @ApiOperation("订单检测")
    @PreAuthorize("@ss.hasPermi('yixiu:order:detection')")
    @Log(title = "订单检测", businessType = BusinessType.INSERT)
    @PostMapping("/detection")
    public R<Integer> detection(@ApiParam(value = "订单ID", defaultValue = "1", required = true) @PathVariable("orderId") Long orderId)
    {
        return R.ok(mzcOrderService.detectionOrder(orderId));
    }
}
