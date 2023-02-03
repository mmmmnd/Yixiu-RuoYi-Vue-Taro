package com.ruoyi.yixiu.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yixiu.domain.MzcScrap;
import com.ruoyi.yixiu.domain.dto.scrap.MzcScrapAddDTO;
import com.ruoyi.yixiu.domain.dto.scrap.MzcScrapEditDTO;
import com.ruoyi.yixiu.domain.dto.scrap.MzcScrapExportDTO;
import com.ruoyi.yixiu.domain.dto.scrap.MzcScrapListDTO;
import com.ruoyi.yixiu.service.IMzcEquiScrapService;
import com.ruoyi.yixiu.service.IMzcScrapService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 报废申请Controller
 *
 * @author mmmmnd
 * @date 2023-01-30
 */
@Api(tags = "报废申请")
@RestController
@RequestMapping("/yixiu/scrap")
public class MzcScrapController extends BaseController {
    @Autowired
    private IMzcScrapService mzcScrapService;

    @Resource
    private IMzcEquiScrapService mzcEquiScrapService;

    /**
     * 查询报废申请列表
     *
     * @return
     */
    @ApiOperation("报废申请列表")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcScrap> list(MzcScrapListDTO mzcScrapListDTO) {
        MzcScrap mzcScrap = new MzcScrap();
        BeanUtils.copyBeanProp(mzcScrap, mzcScrapListDTO);

        startPage();
        List<MzcScrap> list = mzcScrapService.selectMzcScrapList(mzcScrap);
        return getDataTable(list);
    }

    /**
     * 导出报废申请列表
     */
    @ApiOperation(value = "导出报废申请列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:export')")
    @Log(title = "报废申请", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export", produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcScrapExportDTO mzcScrapExportDTO) {
        MzcScrap mzcScrap = new MzcScrap();
        BeanUtils.copyBeanProp(mzcScrap, mzcScrapExportDTO);

        List<MzcScrap> list = mzcScrapService.selectMzcScrapList(mzcScrap);
        ExcelUtil<MzcScrap> util = new ExcelUtil<MzcScrap>(MzcScrap.class);
        util.exportExcel(response, list, "报废申请数据");
    }

    /**
     * 获取报废申请详细信息
     */
    @ApiOperation("获取报废申请详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:query')")
    @GetMapping(value = "/{scrapId}")
    public R<MzcScrap> getInfo(@ApiParam(value = "报废ID", defaultValue = "1", required = true) @PathVariable("scrapId") Long scrapId) {
        return R.ok(mzcScrapService.selectMzcScrapByScrapId(scrapId));
    }

    /**
     * 新增报废申请
     */
    @ApiOperation(value = "新增用户")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:add')")
    @Log(title = "报废申请", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Integer> add(@RequestBody MzcScrapAddDTO mzcScrapAddDTO) {
        MzcScrap mzcScrap = new MzcScrap();
        BeanUtils.copyBeanProp(mzcScrap, mzcScrapAddDTO);

        return R.ok(mzcScrapService.insertMzcScrap(mzcScrap));
    }

    /**
     * 修改报废申请
     */
    @ApiOperation("修改报废申请")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:edit')")
    @Log(title = "报废申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcScrapEditDTO mzcScrapEditDTO) {
        MzcScrap mzcScrap = new MzcScrap();
        BeanUtils.copyBeanProp(mzcScrap, mzcScrapEditDTO);

        /*删除所有报废关联数据*/
        mzcEquiScrapService.deleteMzcEquiScrapByScrapId(mzcScrap.getScrapId());
        /*新增设备报废关联*/
        mzcEquiScrapService.insertMzcEquiScrap(mzcScrap);

        return R.ok(mzcScrapService.updateMzcScrap(mzcScrap));
    }

    /**
     * 删除报废申请
     */
    @ApiOperation("删除报废申请")
    @ApiImplicitParam(name = "scrapIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:scrap:remove')")
    @Log(title = "报废申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{scrapIds}")
    public R<Integer> remove(@PathVariable Long[] scrapIds) {
        return R.ok(mzcScrapService.deleteMzcScrapByScrapIds(scrapIds));
    }
}
