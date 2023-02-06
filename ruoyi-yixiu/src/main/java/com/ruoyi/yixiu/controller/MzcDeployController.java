package com.ruoyi.yixiu.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.yixiu.domain.dto.deploy.MzcDeployAddDTO;
import com.ruoyi.yixiu.domain.dto.deploy.MzcDeployEditDTO;
import com.ruoyi.yixiu.domain.dto.deploy.MzcDeployExportDTO;
import com.ruoyi.yixiu.domain.dto.deploy.MzcDeployListDTO;
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
import com.ruoyi.yixiu.domain.MzcDeploy;
import com.ruoyi.yixiu.service.IMzcDeployService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 借配Controller
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Api(tags = "借配")
@RestController
@RequestMapping("/yixiu/deploy")
public class MzcDeployController extends BaseController
{
    @Autowired
    private IMzcDeployService mzcDeployService;

    /**
     * 查询借配列表
     */
    @ApiOperation("借配列表")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcDeploy> list(MzcDeployListDTO mzcDeployListDTO)
    {
        MzcDeploy mzcDeploy = new MzcDeploy();
        BeanUtils.copyBeanProp(mzcDeploy,mzcDeployListDTO);

        startPage();
        List<MzcDeploy> list = mzcDeployService.selectMzcDeployList(mzcDeploy);
        return getDataTable(list);
    }

    /**
     * 导出借配列表
     */
    @ApiOperation("导出借配列表")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:export')")
    @Log(title = "借配", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MzcDeployExportDTO mzcDeployExportDTO)
    {
        MzcDeploy mzcDeploy = new MzcDeploy();
        BeanUtils.copyBeanProp(mzcDeploy,mzcDeployExportDTO);

        List<MzcDeploy> list = mzcDeployService.selectMzcDeployList(mzcDeploy);
        ExcelUtil<MzcDeploy> util = new ExcelUtil<MzcDeploy>(MzcDeploy.class);
        util.exportExcel(response, list, "借配数据");
    }

    /**
     * 获取借配详细信息
     */
    @ApiOperation("获取借配详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:query')")
    @GetMapping(value = "/{deployId}")
    public R<MzcDeploy> getInfo(@ApiParam(value = "借配ID", defaultValue = "1", required = true) @PathVariable("deployId") Long deployId)
    {
        return R.ok(mzcDeployService.selectMzcDeployByDeployId(deployId));
    }

    /**
     * 新增借配
     */
    @ApiOperation("新增借配")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:add')")
    @Log(title = "借配", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@RequestBody MzcDeployAddDTO mzcDeployAddDTO)
    {
        MzcDeploy mzcDeploy = new MzcDeploy();
        BeanUtils.copyBeanProp(mzcDeploy,mzcDeployAddDTO);

        return  R.ok(mzcDeployService.insertMzcDeploy(mzcDeploy));
    }

    /**
     * 修改借配
     */
    @ApiOperation("修改借配")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:edit')")
    @Log(title = "借配", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@RequestBody MzcDeployEditDTO mzcDeployEditDTO)
    {
        MzcDeploy mzcDeploy = new MzcDeploy();
        BeanUtils.copyBeanProp(mzcDeploy,mzcDeployEditDTO);

        return R.ok(mzcDeployService.updateMzcDeploy(mzcDeploy));
    }

    /**
     * 删除借配
     */
    @ApiOperation("删除借配")
    @ApiImplicitParam(name = "deployIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:deploy:remove')")
    @Log(title = "借配", businessType = BusinessType.DELETE)
	@DeleteMapping("/{deployIds}")
    public R<Integer> remove(@PathVariable Long[] deployIds)
    {
        return R.ok(mzcDeployService.deleteMzcDeployByDeployIds(deployIds));
    }
}
