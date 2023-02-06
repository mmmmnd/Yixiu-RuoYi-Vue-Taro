package com.ruoyi.yixiu.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yixiu.domain.MzcParts;
import com.ruoyi.yixiu.domain.dto.parts.*;
import com.ruoyi.yixiu.service.IMzcPartsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 配件申请Controller
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Api(tags = "配件申请")
@RestController
@RequestMapping("/yixiu/parts")
public class MzcPartsController extends BaseController {
    @Autowired
    private IMzcPartsService mzcPartsService;

    /**
     * 查询配件申请列表
     */
    @ApiOperation("配件申请列表")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcParts> list(MzcPartsListDTO mzcPartsListDTO) {
        MzcParts mzcParts = new MzcParts();
        BeanUtils.copyBeanProp(mzcParts, mzcPartsListDTO);

        startPage();
        List<MzcParts> list = mzcPartsService.selectMzcPartsList(mzcParts);
        return getDataTable(list);
    }

    /**
     * 导出配件申请列表
     */
    @ApiOperation(value = "导出配件申请列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:export')")
    @Log(title = "配件申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcPartsExportDTO mzcPartsExportDTO) {
        MzcParts mzcParts = new MzcParts();
        BeanUtils.copyBeanProp(mzcParts, mzcPartsExportDTO);

        List<MzcParts> list = mzcPartsService.selectMzcPartsList(mzcParts);
        ExcelUtil<MzcParts> util = new ExcelUtil<MzcParts>(MzcParts.class);
        util.exportExcel(response, list, "配件申请数据");
    }

    /**
     * 获取配件申请详细信息
     */
    @ApiOperation("获取配件申请详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:query')")
    @GetMapping(value = "/{partsId}")
    public R<MzcParts> getInfo(@ApiParam(value = "配件ID", defaultValue = "1", required = true) @PathVariable("partsId") Long partsId) {
        return R.ok(mzcPartsService.selectMzcPartsByPartsId(partsId));
    }

    /**
     * 新增配件申请
     */
    @ApiOperation("新增配件申请")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:add')")
    @Log(title = "配件申请", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcPartsAddDTO mzcPartsAddDTO) {
        MzcParts mzcParts = new MzcParts();
        BeanUtils.copyBeanProp(mzcParts, mzcPartsAddDTO);

        return R.ok(mzcPartsService.insertMzcParts(mzcParts));
    }

    /**
     * 修改配件申请
     */
    @PreAuthorize("@ss.hasPermi('yixiu:parts:edit')")
    @Log(title = "配件申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcPartsEditDTO mzcPartsEditDTO) {
        MzcParts mzcParts = new MzcParts();
        BeanUtils.copyBeanProp(mzcParts, mzcPartsEditDTO);

        return R.ok(mzcPartsService.updateMzcParts(mzcParts));
    }

    /**
     * 审核不良事件
     */
    @ApiOperation("审核不良事件")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:audit')")
    @Log(title = "配件申请", businessType = BusinessType.UPDATE)
    @PutMapping("/audit/{partsId}")
    public R<Integer> audit(@RequestBody MzcPartsAuditDTO mzcPartsAuditDTO) {
        MzcParts mzcParts = new MzcParts();
        mzcParts.setAuditBy(getUsername());
        mzcParts.setAuditTime(DateUtils.getNowDate());
        BeanUtils.copyBeanProp(mzcParts, mzcPartsAuditDTO);

        return R.ok(mzcPartsService.updateMzcParts(mzcParts));
    }

    /**
     * 删除配件申请
     */
    @ApiOperation("删除配件申请")
    @ApiImplicitParam(name = "partsIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:parts:remove')")
    @Log(title = "配件申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{partsIds}")
    public R<Integer> remove(@PathVariable Long[] partsIds) {
        return R.ok(mzcPartsService.deleteMzcPartsByPartsIds(partsIds));
    }
}
