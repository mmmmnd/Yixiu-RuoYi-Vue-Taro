package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.burst.MzcBurstAddDTO;
import com.ruoyi.yixiu.domain.dto.burst.MzcBurstEditDTO;
import com.ruoyi.yixiu.domain.dto.burst.MzcBurstExportDTO;
import com.ruoyi.yixiu.domain.dto.burst.MzcBurstLIstDTO;
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
import com.ruoyi.yixiu.domain.MzcBurst;
import com.ruoyi.yixiu.service.IMzcBurstService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 不良事件Controller
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Api(tags = "不良事件")
@RestController
@RequestMapping("/yixiu/burst")
public class MzcBurstController extends BaseController
{
    @Autowired
    private IMzcBurstService mzcBurstService;

    /**
     * 查询不良事件列表
     */
    @ApiOperation("不良事件列表")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcBurst> list(MzcBurstLIstDTO mzcBurstLIstDTO)
    {
        MzcBurst mzcBurst = new MzcBurst();
        BeanUtils.copyBeanProp(mzcBurst,mzcBurstLIstDTO);

        startPage();
        List<MzcBurst> list = mzcBurstService.selectMzcBurstList(mzcBurst);
        return getDataTable(list);
    }

    /**
     * 导出不良事件列表
     */
    @ApiOperation(value = "导出不良事件列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:export')")
    @Log(title = "不良事件", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export",produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcBurstExportDTO mzcBurstExportDTO)
    {
        MzcBurst mzcBurst = new MzcBurst();
        BeanUtils.copyBeanProp(mzcBurst,mzcBurstExportDTO);

        List<MzcBurst> list = mzcBurstService.selectMzcBurstList(mzcBurst);
        ExcelUtil<MzcBurst> util = new ExcelUtil<MzcBurst>(MzcBurst.class);
        util.exportExcel(response, list, "不良事件数据");
    }

    /**
     * 获取不良事件详细信息
     */
    @ApiOperation("获取不良事件详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:query')")
    @GetMapping(value = "/{burstId}")
    public R<MzcBurst> getInfo(@ApiParam(value = "不良事件ID", defaultValue = "1", required = true) @PathVariable("burstId") Long burstId)
    {
        return R.ok(mzcBurstService.selectMzcBurstByBurstId(burstId));
    }

    /**
     * 新增不良事件
     */
    @ApiOperation("新增不良事件")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:add')")
    @Log(title = "不良事件", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcBurstAddDTO mzcBurstAddDTO)
    {
        MzcBurst mzcBurst = new MzcBurst();
        BeanUtils.copyBeanProp(mzcBurst,mzcBurstAddDTO);

        return  R.ok(mzcBurstService.insertMzcBurst(mzcBurst));
    }

    /**
     * 修改不良事件
     */
    @ApiOperation("修改不良事件")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:edit')")
    @Log(title = "不良事件", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcBurstEditDTO mzcBurstEditDTO)
    {
        MzcBurst mzcBurst = new MzcBurst();
        BeanUtils.copyBeanProp(mzcBurst,mzcBurstEditDTO);

        return R.ok(mzcBurstService.updateMzcBurst(mzcBurst));
    }

    /**
     * 删除不良事件
     */
    @ApiOperation("删除不良事件")
    @ApiImplicitParam(name = "complaintIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:burst:remove')")
    @Log(title = "不良事件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{burstIds}")
    public R<Integer> remove(@PathVariable Long[] burstIds)
    {
        return R.ok(mzcBurstService.deleteMzcBurstByBurstIds(burstIds));
    }
}
