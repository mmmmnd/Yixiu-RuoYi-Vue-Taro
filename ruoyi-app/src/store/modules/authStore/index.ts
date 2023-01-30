/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-09 10:38:35
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-21 09:50:35
 */
import { User } from '@/interfaces/';
import { defineStore } from 'pinia';
import { getUserInfo, setUserInfo, getToken, clearAuthStorage, setToken } from '@/utils/util';

interface AuthState {
  /** 用户信息 */
  userInfo: User.IUserInfo;
  /** 用户token */
  token: string;
}

export const useAuthStore = defineStore('authStore', {
  state: (): AuthState => ({
    userInfo: getUserInfo(),
    token: getToken()
  }),
  getters: {
    /** 是否登录 */
    isLogin: state => Boolean(state.token),
    /** 是否绑定手机号码 */
    isPhone: state => Boolean(state.userInfo.phone),
    /** 获取用户信息 */
    userInfos: state => state.userInfo
  },
  actions: {
    /** 重置auth状态 */
    resetAuthStore() {
      clearAuthStorage();
      this.userInfo = getUserInfo();
      this.token = getToken();
    },
    /** 设置auto状态 */
    setAuthStore(userInfo) {
      setUserInfo(userInfo);
      setToken(userInfo.token);
      this.userInfo = userInfo;
      this.token = userInfo.token;
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
