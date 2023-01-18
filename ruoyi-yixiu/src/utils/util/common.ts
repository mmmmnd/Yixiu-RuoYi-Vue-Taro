/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-12-30 16:46:05
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-12-02 16:24:38
 */
import * as Taro from '@tarojs/taro';

//检测小程序更新
export function checkUpdateVersion() {
  // 获取小程序更新机制兼容

  if (Taro.canIUse('getUpdateManager')) {
    const updateManager = Taro.getUpdateManager();
    //1. 检查小程序是否有新版本发布
    updateManager.onCheckForUpdate(function(res) {
      // 请求完新版本信息的回调
      if (res.hasUpdate) {
        //2. 小程序有新版本，则静默下载新版本，做好更新准备
        updateManager.onCheckForUpdate;
        updateManager.onUpdateReady(function() {
          console.log(new Date());
          Taro.showModal({
            title: '更新提示',
            content: '已更新版本，是否重启小程序？',
            showCancel: false,
            cancelColor: '#eeeeee',
            confirmColor: '#40A2ED',
            success: function(res) {
              if (res.confirm) {
                // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
                updateManager.applyUpdate();
              }
            }
          });
        });

        updateManager.onUpdateFailed(function() {
          // 新的版本下载失败
          Taro.showModal({
            title: '已经有新版本了~',
            content: '新版本已经上线啦~，请您删除当前小程序，重新搜索打开哟~',
            success(res) {
              if (res.confirm) {
                // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
                updateManager.applyUpdate();
              }
            }
          });
        });
      }
    });
  } else {
    // 如果希望用户在最新版本的客户端上体验您的小程序，可以这样子提示
    Taro.showModal({
      title: '提示',
      content: '当前微信版本过低，无法使用该功能，请升级到最新微信版本后重试。'
    });
  }

  // 网络连接
  Taro.onNetworkStatusChange(function(res) {
    if (!res.isConnected) {
      Taro.showModal({
        title: '网络失去链接',
        content: '请检查网络链接',
        showCancel: false
      });
    }
  });
}

export function getPhoneInfo() {
  const globalData: any = {};

  globalData.windowsHeight = Taro.getSystemInfoSync().windowHeight; //屏幕高度
  globalData.statusHeight = Taro.getSystemInfoSync().statusBarHeight; //状态栏高度
  globalData.menuButtonTop = Taro.getMenuButtonBoundingClientRect().top; //顶部胶囊距离顶高度
  globalData.menuButtonWidth = Taro.getMenuButtonBoundingClientRect().width; //顶部胶囊款度
  globalData.menuButtonHeight = Taro.getMenuButtonBoundingClientRect().height; //顶部胶囊高度

  return globalData;
}

export function getViewStyle() {
  const viewStyle = {
    topHeight: 0,
    bottonHeight: 0,
    tabTopHeight: 0,
    repairTitleHeight: 0,
    bannberHeight: 0
  };
  return new Promise((resolve, reject) => {
    Taro.createSelectorQuery()
      .select('.NavBar')
      .boundingClientRect()
      .select('.footer')
      .boundingClientRect()
      .select('.nut-tabs__titles')
      .boundingClientRect()
      .select('.repair-title')
      .boundingClientRect()
      .select('.bannber')
      .boundingClientRect()
      .exec(res => {
        viewStyle.topHeight = res[0] ? res[0].height : 0;
        viewStyle.bottonHeight = res[1] ? res[1].height : 0;
        viewStyle.tabTopHeight = res[2] ? res[2].height : 0;
        viewStyle.repairTitleHeight = res[3] ? res[3].height : 0;
        viewStyle.bannberHeight = res[4] ? res[4].height : 0;

        return resolve(viewStyle);
      });
  });
}
