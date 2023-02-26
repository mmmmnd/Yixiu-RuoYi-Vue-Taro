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
import com.ruoyi.yixiu.domain.MzcOrderFeedback;
import com.ruoyi.yixiu.service.IMzcOrderFeedbackService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 反馈单Controller
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
@RestController
@RequestMapping("/yixiu/orderFeedback")
public class MzcOrderFeedbackController extends BaseController
{
    @Autowired
    private IMzcOrderFeedbackService mzcOrderFeedbackService;

    /**
     * 查询反馈单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcOrderFeedback> list(MzcOrderFeedback mzcOrderFeedback)
    {
        startPage();
        List<MzcOrderFeedback> list = mzcOrderFeedbackService.selectMzcOrderFeedbackList(mzcOrderFeedback);
        return getDataTable(list);
    }

    /**
     * 导出反馈单列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:export')")
    @Log(title = "反馈单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcOrderFeedback mzcOrderFeedback)
    {
        List<MzcOrderFeedback> list = mzcOrderFeedbackService.selectMzcOrderFeedbackList(mzcOrderFeedback);
        ExcelUtil<MzcOrderFeedback> util = new ExcelUtil<MzcOrderFeedback>(MzcOrderFeedback.class);
        util.exportExcel(response, list, "反馈单数据");
    }

    /**
     * 获取反馈单详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:query')")
    @GetMapping(value = "/{feedbackId}")
    public R<MzcOrderFeedback> getInfo(@PathVariable("feedbackId") Long feedbackId)
    {
        return R.ok(mzcOrderFeedbackService.selectMzcOrderFeedbackByFeedbackId(feedbackId));
    }

    /**
     * 新增反馈单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:add')")
    @Log(title = "反馈单", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcOrderFeedback mzcOrderFeedback)
    {
        return  R.ok(mzcOrderFeedbackService.insertMzcOrderFeedback(mzcOrderFeedback));
    }

    /**
     * 修改反馈单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:edit')")
    @Log(title = "反馈单", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcOrderFeedback mzcOrderFeedback)
    {
        return R.ok(mzcOrderFeedbackService.updateMzcOrderFeedback(mzcOrderFeedback));
    }

    /**
     * 删除反馈单
     */
    @PreAuthorize("@ss.hasPermi('yixiu:feedback:remove')")
    @Log(title = "反馈单", businessType = BusinessType.DELETE)
	@DeleteMapping("/{feedbackIds}")
    public R<Integer> remove(@PathVariable Long[] feedbackIds)
    {
        return R.ok(mzcOrderFeedbackService.deleteMzcOrderFeedbackByFeedbackIds(feedbackIds));
    }
}
