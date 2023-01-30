/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-11-15 15:38:39
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-25 16:57:07
 */
import Taro, { getCurrentPages } from '@tarojs/taro';

export default {
  created() {
    Taro.onAppRoute(() => {
      const pages: Array<any> = getCurrentPages();
      const view = pages[pages.length - 1];
      wx.showShareMenu({ withShareTicket: true, menus: ['shareAppMessage', 'shareTimeline'] });
      view.onShareAppMessage = () => {
        return { title: '分享', path: view.route };
      };
    });
  }
};

// export const share = function(){
//   Taro.onAppRoute(() => {
//     const pages: Array<any> = getCurrentPages();
//     const view = pages[pages.length - 1];
//     wx.showShareMenu({ withShareTicket: true, menus: ['shareAppMessage', 'shareTimeline'] });
//     view.onShareAppMessage = () => {
//       return { title: '分享', path: view.route };
//     };
//   });
// }
