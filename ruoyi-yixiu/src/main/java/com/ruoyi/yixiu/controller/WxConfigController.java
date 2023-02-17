package com.ruoyi.yixiu.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.yixiu.domain.vo.FooterMenuVO;
import com.ruoyi.yixiu.domain.vo.HeaderMenuVO;
import com.ruoyi.yixiu.service.WxConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@Api(tags = "微信配置")
@RestController
@RequestMapping("/yixiu/config")
public class WxConfigController {

    @Resource
    WxConfigService wxConfigService;

    @ApiOperation("顶部菜单")
    @GetMapping("/headerMenu")
    public R<List<HeaderMenuVO>> getHeaderMenu(@RequestParam(value = "roleId",defaultValue="1") Integer roleId){
        return R.ok(wxConfigService.headerMenu(roleId));
    }

    @ApiOperation("底部菜单")
    @GetMapping("/footerMenu")
    public R<List<FooterMenuVO>> getHeaderMenu(){
        return R.ok(wxConfigService.footerMenu());
    }
}
