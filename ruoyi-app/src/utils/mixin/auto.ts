/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-11-05 10:18:01
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-21 10:04:22
 */
import * as Taro from '@tarojs/taro';
import { codeback, getPhoneNumber } from '@/api/';
import { Wx } from '@/interfaces/';

export function getLogin(callback: Function) {
  Taro.login({
    success: function(res) {
      if (res.code) {
        Taro.showModal({
          title: '温馨提示',
          content: '正在请求您的个人信息',
          success(o: interaction.showModal) {
            if (!o.confirm) {
              Taro.showToast({ icon: 'none', title: '用户取消授权' });
            } else {
              codeback({ code: res.code }).then((e: Service.BackendResultConfig<Wx.IUserDeteil>) => {
                Taro.showLoading({ title: '授权中' });
                Taro.getUserProfile({
                  desc: '获取你的昵称、头像、地区及性别',
                  success: (r: Wx.IWxDeteil) => {
                    r.userInfo.token = e.data.token;
                    r.userInfo.phone = e.data.phone;
                    r.userInfo.openid = e.data.openid;
                    r.userInfo.role_group = e.data.role_group;
                    callback(r.userInfo);
                  },
                  fail: () => {
                    Taro.hideLoading();
                    Taro.showToast({ icon: 'none', title: '用户拒绝授权' });
                  }
                });
              });
            }
          }
        });
      } else {
        Taro.showToast({ icon: 'none', title: '授权失败' });
        Taro.reLaunch({ url: '/pages/index/index' });
      }
    }
  });
}

export function getPhone(code: string, callback: Function) {
  if (code) {
    getPhoneNumber({ code }).then(res => {
      callback(res.data);
    });
  } else {
    Taro.showToast({ icon: 'none', title: '用户拒绝授权' });
  }
}
