/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-14 09:56:32
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-19 16:28:42
 */
import { User, Product } from '@/interfaces/';
/** 工程师*/
export namespace Engineer {
  /** 信息 */
  export interface IInfo extends Product.IRepair {
    /**工程师姓名 */
    engineer_name: string;
    /**工程师手机 */
    linkphone: User.IPhone;
    /** 联系方式*/
    engineer_phone: User.IPhone;
  }
}
