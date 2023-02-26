/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-11-18 09:36:18
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-16 16:00:34
 */
import { Auth, Wx, User } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/** 微信登录 */
export function codeback(params): Promise<Service.BackendResultConfig<Wx.IUserDeteil>> {
  return https.get('/wxLogin', params);
}

/** 储存用户信息 */
export function saveWechatInfo(params): Promise<Service.BackendResultConfig<Wx.ICode>> {
  return https.post('/foreign/login/saveWechatInfo', params);
}

/** 获取用户手机号码 */
export function getPhoneNumber(params): Promise<Service.BackendResultConfig<User.IPhone>> {
  return https.post('/wxBinding', params);
}

/**绑定手机号码返回用户信息 */
export function binding(params): Promise<Service.BackendResultConfig<Wx.IUserDeteil>> {
  return https.post('/foreign/login/binding', params);
}
