package com.ruoyi.framework.web.service;

import javax.annotation.Resource;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.binarywang.wx.miniapp.util.WxMaConfigHolder;
import com.ruoyi.common.core.domain.model.WxBindingUser;
import com.ruoyi.common.utils.*;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.framework.security.token.WxAuthenticationToken;
import com.ruoyi.system.domain.vo.WxUserVO;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.ruoyi.common.constant.CacheConstants;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.exception.user.CaptchaException;
import com.ruoyi.common.exception.user.CaptchaExpireException;
import com.ruoyi.common.exception.user.UserPasswordNotMatchException;
import com.ruoyi.common.utils.ip.IpUtils;
import com.ruoyi.framework.manager.AsyncManager;
import com.ruoyi.framework.manager.factory.AsyncFactory;
import com.ruoyi.framework.security.context.AuthenticationContextHolder;
import com.ruoyi.system.service.ISysConfigService;
import com.ruoyi.system.service.ISysUserService;

/**
 * 登录校验方法
 * 
 * @author ruoyi
 */
@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Autowired
    private RedisCache redisCache;
    
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Resource
    private WxMaService wxMaService;
    /**
     * 登录验证
     * 
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public String login(String username, String password, String code, String uuid)
    {
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        // 验证码开关
        if (captchaEnabled)
        {
            validateCaptcha(username, code, uuid);
        }
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
            AuthenticationContextHolder.clearContext();
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUserId());
        // 生成token
        return tokenService.createToken(loginUser);
    }

    /**
     * 通过code获取用户信息
     *
     * @param code code
     * @return 用户信息
     */
    public WxUserVO login(String code) {
        WxMaJscode2SessionResult  sessionInf = null;
        try {
            sessionInf = wxMaService.getUserService().getSessionInfo(code);
        } catch (WxErrorException e) {
            throw new ServiceException(e.getMessage());
        } finally {
            WxMaConfigHolder.remove();/*清理ThreadLocal*/
        }

        WxUserVO wxUserVO = new WxUserVO();
        String openId = sessionInf.getOpenid();

        SysUser user = userService.selectUserByOpenid(openId);

        /*新用户*/
        if (StringUtils.isNull(user)){
            SysUser sysUser = new SysUser();
            sysUser.setSex("2");
            sysUser.setUserType("01");
            sysUser.setNickName("微信用户");
            sysUser.setOpenId(openId);
            userService.insertUser(sysUser);

            BeanUtils.copyBeanProp(wxUserVO,sysUser);
        }else{
            /*老用户*/
            if (StringUtils.isNotEmpty(user.getPhonenumber())) {
                /*老用户*/
                String token = checkUserReturnToken(user);
                wxUserVO.setToken(token);
                wxUserVO.setPhone(user.getPhonenumber());
            }
            /*小程序未授权信息*/
            wxUserVO.setOpenId(openId);

        }

        return wxUserVO;
    }

    /**
     * 获取微信手机号码
     * @param code code
     * @return 结果
     */
    public String getWxPhone(String code){
        WxMaPhoneNumberInfo phoneNoInfo = null;

        try {
            phoneNoInfo = wxMaService.getUserService().getNewPhoneNoInfo(code);
        } catch (WxErrorException e) {
            throw new ServiceException(e.getMessage());
        } finally {
            WxMaConfigHolder.remove();/*清理ThreadLocal*/
        }

        return phoneNoInfo.getPhoneNumber();
    }
    /**
     * 绑定用户手机号码
     * @param wxBindingUser  微信openId 用户手机号码
     * @return 结果
     */
    public WxUserVO phone(WxBindingUser wxBindingUser){
        WxUserVO wxUserVO = new WxUserVO();

        /*通过手机号码查询用户是否存在*/
        SysUser user = userService.selectUserByPhone(wxBindingUser.getPhone());

        if (StringUtils.isNotNull(user)){
            /*
              查询是否是系统用户
              是 写入openid
              否 写入用户信息
             */
            user.setOpenId(wxBindingUser.getOpenId());
        }else {
            user = userService.selectUserByOpenid(wxBindingUser.getOpenId());

            user.setDeptId(109L); /*游客*/
            user.setUserName(wxBindingUser.getPhone());
            user.setPhonenumber(wxBindingUser.getPhone());
            user.setPassword(SecurityUtils.encryptPassword("123456"));
        }

        userService.updateUser(user);

        String token = checkUserReturnToken(user);
        wxUserVO.setToken(token);

        return wxUserVO;
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
            throw new CaptchaException();
        }
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr(ServletUtils.getRequest()));
        sysUser.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(sysUser);
    }

    /**
     * 校验用户返回token
     * @param user 用户
     * @return 结果
     */
    private String checkUserReturnToken(SysUser user){
        WxAuthenticationToken wxAuthenticationToken = new WxAuthenticationToken(user.getUserName(), null);
        // 该方法会通过AuthenticationProvider.authenticate认证
        Authentication authentication = authenticationManager.authenticate(wxAuthenticationToken);

        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        recordLoginInfo(loginUser.getUserId());
        // 生成token
        return tokenService.createToken(loginUser);
    }
}
