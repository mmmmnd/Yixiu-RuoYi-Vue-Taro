/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-11-19 10:17:58
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-25 08:56:54
 */
import Taro from '@tarojs/taro';

export function signed(name: string, fun: Function) {
  Taro.showModal({
    title: "温馨提示",
    confirmText: "开始签署",
    content: name + "请核实确认相关合同信息，并正确签名",
    success: (res: any) => res.confirm && fun(res)
  });
}

export function download(data: string) {
  Taro.showModal({
    title: "提示",
    confirmText: "复制链接",
    content: "目前小程序不支持本地下载 , 请点击复制链接到任意浏览器打开下载",
    success: (res: any) => res.confirm && Taro.setClipboardData({
      data: data,
      success: () => Taro.getClipboardData()
    })
  });
}

export function preview(data: string) {
  Taro.downloadFile({
    url: data,
    filePath: "",
    success: (res: any) => Taro.openDocument({ filePath: res.tempFilePath, showMenu: true, fileType: "pdf", })
  });
}
