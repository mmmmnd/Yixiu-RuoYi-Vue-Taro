package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.inventory.MzcInventoryAddDTO;
import com.ruoyi.yixiu.domain.dto.inventory.MzcInventoryEditDTO;
import com.ruoyi.yixiu.domain.dto.inventory.MzcInventoryExportDTO;
import com.ruoyi.yixiu.domain.dto.inventory.MzcInventoryListDTO;
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
import com.ruoyi.yixiu.domain.MzcInventory;
import com.ruoyi.yixiu.service.IMzcInventoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 配件清单Controller
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Api(tags = "配件清单")
@RestController
@RequestMapping("/yixiu/inventory")
public class MzcInventoryController extends BaseController
{
    @Autowired
    private IMzcInventoryService mzcInventoryService;

    /**
     * 查询配件清单列表
     */
    @ApiOperation("配件清单列表")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcInventory> list(MzcInventoryListDTO mzcInventoryListDTO)
    {
        MzcInventory mzcInventory = new MzcInventory();
        BeanUtils.copyBeanProp(mzcInventory,mzcInventoryListDTO);

        startPage();
        List<MzcInventory> list = mzcInventoryService.selectMzcInventoryList(mzcInventory);
        return getDataTable(list);
    }

    /**
     * 导出配件清单列表
     */
    @ApiOperation(value = "导出配件清单列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:export')")
    @Log(title = "配件清单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcInventoryExportDTO mzcInventoryExportDTO)
    {
        MzcInventory mzcInventory = new MzcInventory();
        BeanUtils.copyBeanProp(mzcInventory,mzcInventoryExportDTO);

        List<MzcInventory> list = mzcInventoryService.selectMzcInventoryList(mzcInventory);
        ExcelUtil<MzcInventory> util = new ExcelUtil<MzcInventory>(MzcInventory.class);
        util.exportExcel(response, list, "配件清单数据");
    }

    /**
     * 获取配件清单详细信息
     */
    @ApiOperation("获取配件清单详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:query')")
    @GetMapping(value = "/{inventoryId}")
    public R<MzcInventory> getInfo(@ApiParam(value = "配件清单ID", defaultValue = "1", required = true) @PathVariable("inventoryId") Long inventoryId)
    {
        return R.ok(mzcInventoryService.selectMzcInventoryByInventoryId(inventoryId));
    }

    /**
     * 新增配件清单
     */
    @ApiOperation(value = "新增配件清单")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:add')")
    @Log(title = "配件清单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcInventoryAddDTO mzcInventoryAddDTO)
    {
        MzcInventory mzcInventory = new MzcInventory();
        BeanUtils.copyBeanProp(mzcInventory,mzcInventoryAddDTO);

        return  R.ok(mzcInventoryService.insertMzcInventory(mzcInventory));
    }

    /**
     * 修改配件清单
     */
    @ApiOperation(value = "修改配件清单")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:edit')")
    @Log(title = "配件清单", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcInventoryEditDTO mzcInventoryEditDTO)
    {
        MzcInventory mzcInventory = new MzcInventory();
        BeanUtils.copyBeanProp(mzcInventory,mzcInventoryEditDTO);

        return R.ok(mzcInventoryService.updateMzcInventory(mzcInventory));
    }

    /**
     * 删除配件清单
     */
    @ApiOperation("删除配件清单")
    @ApiImplicitParam(name = "inventoryIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:inventory:remove')")
    @Log(title = "配件清单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{inventoryIds}")
    public R<Integer> remove(@PathVariable Long[] inventoryIds)
    {
        return R.ok(mzcInventoryService.deleteMzcInventoryByInventoryIds(inventoryIds));
    }
}
