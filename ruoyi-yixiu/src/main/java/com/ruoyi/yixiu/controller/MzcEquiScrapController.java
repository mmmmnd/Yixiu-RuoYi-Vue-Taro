package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.yixiu.domain.MzcEquiScrap;
import com.ruoyi.yixiu.service.IMzcEquiScrapService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备报废关联Controller
 * 
 * @author mmmmnd
 * @date 2023-01-30
 */
@RestController
@RequestMapping("/yixiu/equiScrap")
public class MzcEquiScrapController extends BaseController
{
    @Autowired
    private IMzcEquiScrapService mzcEquiScrapService;

    /**
     * 查询设备报废关联列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:list')")
    @GetMapping("/list")
    public TableDataInfo list(MzcEquiScrap mzcEquiScrap)
    {
        startPage();
        List<MzcEquiScrap> list = mzcEquiScrapService.selectMzcEquiScrapList(mzcEquiScrap);
        return getDataTable(list);
    }

    /**
     * 导出设备报废关联列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:export')")
    @Log(title = "设备报废关联", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcEquiScrap mzcEquiScrap)
    {
        List<MzcEquiScrap> list = mzcEquiScrapService.selectMzcEquiScrapList(mzcEquiScrap);
        ExcelUtil<MzcEquiScrap> util = new ExcelUtil<MzcEquiScrap>(MzcEquiScrap.class);
        util.exportExcel(response, list, "设备报废关联数据");
    }

    /**
     * 获取设备报废关联详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:query')")
    @GetMapping(value = "/{equipmentId}")
    public AjaxResult getInfo(@PathVariable("equipmentId") Long equipmentId)
    {
        return success(mzcEquiScrapService.selectMzcEquiScrapByEquipmentId(equipmentId));
    }

    /**
     * 修改设备报废关联
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:edit')")
    @Log(title = "设备报废关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MzcEquiScrap mzcEquiScrap)
    {
        return toAjax(mzcEquiScrapService.updateMzcEquiScrap(mzcEquiScrap));
    }

    /**
     * 删除设备报废关联
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:remove')")
    @Log(title = "设备报废关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{equipmentIds}")
    public AjaxResult remove(@PathVariable Long[] equipmentIds)
    {
        return toAjax(mzcEquiScrapService.deleteMzcEquiScrapByScrapIds(equipmentIds));
    }
}
