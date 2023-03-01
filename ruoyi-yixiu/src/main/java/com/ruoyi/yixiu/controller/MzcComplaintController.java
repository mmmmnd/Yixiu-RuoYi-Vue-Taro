package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintAddDTO;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintEditDTO;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintExportDTO;
import com.ruoyi.yixiu.domain.dto.complaint.MzcComplaintListDTO;
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
import com.ruoyi.yixiu.domain.MzcComplaint;
import com.ruoyi.yixiu.service.IMzcComplaintService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 投诉Controller
 *
 * @author mmmmnd
 * @date 2023-02-04
 */
@Api(tags = "投诉列表")
@RestController
@RequestMapping("/yixiu/complaint")
public class MzcComplaintController extends BaseController
{
    @Autowired
    private IMzcComplaintService mzcComplaintService;

    /**
     * 查询投诉列表
     */
    @ApiOperation("查询投诉列表")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcComplaint> list(MzcComplaintListDTO mzcComplaintListDTO)
    {
        startPage();
        List<MzcComplaint> list = mzcComplaintService.selectMzcComplaintList(mzcComplaintListDTO);
        return getDataTable(list);
    }

    /**
     * 导出投诉列表
     */
    @ApiOperation(value = "导出投诉列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:export')")
    @Log(title = "投诉", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export", produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcComplaintListDTO mzcComplaintListDTO)
    {
        List<MzcComplaint> list = mzcComplaintService.selectMzcComplaintList(mzcComplaintListDTO);
        ExcelUtil<MzcComplaint> util = new ExcelUtil<MzcComplaint>(MzcComplaint.class);
        util.exportExcel(response, list, "投诉数据");
    }

    /**
     * 获取投诉详细信息
     */
    @ApiOperation("获取投诉详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:query')")
    @GetMapping(value = "/{complaintId}")
    public R<MzcComplaint> getInfo(@ApiParam(value = "设备ID", defaultValue = "1", required = true) @PathVariable("complaintId") Long complaintId)
    {
        return R.ok(mzcComplaintService.selectMzcComplaintByComplaintId(complaintId));
    }

    /**
     * 新增投诉
     */
    @ApiOperation("新增投诉")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:add')")
    @Log(title = "投诉", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcComplaintAddDTO mzcComplaintAddDTO)
    {
        MzcComplaint mzcComplaint = new MzcComplaint();
        BeanUtils.copyBeanProp(mzcComplaint,mzcComplaintAddDTO);

        return  R.ok(mzcComplaintService.insertMzcComplaint(mzcComplaint));
    }

    /**
     * 修改投诉
     */
    @ApiOperation("修改投诉")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:edit')")
    @Log(title = "投诉", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcComplaintEditDTO mzcComplaintEditDTO)
    {
        MzcComplaint mzcComplaint = new MzcComplaint();
        BeanUtils.copyBeanProp(mzcComplaint,mzcComplaintEditDTO);

        return R.ok(mzcComplaintService.updateMzcComplaint(mzcComplaint));
    }

    /**
     * 删除投诉
     */
    @ApiOperation("删除投诉")
    @ApiImplicitParam(name = "complaintIds", value = "投诉IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:complaint:remove')")
    @Log(title = "投诉", businessType = BusinessType.DELETE)
	@DeleteMapping("/{complaintIds}")
    public R<Integer> remove(@PathVariable Long[] complaintIds)
    {
        return R.ok(mzcComplaintService.deleteMzcComplaintByComplaintIds(complaintIds));
    }
}
