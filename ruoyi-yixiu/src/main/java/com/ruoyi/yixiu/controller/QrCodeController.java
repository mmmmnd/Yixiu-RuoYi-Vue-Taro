package com.ruoyi.yixiu.controller;

import com.ruoyi.common.constant.WxConstants;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.yixiu.domain.vo.MzcEquimentQrCodeVO;
import com.ruoyi.yixiu.service.IQrCodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;

@Api(tags = "导出二维码")
@RestController
@RequestMapping("/qrCode")
public class QrCodeController {

    @Resource
    IQrCodeService qrCodeService;

    /**
     * 设备二维码
     *
     * @return 文件路径
     */
    @ApiOperation(value = "设备二维码")
    @ApiImplicitParam(name = "param", value = "设备二维码参数", required = true, paramType = "body")
    @PreAuthorize("@ss.hasPermi('yixiu:equipment:qrCode')")
    @PostMapping("/equipment")
    public R<MzcEquimentQrCodeVO> wxQrCode(@RequestBody String param) {

        MzcEquimentQrCodeVO mzcEquimentQrCodeVO = new MzcEquimentQrCodeVO();

        try {
            String token = qrCodeService.sendGet(WxConstants.appId, WxConstants.appKey);
            String base64Path = qrCodeService.generateQrCode("", param, token);
            mzcEquimentQrCodeVO.setImg(base64Path);
        } catch (IOException e) {
            return R.fail(e.getMessage());
        }

        return R.ok(mzcEquimentQrCodeVO);
    }

}
