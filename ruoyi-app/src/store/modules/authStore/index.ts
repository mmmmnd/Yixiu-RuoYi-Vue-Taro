/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-09 10:38:35
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-16 16:04:53
 */
import { User } from '@/interfaces/';
import { defineStore } from 'pinia';
import { getUserInfo, setUserInfo, getToken, clearAuthStorage, setToken } from '@/utils/util';

interface AuthState {
  /** 用户信息 */
  userInfo: User.IUserInfo;
  /** 用户token */
  token: string;
  phone: string;
  openId: string;
}

export const useAuthStore = defineStore('authStore', {
  state: (): AuthState => ({
    userInfo: getUserInfo(),
    token: getToken(),
    phone: getUserInfo().phone,
    openId: getUserInfo().openId
  }),
  getters: {
    /** 是否登录 */
    isLogin: state => Boolean(state.token),
    /** 获取用户信息 */
    userInfos: state => state.userInfo,
    /** 是否绑定手机号码 */
    isPhone: state => Boolean(state.userInfo.phone),

    isOpenId: state => Boolean(state.userInfo.openId)
  },
  actions: {
    /** 重置auth状态 */
    resetAuthStore() {
      clearAuthStorage();
      this.userInfo = getUserInfo();
      this.token = getToken();
      this.phone = getUserInfo().phone;
      this.openId = getUserInfo().openId;
    },
    /** 设置auto状态 */
    setAuthStore(userInfo) {
      setUserInfo(userInfo);
      setToken(userInfo.token);
      this.userInfo = userInfo;
      this.token = userInfo.token;
      this.phone = userInfo.phone;
      this.openId = userInfo.openId;
    },
    /**保存Tabbar导航栏 */
    setTabbarList(userInfo) {
      this.setAuthStore(userInfo);
      this.userInfo.tabbarList = userInfo.tabbarList;
    },
    /**保存Tabbar导航栏 */
    setGridList(userInfo) {
      this.setAuthStore(userInfo);
      this.userInfo.gridList = userInfo.gridList;
    },
    setMyInfo(userInfo) {
      this.setAuthStore(userInfo);
      this.userInfo.myInfo = userInfo.myInfo;
    }
  }
});
