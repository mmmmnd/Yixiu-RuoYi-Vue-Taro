package com.ruoyi.yixiu.service.impl;

import com.ruoyi.yixiu.domain.vo.FooterMenuVO;
import com.ruoyi.yixiu.domain.vo.HeaderMenuVO;
import com.ruoyi.yixiu.service.WxConfigService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class WxConfigServiceImpl implements WxConfigService {

    /**
     * 小程序首页菜单
     *
     * @return 结果
     */
    @Override
    public List<HeaderMenuVO> headerMenu(Integer roleId) {

        List<HeaderMenuVO> list = new ArrayList<>(4);
        HeaderMenuVO menuVO1,menuVO2,menuVO3,menuVO4 = null;

        if (roleId == 1){
            menuVO1 = new HeaderMenuVO("2", "https://xcx.ylqx.top/static/xcx/repairRequest.png", "维修申请", "tabBar", "/pages/repair/index");
            menuVO2 = new HeaderMenuVO("1", "https://xcx.ylqx.top/static/xcx/maintenanceRecords.png", "维修记录", "tabBar", "/pages/order/index");
            menuVO3 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/scanCode.png", "扫码报修", "fn", "/pages/facility/index");
            menuVO4 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/repair.png", "维修点", "page", "/pages/place/index");
        }else if(roleId == 2){
            menuVO1 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/repairRequest.png", "设备列表", "page", "/pages/facility/index");
            menuVO2 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/accessories.png", "配件申请", "page", "/pages/accessories/index");
            menuVO3 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/scanCode.png", "扫码报修", "fn", "/pages/facility/index");
            menuVO4 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/report.png", "工作报告", "page", "/pages/work/index");
        }else{
            menuVO1 = new HeaderMenuVO("2", "https://xcx.ylqx.top/static/xcx/repairRequest.png", "维修申请", "tabBar", "/pages/repair/index");
            menuVO2 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/invoice.png", "发票申请", "page", "/pages/invoice/index");
            menuVO3 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/scanCode.png", "扫码报修", "fn", "");
            menuVO4 = new HeaderMenuVO(null, "https://xcx.ylqx.top/static/xcx/customer.png", "我的客户", "page", "/pages/customer/index");
        }

         list.add(menuVO1);
         list.add(menuVO2);
         list.add(menuVO3);
         list.add(menuVO4);

        return list;
    }

    /**
     * 底部菜单
     *
     * @return 结果
     */
    @Override
    public List<FooterMenuVO> footerMenu() {

        List<FooterMenuVO> list = new ArrayList<>(4);

        FooterMenuVO menuVO1 = new FooterMenuVO("https://xcx.ylqx.top/static/xcx/homeActive.png", "https://xcx.ylqx.top/static/xcx/home.png", "首页", "/pages/home/index");
        FooterMenuVO menuVO2 = new FooterMenuVO("https://xcx.ylqx.top/static/xcx/botNavOrderActive.png", "https://xcx.ylqx.top/static/xcx/botNavOrder.png", "订单记录", "/pages/order/index");
        FooterMenuVO menuVO3 = new FooterMenuVO("https://xcx.ylqx.top/static/xcx/botNavRepairActive.png", "https://xcx.ylqx.top/static/xcx/botNavRepair.png", "一键报修", "/pages/repair/index");
        FooterMenuVO menuVO4 = new FooterMenuVO("https://xcx.ylqx.top/static/xcx/myActive.png", "https://xcx.ylqx.top/static/xcx/my.png", "我的", "/pages/my/index");

        list.add(menuVO1);
        list.add(menuVO2);
        list.add(menuVO3);
        list.add(menuVO4);

        return list;
    }

}
