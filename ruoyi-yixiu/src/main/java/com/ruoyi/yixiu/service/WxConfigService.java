package com.ruoyi.yixiu.service;

import com.ruoyi.yixiu.domain.vo.FooterMenuVO;
import com.ruoyi.yixiu.domain.vo.HeaderMenuVO;

import java.util.List;

public interface WxConfigService {

    /**
     * 小程序首页菜单
     *
     * @return 结果
     */
    public List<HeaderMenuVO> headerMenu(Integer roleId);

    /**
     * 底部菜单
     *
     * @return 结果
     */
    public List<FooterMenuVO> footerMenu();
}
