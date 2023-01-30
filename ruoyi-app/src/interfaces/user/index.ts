/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 15:38:28
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-14 14:53:45
 */
import { Auth, Wx, Hospital, Role } from '@/interfaces/';

export namespace User {
  /** 用户手机 */
  export interface IPhone {
    /**手机号码 */
    phone: string;
  }
  /** 用户信息 */
  export interface IUserInfo<T = any> extends IPhone, Auth.IToken, Wx.ICode, Role.IRoleInfo {
    /** 头像 */
    avatarUrl: string;
    /** 昵称 */
    nickname: string;
    /** 昵称 */
    nickName?: string;
    /**底部菜单 */
    tabbarList: T[];
    /**Nav菜单 */
    gridList: T[];
    /**顶部医院 */
    NavBarName: string;
    myInfo: T;
  }

  export interface IMyInfo extends IUserInfo, IPhone, Hospital.iDepartment, Hospital.IInfo, Hospital.iDepartment {}
}
