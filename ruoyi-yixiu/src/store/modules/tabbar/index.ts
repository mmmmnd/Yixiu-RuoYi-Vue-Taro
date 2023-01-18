/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-10-26 15:32:55
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-26 15:33:04
 */
import { defineStore } from 'pinia';

export const useTabbarStore = defineStore('tabbar', {
  state: () => {
    return {
      active: 0
    };
  },
  getters: {
    getActive: state => {
      return state.active;
    }
  },
  actions: {
    setActive(index) {
      this.active = index;
    }
  }
});
