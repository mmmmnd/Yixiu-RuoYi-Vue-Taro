package com.ruoyi.yixiu.controller;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.yixiu.domain.MzcEquipment;
import com.ruoyi.yixiu.domain.dto.Equipment.MzcEquipmentAddDTO;
import com.ruoyi.yixiu.domain.dto.Equipment.MzcEquipmentEditDTO;
import com.ruoyi.yixiu.domain.dto.Equipment.MzcEquipmentExportDTO;
import com.ruoyi.yixiu.domain.dto.Equipment.MzcEquipmentListDTO;
import com.ruoyi.yixiu.service.IMzcEquipmentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 设备列表Controller
 *
 * @author mmmmnd
 * @date 2023-01-24
 */
@Api(tags = "设备列表")
@RestController
@RequestMapping("/yixiu/equipment")
public class MzcEquipmentController extends BaseController {

    @Autowired
    private IMzcEquipmentService mzcEquipmentService;

    /**
     * 查询设备列表列表
     */
    @ApiOperation("设备列表列表")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:list')")
    @GetMapping("/list")
    public TableDataInfo<MzcEquipment> list(MzcEquipmentListDTO mzcEquipmentListDTO) {
        MzcEquipment mzcEquipment = new MzcEquipment();
        BeanUtils.copyBeanProp(mzcEquipment, mzcEquipmentListDTO);

        startPage();
        List<MzcEquipment> list = mzcEquipmentService.selectMzcEquipmentList(mzcEquipment);
        return getDataTable(list);
    }

    /**
     * 导出设备列表列表
     */
    @ApiOperation(value = "导出设备列表列表", notes = "导出文件后手动改一下后缀为xlsx格式")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:export')")
    @Log(title = "设备列表", businessType = BusinessType.EXPORT)
    @PostMapping(value = "/export", produces = "application/octet-stream")
    public void export(HttpServletResponse response, MzcEquipmentExportDTO mzcEquipmentExportDTO) {
        MzcEquipment mzcEquipment = new MzcEquipment();
        BeanUtils.copyBeanProp(mzcEquipment, mzcEquipmentExportDTO);

        List<MzcEquipment> list = mzcEquipmentService.selectMzcEquipmentList(mzcEquipment);
        ExcelUtil<MzcEquipment> util = new ExcelUtil<MzcEquipment>(MzcEquipment.class);
        util.exportExcel(response, list, "设备列表数据");
    }

    /**
     * 获取设备列表详细信息
     */
    @ApiOperation("获取设备列表详细信息")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:query')")
    @GetMapping(value = "/{equipmentId}")
    public R<MzcEquipment> getInfo(@ApiParam(value = "设备ID", defaultValue = "1", required = true) @PathVariable("equipmentId") Long equipmentId) {
        return R.ok(mzcEquipmentService.selectMzcEquipmentByEquipmentId(equipmentId));
    }

    /**
     * 通过单位id获取设备列表
     */
    @ApiOperation("通过单位id获取设备列表")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:query')")
    @GetMapping("/getDeptEquipmentList")
    public R<List<MzcEquipment>> selectDeptEquipmentByDeptId(@ApiParam(value = "单位ID", defaultValue = "1", required = true) @RequestParam Long deptId) {
        return R.ok(mzcEquipmentService.selectDeptEquipmentByDeptId(deptId));
    }

    /**
     * 新增设备列表
     */
    @ApiOperation("新增设备列表")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:add')")
    @Log(title = "设备列表", businessType = BusinessType.INSERT)
    @PostMapping
    public R<Integer> add(@Validated @RequestBody MzcEquipmentAddDTO mzcEquipmentAddDTO) {
        MzcEquipment mzcEquipment = new MzcEquipment();
        BeanUtils.copyBeanProp(mzcEquipment, mzcEquipmentAddDTO);

        return R.ok(mzcEquipmentService.insertMzcEquipment(mzcEquipment));
    }

    /**
     * 修改设备列表
     */
    @ApiOperation("修改设备列表")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:edit')")
    @Log(title = "设备列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public R<Integer> edit(@Validated @RequestBody MzcEquipmentEditDTO mzcEquipmentEditDTO) {
        MzcEquipment mzcEquipment = new MzcEquipment();
        BeanUtils.copyBeanProp(mzcEquipment, mzcEquipmentEditDTO);

        return R.ok(mzcEquipmentService.updateMzcEquipment(mzcEquipment));
    }

    /**
     * 删除设备列表
     */
    @ApiOperation("删除设备列表")
    @ApiImplicitParam(name = "equipmentIds", value = "报废IDS 多个传 [1,2] 单个传 1", required = true, allowMultiple = true, paramType = "path")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:remove')")
    @Log(title = "设备列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{equipmentIds}")
    public R<Integer> remove(@PathVariable Long[] equipmentIds) {
        return R.ok(mzcEquipmentService.deleteMzcEquipmentByEquipmentIds(equipmentIds));
    }

    /**
     * 设备二维码
     *
     * @return 文件路径
     */
    @ApiOperation(value = "设备二维码")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:qrCode')")
    @GetMapping ("/equipment/{param}")
    public R<String> qrCode(@ApiParam(value = "参数", defaultValue = "id=1&name=2", required = true) @PathVariable("param") String param)  {
        return R.ok(mzcEquipmentService.createEquipmentQrCode(param));
    }
}
