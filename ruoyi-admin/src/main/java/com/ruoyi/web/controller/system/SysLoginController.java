package com.ruoyi.web.controller.system;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.domain.model.WxBindingUser;
import com.ruoyi.system.domain.vo.WxUserVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.system.service.ISysMenuService;

import javax.validation.constraints.NotNull;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@Api(tags = "用户管理")
@Validated
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 登录方法
     *
     * @param code 微信code
     * @return 结果
     */
    @ApiOperation("微信登录")
    @GetMapping("/wxLogin")
    public R<WxUserVO> login(@NotNull(message = "code不能为空") String code) {
        return R.ok(loginService.login(code));
    }

    /**
     * 获取微信手机号码
     * @param code code
     * @return 结果
     */
    @ApiOperation("获取微信手机号码")
    @GetMapping("/getWxPhone")
    public R<Map<String,String>> getWxPhone(@NotNull(message = "code不能为空") String code){
        Map<String,String> map = new HashMap<>();

        map.put("phone", loginService.getWxPhone(code));
        return R.ok(map);
    }
    /**
     * 小程序绑定手机号码
     *
     * @param wxBindingUser 微信openId 用户手机号码
     * @return 结果
     */
    @ApiOperation("微信绑定")
    @PostMapping("/wxBinding")
    public R<WxUserVO> phone(@Validated @RequestBody WxBindingUser wxBindingUser) {
        return R.ok(loginService.phone(wxBindingUser));
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        user.setPassword("");
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
