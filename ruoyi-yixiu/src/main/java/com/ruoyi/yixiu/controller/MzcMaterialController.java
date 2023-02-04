package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.material.MzcMaterialAddDTO;
import com.ruoyi.yixiu.domain.dto.material.MzcMaterialEditDTO;
import com.ruoyi.yixiu.domain.dto.material.MzcMaterialListDTO;
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
@Api(tags = "耗材")
@RestController
@RequestMapping("/yixiu/material")
public class MzcMaterialController extends BaseController
{
    @Autowired
    private IMzcMaterialService mzcMaterialService;

    /**
     * 查询耗材列表
     */
    @ApiOperation("耗材列表")
    @PreAuthorize("@ss.hasPermi('yixiu:material:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcMaterial> list(MzcMaterialListDTO mzcMaterialListDTO)
    {
        MzcMaterial mzcMaterial = new MzcMaterial();
        BeanUtils.copyBeanProp(mzcMaterial,mzcMaterialListDTO);

        startPage();
        List<MzcMaterial> list = mzcMaterialService.selectMzcMaterialList(mzcMaterial);
        return getDataTable(list);
    }

    /**
     * 导出耗材列表
     */
    @ApiOperation(value = "导出耗材列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:material:export')")
    @Log(title = "耗材", businessType = BusinessType.EXPORT)
    @PostMapping(value="/export", produces = "application/octet-stream")
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
    public R<MzcMaterial> getInfo(@ApiParam(value = "耗材ID", defaultValue = "1", required = true) @PathVariable("materialId") Long materialId)
    {
        return R.ok(mzcMaterialService.selectMzcMaterialByMaterialId(materialId));
    }

    /**
     * 新增耗材
     */
    @ApiOperation(value = "新增耗材")
    @PreAuthorize("@ss.hasPermi('yixiu:material:add')")
    @Log(title = "耗材", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcMaterialAddDTO mzcMaterialAddDTO)
    {
        MzcMaterial mzcMaterial = new MzcMaterial();
        BeanUtils.copyBeanProp(mzcMaterial,mzcMaterialAddDTO);

        return  R.ok(mzcMaterialService.insertMzcMaterial(mzcMaterial));
    }

    /**
     * 修改耗材
     */
    @ApiOperation(value = "修改耗材")
    @PreAuthorize("@ss.hasPermi('yixiu:material:edit')")
    @Log(title = "耗材", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcMaterialEditDTO mzcMaterialEditDTO)
    {
        MzcMaterial mzcMaterial = new MzcMaterial();
        BeanUtils.copyBeanProp(mzcMaterial,mzcMaterialEditDTO);

        return R.ok(mzcMaterialService.updateMzcMaterial(mzcMaterial));
    }

    /**
     * 删除耗材
     */
    @ApiOperation("删除报废申请")
    @ApiImplicitParam(name = "materialIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:material:remove')")
    @Log(title = "耗材", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public R<Integer> remove(@PathVariable Long[] materialIds)
    {
        return R.ok(mzcMaterialService.deleteMzcMaterialByMaterialIds(materialIds));
    }
}
