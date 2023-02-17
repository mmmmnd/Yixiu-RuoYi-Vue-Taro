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
import com.ruoyi.yixiu.domain.MzcSwiper;
import com.ruoyi.yixiu.service.IMzcSwiperService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 轮播图Controller
 *
 * @author mmmmnd
 * @date 2023-02-17
 */
@RestController
@RequestMapping("/yixiu/swiper")
public class MzcSwiperController extends BaseController
{
    @Autowired
    private IMzcSwiperService mzcSwiperService;

    /**
     * 查询轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcSwiper> list(MzcSwiper mzcSwiper)
    {
        startPage();
        List<MzcSwiper> list = mzcSwiperService.selectMzcSwiperList(mzcSwiper);
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:export')")
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcSwiper mzcSwiper)
    {
        List<MzcSwiper> list = mzcSwiperService.selectMzcSwiperList(mzcSwiper);
        ExcelUtil<MzcSwiper> util = new ExcelUtil<MzcSwiper>(MzcSwiper.class);
        util.exportExcel(response, list, "轮播图数据");
    }

    /**
     * 获取轮播图详细信息
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:query')")
    @GetMapping(value = "/{swiperId}")
    public R<MzcSwiper> getInfo(@PathVariable("swiperId") Long swiperId)
    {
        return R.ok(mzcSwiperService.selectMzcSwiperBySwiperId(swiperId));
    }

    /**
     * 新增轮播图
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:add')")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcSwiper mzcSwiper)
    {
        return  R.ok(mzcSwiperService.insertMzcSwiper(mzcSwiper));
    }

    /**
     * 修改轮播图
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:edit')")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcSwiper mzcSwiper)
    {
        return R.ok(mzcSwiperService.updateMzcSwiper(mzcSwiper));
    }

    /**
     * 删除轮播图
     */
    @PreAuthorize("@ss.hasPermi('yixiu:swiper:remove')")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{swiperIds}")
    public R<Integer> remove(@PathVariable Long[] swiperIds)
    {
        return R.ok(mzcSwiperService.deleteMzcSwiperBySwiperIds(swiperIds));
    }
}
