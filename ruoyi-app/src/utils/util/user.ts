/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 15:40:40
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-16 16:06:17
 */
import { User } from '@/interfaces/';
import { EnumStorageKey } from '@/enum';
import { setLocal, getLocal, removeLocal } from './storage';

/** 设置token */
export function setToken(token: string) {
  setLocal(EnumStorageKey['token'], token);
}

/** 获取token */
export function getToken() {
  return getLocal<string>(EnumStorageKey['token']) || '';
}

/** 去除token */
export function removeToken() {
  removeLocal(EnumStorageKey['token']);
}

/** 获取refresh token */
export function getRefreshToken() {
  return getLocal<string>(EnumStorageKey['refresh-koken']) || '';
}

/** 设置refresh token */
export function setRefreshToken(token: string) {
  setLocal(EnumStorageKey['refresh-koken'], token);
}

/** 去除refresh token */
export function removeRefreshToken() {
  removeLocal(EnumStorageKey['refresh-koken']);
}

/** 设置用户信息 */
export function getUserInfo() {
  const emptyInfo: User.IUserInfo = {
    avatarUrl: '',
    nickname: '',
    openid: '',
    phone: '',
    token: '',
    NavBarName: '游客',
    tabbarList: [],
    gridList: [],
    role_group: 0,
    myInfo: {},
    openId: ''
  };
  const userInfo: User.IUserInfo = getLocal<User.IUserInfo>(EnumStorageKey['user-info']) || emptyInfo;
  return userInfo;
}

/** 获取用户信息 */
export function setUserInfo(userInfo: User.IUserInfo) {
  setLocal(EnumStorageKey['user-info'], userInfo);
}

/** 去除用户信息 */
export function removeUserInfo() {
  removeLocal(EnumStorageKey['user-info']);
}

/** 去除用户相关缓存 */
export function clearAuthStorage() {
  removeToken();
  removeRefreshToken();
  removeUserInfo();
}
