package com.ruoyi.yixiu.controller;

import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.constant.WxConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.utils.uuid.UUID;
import com.ruoyi.yixiu.service.IQrCodeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;

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
  @PreAuthorize("@ss.hasPermi('yixiu:equipment:qrCode')")
  @PostMapping("/equipment")
  public AjaxResult wxQrCode() {

    HashMap<String, String> hashMap = new HashMap<>();

    try {
      String token = qrCodeService.sendGet(WxConstants.appId, WxConstants.appKey);
      String base64Path = qrCodeService.generateQrCode("", "a=1", token);
      hashMap.put("img", base64Path);
    } catch (IOException e) {
      e.printStackTrace();
      return AjaxResult.error(e.getMessage());
    }

    return AjaxResult.success(hashMap);
  }

}
