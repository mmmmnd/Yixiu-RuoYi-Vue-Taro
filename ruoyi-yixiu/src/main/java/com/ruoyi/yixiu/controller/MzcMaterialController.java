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
import com.ruoyi.yixiu.domain.MzcMaterial;
import com.ruoyi.yixiu.service.IMzcMaterialService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 耗材Controller
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@RestController
@RequestMapping("/yixiu/material")
public class MzcMaterialController extends BaseController
{
    @Autowired
    private IMzcMaterialService mzcMaterialService;

    /**
     * 查询耗材列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcMaterial> list(MzcMaterial mzcMaterial)
    {
        startPage();
        List<MzcMaterial> list = mzcMaterialService.selectMzcMaterialList(mzcMaterial);
        return getDataTable(list);
    }

    /**
     * 导出耗材列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:export')")
    @Log(title = "耗材", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcMaterial mzcMaterial)
    {
        List<MzcMaterial> list = mzcMaterialService.selectMzcMaterialList(mzcMaterial);
        ExcelUtil<MzcMaterial> util = new ExcelUtil<MzcMaterial>(MzcMaterial.class);
        util.exportExcel(response, list, "耗材数据");
    }

    /**
     * 获取耗材详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:query')")
    @GetMapping(value = "/{materialId}")
    public R<MzcMaterial> getInfo(@PathVariable("materialId") Long materialId)
    {
        return R.ok(mzcMaterialService.selectMzcMaterialByMaterialId(materialId));
    }

    /**
     * 新增耗材
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:add')")
    @Log(title = "耗材", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcMaterial mzcMaterial)
    {
        return  R.ok(mzcMaterialService.insertMzcMaterial(mzcMaterial));
    }

    /**
     * 修改耗材
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:edit')")
    @Log(title = "耗材", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcMaterial mzcMaterial)
    {
        return R.ok(mzcMaterialService.updateMzcMaterial(mzcMaterial));
    }

    /**
     * 删除耗材
     */
    @PreAuthorize("@ss.hasPermi('yixiu:material:remove')")
    @Log(title = "耗材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public R<Integer> remove(@PathVariable Long[] materialIds)
    {
        return R.ok(mzcMaterialService.deleteMzcMaterialByMaterialIds(materialIds));
    }
}
