/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-09 17:36:59
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-26 10:21:46
 */
import { Role, User, Auth } from '@/interfaces/';
//微信信息
export namespace Wx {
  export interface ICode {
    /** code */
    code?: string;
    /** opid */
    openid?: string;
  }

  //用户状态
  export interface IUserDeteil extends User.IPhone, Auth.IToken, Wx.ICode, Role.IRoleInfo {}

  //微信信息
  export interface IWxDeteil {
    cloudID: string;
    encryptedData: string;
    errMsg: string;
    iv: string;
    rawData: string;
    signature: string;
    userInfo: User.IUserInfo;
  }
}
