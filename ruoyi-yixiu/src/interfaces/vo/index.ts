/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-20 09:31:08
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-27 08:29:50
 */
export namespace Vo {
  export interface IObject {
    [key: string]: any;
  }

  export interface IFn {
    (...args: any[]): any;
  }
}
