package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.yixiu.service.IQrCodeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.yixiu.domain.MzcEquipment;
import com.ruoyi.yixiu.service.IMzcEquipmentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备列表Controller
 * 
 * @author mmmmnd
 * @date 2023-01-24
 */
@RestController
@RequestMapping("/yixiu/equipment")
public class MzcEquipmentController extends BaseController
{

    @Autowired
    private IMzcEquipmentService mzcEquipmentService;

    /**
     * 查询设备列表列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:list')")
    @GetMapping("/list")
    public TableDataInfo list(MzcEquipment mzcEquipment)
    {
        startPage();
        List<MzcEquipment> list = mzcEquipmentService.selectMzcEquipmentList(mzcEquipment);
        return getDataTable(list);
    }

    /**
     * 导出设备列表列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:export')")
    @Log(title = "设备列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcEquipment mzcEquipment)
    {
        List<MzcEquipment> list = mzcEquipmentService.selectMzcEquipmentList(mzcEquipment);
        ExcelUtil<MzcEquipment> util = new ExcelUtil<MzcEquipment>(MzcEquipment.class);
        util.exportExcel(response, list, "设备列表数据");
    }

    /**
     * 获取设备列表详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:query')")
    @GetMapping(value = "/{equipmentId}")
    public AjaxResult getInfo(@PathVariable("equipmentId") Long equipmentId)
    {
        return success(mzcEquipmentService.selectMzcEquipmentByEquipmentId(equipmentId));
    }

    /**
     * 通过单位id获取设备列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:query')")
    @GetMapping("/getDeptEquipmentList")
    public AjaxResult selectDeptEquipmentByDeptId(@RequestParam Long deptId)
    {
        return success(mzcEquipmentService.selectDeptEquipmentByDeptId(deptId));
    }
    /**
     * 新增设备列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:add')")
    @Log(title = "设备列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MzcEquipment mzcEquipment)
    {
        mzcEquipment.setCreateBy(getUsername());

        return toAjax(mzcEquipmentService.insertMzcEquipment(mzcEquipment));
    }

    /**
     * 修改设备列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:edit')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MzcEquipment mzcEquipment)
    {
        mzcEquipment.setUpdateBy(getUsername());

        return toAjax(mzcEquipmentService.updateMzcEquipment(mzcEquipment));
    }

    /**
     * 删除设备列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:remove')")
    @Log(title = "设备列表", businessType = BusinessType.DELETE)
	  @DeleteMapping("/{equipmentIds}")
    public AjaxResult remove(@PathVariable Long[] equipmentIds)
    {
        String deleteByName = getUsername();

        return toAjax(mzcEquipmentService.deleteMzcEquipmentByEquipmentIds(equipmentIds,deleteByName));
    }
}
