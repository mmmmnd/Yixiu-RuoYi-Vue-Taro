/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-07-05 11:14:06
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-16 21:59:27
 */
import * as Taro from '@tarojs/taro';
import { HTTP_ERROR, BASE_URL, WHITE_PATH, WHITELIST_ROUTES } from '@/config';
import { getToken, isArrayBuffer, isString } from '@/utils/util';
import { errAddRecord } from '@/api/';
import { useAuthStore, useTabbarStore } from '@/store';

let debounce = true;

function CheckHttp() {}

CheckHttp.prototype.interceptors = {
  request: (option: request.Option) => {
    const token = getToken() || '';

    option.header.Authorization = 'Bearer ' + token;

    return option;
  },
  response: function(option: Service.Result, o: request.Option) {
    const authStore = useAuthStore();
    const tabbar = useTabbarStore();
    const currentPages = Taro.getCurrentPages();

    const isLogin = authStore.isLogin;
    const isPhone = authStore.isPhone;

    const R = currentPages[currentPages.length - 1].route; //路径白名单
    const routeFalg = WHITELIST_ROUTES.find(item => BASE_URL + item == o.url); //路由白名单

    const data = option.data;
    const errMsg = option.errMsg;
    const header = option.header;
    const statusCode = option.statusCode;

    const strError = `
      错误状态:${HTTP_ERROR[data.code || 500]}
      错误状态码:${data.code || 500}
      错误信息:${errMsg != 'request:ok' ? errMsg : '请求已被记录'}
    `;

    R != WHITE_PATH && Taro.hideLoading();

    Taro.stopPullDownRefresh();
    Taro.hideNavigationBarLoading();

    if (data.code >= 200 && data.code < 300 && debounce && isLogin && !isPhone && !routeFalg && R != WHITE_PATH) {
      debounce = false;
      Taro.showModal({
        title: '未绑定',
        content: '该功能需要绑定手机才能使用',
        confirmText: '马上绑定',
        cancelText: '返回首页',
        success: (res: interaction.showModal) => {
          debounce = true;
          if (res.confirm) {
            Taro.navigateTo({ url: '/pages/login/index' });
          } else if (res.cancel) {
            tabbar.setActive(0);
            Taro.reLaunch({ url: '/pages/home/index' });
          }
        }
      });
    }

    if (isArrayBuffer(option) && isString(option)) return option;

    if (data.code >= 200 && data.code < 300) return data;

    if (debounce && data.code === 401) {
      // authStore.resetAuthStore();
      debounce = false;
      Taro.showModal({
        title: '未绑定',
        content: '该功能需要登录才能进行操作',
        confirmText: '马上登录',
        cancelText: '返回首页',
        success: (res: interaction.showModal) => {
          debounce = true;
          if (res.confirm) {
            Taro.navigateTo({ url: '/pages/login/index' });
          } else if (res.cancel) {
            tabbar.setActive(0);
            Taro.reLaunch({ url: '/pages/home/index' });
          }
        }
      });
    }

    if (isLogin && isPhone && debounce) {
      const systemInfo = Taro.getSystemInfoSync();
      const PHONE = `Phone:${systemInfo.model},PhoneSystem:${systemInfo.system},WxVersion:${systemInfo.version},WxSDKVersion:${systemInfo.SDKVersion}`;
      const params = {
        errData: data || '',
        errMsg: errMsg || '',
        header: header || {},
        statusCode: data.code || 500,
        token: getToken() || '',
        api: `Method:${o.method},Api:${o.url},${PHONE}` || ''
      };

      //记录错误请求信息
      // errAddRecord({ data: params }).then(r => {
      //   console.log(r);
      // });

      debounce = false;

      Taro.showToast({
        title: '数据或用户权限限制,请联系管理员',
        icon: 'none',
        duration: 3000,
        success: function(res) {
          debounce = true;
        }
      });
    }

    throw new Error('服务器异常');
  }
};

export default CheckHttp;
