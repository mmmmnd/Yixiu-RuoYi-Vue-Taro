/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-06 09:47:23
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 08:56:38
 */
export default defineAppConfig({
  pages: [
    'pages/home/index',
    'pages/my/index',
    'pages/login/index',
    'pages/repair/index',
    'pages/order/index',
    'pages/complaint/index',
    'pages/place/index',
    'pages/accessories/index',
    'pages/work/index',
    'pages/invoice/index',
    'pages/customer/index',
    'pages/facility/index',
    'pages/account/index'
  ],
  tabBar: {
    custom: true,
    borderStyle: 'white',
    list: [
      {
        pagePath: 'pages/home/index',
        text: ''
      },
      {
        pagePath: 'pages/order/index',
        text: ''
      },
      {
        pagePath: 'pages/repair/index',
        text: ''
      },
      {
        pagePath: 'pages/complaint/index',
        text: ''
      },
      {
        pagePath: 'pages/my/index',
        text: ''
      }
    ]
  },
  window: {
    backgroundTextStyle: 'light',
    navigationBarBackgroundColor: '#fff',
    navigationBarTitleText: 'WeChat',
    navigationBarTextStyle: 'black'
  },
  lazyCodeLoading: 'requiredComponents'
});
