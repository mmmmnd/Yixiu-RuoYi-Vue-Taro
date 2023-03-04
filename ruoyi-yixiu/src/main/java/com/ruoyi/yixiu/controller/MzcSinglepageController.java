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
import com.ruoyi.yixiu.domain.MzcSinglepage;
import com.ruoyi.yixiu.service.IMzcSinglepageService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 单页Controller
 *
 * @author mmmmnd
 * @date 2023-03-03
 */
@RestController
@RequestMapping("/yixiu/singlepage")
public class MzcSinglepageController extends BaseController
{
    @Autowired
    private IMzcSinglepageService mzcSinglepageService;

    /**
     * 查询单页列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcSinglepage> list(MzcSinglepage mzcSinglepage)
    {
        startPage();
        List<MzcSinglepage> list = mzcSinglepageService.selectMzcSinglepageList(mzcSinglepage);
        return getDataTable(list);
    }

    /**
     * 导出单页列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:export')")
    @Log(title = "单页", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcSinglepage mzcSinglepage)
    {
        List<MzcSinglepage> list = mzcSinglepageService.selectMzcSinglepageList(mzcSinglepage);
        ExcelUtil<MzcSinglepage> util = new ExcelUtil<MzcSinglepage>(MzcSinglepage.class);
        util.exportExcel(response, list, "单页数据");
    }

    /**
     * 获取单页详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:query')")
    @GetMapping(value = "/{id}")
    public R<MzcSinglepage> getInfo(@PathVariable("id") Long id)
    {
        return R.ok(mzcSinglepageService.selectMzcSinglepageById(id));
    }

    /**
     * 新增单页
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:add')")
    @Log(title = "单页", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcSinglepage mzcSinglepage)
    {
        return  R.ok(mzcSinglepageService.insertMzcSinglepage(mzcSinglepage));
    }

    /**
     * 修改单页
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:edit')")
    @Log(title = "单页", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcSinglepage mzcSinglepage)
    {
        return R.ok(mzcSinglepageService.updateMzcSinglepage(mzcSinglepage));
    }

    /**
     * 删除单页
     */
    @PreAuthorize("@ss.hasPermi('yixiu:singlepage:remove')")
    @Log(title = "单页", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public R<Integer> remove(@PathVariable Long[] ids)
    {
        return R.ok(mzcSinglepageService.deleteMzcSinglepageByIds(ids));
    }
}
