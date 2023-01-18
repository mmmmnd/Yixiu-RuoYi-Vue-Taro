/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-25 15:51:02
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-25 15:52:16
 */
declare namespace interaction {
  interface showModal {
    /** 为 true 时，表示用户点击了取消（用于 Android 系统区分点击蒙层关闭还是点击取消按钮关闭） */
    cancel: boolean;
    /** 为 true 时，表示用户点击了确定按钮 */
    confirm: boolean;
  }
}
