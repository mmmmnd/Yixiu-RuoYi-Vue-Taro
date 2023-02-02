package com.ruoyi.yixiu.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yixiu.domain.MzcScrap;
import com.ruoyi.yixiu.service.IMzcEquiScrapService;
import com.ruoyi.yixiu.service.IMzcScrapService;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 报废申请Controller
 *
 * @author mmmmnd
 * @date 2023-01-30
 */
@RestController
@RequestMapping("/yixiu/scrap")
public class MzcScrapController extends BaseController {
    @Autowired
    private IMzcScrapService mzcScrapService;

    @Resource
    private IMzcEquiScrapService mzcEquiScrapService;

    /**
     * 查询报废申请列表
     * @return
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:list')")
    @GetMapping("/list")
    public TableDataInfo list(@RequestParam(required = false) MzcScrap mzcScrap) {
        startPage();
        List<MzcScrap> list = mzcScrapService.selectMzcScrapList(mzcScrap);
        return getDataTable(list);
    }

    /**
     * 导出报废申请列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:export')")
    @Log(title = "报废申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcScrap mzcScrap) {
        List<MzcScrap> list = mzcScrapService.selectMzcScrapList(mzcScrap);
        ExcelUtil<MzcScrap> util = new ExcelUtil<MzcScrap>(MzcScrap.class);
        util.exportExcel(response, list, "报废申请数据");
    }

    /**
     * 获取报废申请详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:query')")
    @GetMapping(value = "/{scrapId}")
    public AjaxResult getInfo(@PathVariable("scrapId") Long scrapId) {
        return success(mzcScrapService.selectMzcScrapByScrapId(scrapId));
    }

    /**
     * 新增报废申请
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:add')")
    @Log(title = "报废申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MzcScrap mzcScrap) {
        return toAjax(mzcScrapService.insertMzcScrap(mzcScrap));
    }

    /**
     * 修改报废申请
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:edit')")
    @Log(title = "报废申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MzcScrap mzcScrap) {

        /*删除所有报废关联数据*/
        mzcEquiScrapService.deleteMzcEquiScrapByScrapId(mzcScrap.getScrapId());
        /*新增设备报废关联*/
        mzcEquiScrapService.insertMzcEquiScrap(mzcScrap);

        return toAjax(mzcScrapService.updateMzcScrap(mzcScrap));
    }

    /**
     * 删除报废申请
     */
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:remove')")
    @Log(title = "报废申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{scrapIds}")
    public AjaxResult remove(@PathVariable Long[] scrapIds) {
        return toAjax(mzcScrapService.deleteMzcScrapByScrapIds(scrapIds));
    }
}
