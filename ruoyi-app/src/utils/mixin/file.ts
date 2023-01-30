/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-12-03 11:35:32
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-25 08:56:09
 */
import Taro from '@tarojs/taro';

export function upload(file, fun) {
  Taro.uploadFile({
    url: "https://xxyg.daxinxin.vip/api.php/home/test/uppic",
    filePath: file.url,
    name: "file",
    formData: { user: "test" },
    success: (res: any) => {
      fun(res)
    },
  });
}