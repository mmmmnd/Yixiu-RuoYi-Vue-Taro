package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.tool.MzcToolAddDTO;
import com.ruoyi.yixiu.domain.dto.tool.MzcToolEditDTO;
import com.ruoyi.yixiu.domain.dto.tool.MzcToolExportDTO;
import com.ruoyi.yixiu.domain.dto.tool.MzcToolListDTO;
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
import com.ruoyi.yixiu.domain.MzcTool;
import com.ruoyi.yixiu.service.IMzcToolService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 工具Controller
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Api(tags = "工具")
@RestController
@RequestMapping("/yixiu/tool")
public class MzcToolController extends BaseController
{
    @Autowired
    private IMzcToolService mzcToolService;

    /**
     * 查询工具列表
     */
    @ApiOperation("工具列表")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcTool> list(MzcToolListDTO mzcToolListDTO)
    {
        MzcTool mzcTool = new MzcTool();
        BeanUtils.copyBeanProp(mzcTool,mzcToolListDTO);

        startPage();
        List<MzcTool> list = mzcToolService.selectMzcToolList(mzcTool);
        return getDataTable(list);
    }

    /**
     * 导出工具列表
     */
    @ApiOperation(value = "导出工具列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:export')")
    @Log(title = "工具", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export", produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcToolExportDTO mzcToolExportDTO)
    {
        MzcTool mzcTool = new MzcTool();
        BeanUtils.copyBeanProp(mzcTool,mzcToolExportDTO);

        List<MzcTool> list = mzcToolService.selectMzcToolList(mzcTool);
        ExcelUtil<MzcTool> util = new ExcelUtil<MzcTool>(MzcTool.class);
        util.exportExcel(response, list, "工具数据");
    }

    /**
     * 获取工具详细信息
     */
    @ApiOperation("获取工具详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:query')")
    @GetMapping(value = "/{toolId}")
    public R<MzcTool> getInfo(@ApiParam(value = "工具ID", defaultValue = "1", required = true) @PathVariable("toolId") Long toolId)
    {
        return R.ok(mzcToolService.selectMzcToolByToolId(toolId));
    }

    /**
     * 新增工具
     */
    @ApiOperation("新增工具")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:add')")
    @Log(title = "工具", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcToolAddDTO mzcToolAddDTO)
    {
        MzcTool mzcTool = new MzcTool();
        BeanUtils.copyBeanProp(mzcTool,mzcToolAddDTO);

        return  R.ok(mzcToolService.insertMzcTool(mzcTool));
    }

    /**
     * 修改工具
     */
    @ApiOperation("修改工具")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:edit')")
    @Log(title = "工具", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcToolEditDTO mzcToolEditDTO)
    {
        MzcTool mzcTool = new MzcTool();
        BeanUtils.copyBeanProp(mzcTool,mzcToolEditDTO);

        return R.ok(mzcToolService.updateMzcTool(mzcTool));
    }

    /**
     * 删除工具
     */
    @ApiOperation("删除工具")
    @ApiImplicitParam(name = "toolIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:tool:remove')")
    @Log(title = "工具", businessType = BusinessType.DELETE)
	@DeleteMapping("/{toolIds}")
    public R<Integer> remove(@PathVariable Long[] toolIds)
    {
        return R.ok(mzcToolService.deleteMzcToolByToolIds(toolIds));
    }
}
