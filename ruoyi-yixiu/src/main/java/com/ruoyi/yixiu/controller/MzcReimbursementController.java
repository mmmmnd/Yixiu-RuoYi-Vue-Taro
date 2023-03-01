package com.ruoyi.yixiu.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yixiu.domain.MzcReimbursement;
import com.ruoyi.yixiu.domain.dto.reimbursement.*;
import com.ruoyi.yixiu.service.IMzcReimbursementService;
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
 * 报销Controller
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Api(tags = "报销")
@RestController
    @RequestMapping("/yixiu/reimbursement")
public class MzcReimbursementController extends BaseController {
    @Autowired
    private IMzcReimbursementService mzcReimbursementService;

    /**
     * 查询报销列表
     */
    @ApiOperation("报销列表")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcReimbursement> list(MzcReimbursementListDTO mzcReimbursementListDTO) {
        startPage();
        List<MzcReimbursement> list = mzcReimbursementService.selectMzcReimbursementList(mzcReimbursementListDTO);
        return getDataTable(list);
    }

    /**
     * 导出报销列表
     */
    @ApiOperation(value = "导出报销列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:export')")
    @Log(title = "报销", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcReimbursementListDTO mzcReimbursementListDTO) {
        List<MzcReimbursement> list = mzcReimbursementService.selectMzcReimbursementList(mzcReimbursementListDTO);
        ExcelUtil<MzcReimbursement> util = new ExcelUtil<MzcReimbursement>(MzcReimbursement.class);
        util.exportExcel(response, list, "报销数据");
    }

    /**
     * 获取报销详细信息
     */
    @ApiOperation("获取报销详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:query')")
    @GetMapping(value = "/{reimbursementId}")
    public R<MzcReimbursement> getInfo(@ApiParam(value = "报销ID", defaultValue = "1", required = true) @PathVariable("reimbursementId") Long reimbursementId) {
        return R.ok(mzcReimbursementService.selectMzcReimbursementByReimbursementId(reimbursementId));
    }

    /**
     * 新增报销
     */
    @ApiOperation("新增报销")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:add')")
    @Log(title = "报销", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcReimbursementAddDTO mzcReimbursementAddDTO) {
        MzcReimbursement mzcReimbursement = new MzcReimbursement();
        BeanUtils.copyBeanProp(mzcReimbursement, mzcReimbursementAddDTO);

        return R.ok(mzcReimbursementService.insertMzcReimbursement(mzcReimbursement));
    }

    /**
     * 修改报销
     */
    @ApiOperation("修改报销")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:edit')")
    @Log(title = "报销", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcReimbursementEditDTO mzcReimbursementEditDTO) {
        MzcReimbursement mzcReimbursement = new MzcReimbursement();
        BeanUtils.copyBeanProp(mzcReimbursement, mzcReimbursementEditDTO);

        return R.ok(mzcReimbursementService.updateMzcReimbursement(mzcReimbursement));
    }

    /**
     * 审核报销
     */
    @ApiOperation("审核报销")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:audit')")
    @Log(title = "报销", businessType = BusinessType.UPDATE)
    @PutMapping("/audit/{reimbursementId}")
    public R<Integer> audit(@RequestBody MzcReimbursementAuditDTO mzcReimbursementAuditDTO) {

        MzcReimbursement mzcReimbursement = new MzcReimbursement();
        BeanUtils.copyBeanProp(mzcReimbursement, mzcReimbursementAuditDTO);

        return R.ok(mzcReimbursementService.updateMzcReimbursement(mzcReimbursement));
    }

    /**
     * 删除报销
     */
    @ApiOperation("删除报销")
    @ApiImplicitParam(name = "reimbursementIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:reimbursement:remove')")
    @Log(title = "报销", businessType = BusinessType.DELETE)
    @DeleteMapping("/{reimbursementIds}")
    public R<Integer> remove(@PathVariable Long[] reimbursementIds) {
        return R.ok(mzcReimbursementService.deleteMzcReimbursementByReimbursementIds(reimbursementIds));
    }
}
