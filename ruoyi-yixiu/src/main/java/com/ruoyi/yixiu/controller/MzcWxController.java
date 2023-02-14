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
import com.ruoyi.yixiu.domain.MzcWx;
import com.ruoyi.yixiu.service.IMzcWxService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 微信用户Controller
 *
 * @author mmmmnd
 * @date 2023-02-14
 */
@RestController
@RequestMapping("/yixiu/wx")
public class MzcWxController extends BaseController
{
    @Autowired
    private IMzcWxService mzcWxService;

    /**
     * 查询微信用户列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcWx> list(MzcWx mzcWx)
    {
        startPage();
        List<MzcWx> list = mzcWxService.selectMzcWxList(mzcWx);
        return getDataTable(list);
    }

    /**
     * 导出微信用户列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:export')")
    @Log(title = "微信用户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcWx mzcWx)
    {
        List<MzcWx> list = mzcWxService.selectMzcWxList(mzcWx);
        ExcelUtil<MzcWx> util = new ExcelUtil<MzcWx>(MzcWx.class);
        util.exportExcel(response, list, "微信用户数据");
    }

    /**
     * 获取微信用户详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:query')")
    @GetMapping(value = "/{wxUserId}")
    public R<MzcWx> getInfo(@PathVariable("wxUserId") Long wxUserId)
    {
        return R.ok(mzcWxService.selectMzcWxByWxUserId(wxUserId));
    }

    /**
     * 新增微信用户
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:add')")
    @Log(title = "微信用户", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcWx mzcWx)
    {
        return  R.ok(mzcWxService.insertMzcWx(mzcWx));
    }

    /**
     * 修改微信用户
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:edit')")
    @Log(title = "微信用户", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcWx mzcWx)
    {
        return R.ok(mzcWxService.updateMzcWx(mzcWx));
    }

    /**
     * 删除微信用户
     */
    @PreAuthorize("@ss.hasPermi('yixiu:wx:remove')")
    @Log(title = "微信用户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{wxUserIds}")
    public R<Integer> remove(@PathVariable Long[] wxUserIds)
    {
        return R.ok(mzcWxService.deleteMzcWxByWxUserIds(wxUserIds));
    }
}
