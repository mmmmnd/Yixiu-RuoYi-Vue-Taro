/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 15:35:07
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-08 16:05:28
 */
import { User, Product, Engineer, Hospital, Price, Work } from '@/interfaces/';
/**订单 */
export namespace Order {
  /**信息 */
  export interface IInfo {
    /**订单id */
    order_id: number;
  }
  /**评论 */
  export interface IAssess extends IInfo, Engineer.IInfo, Product.IInfo {
    /**评分 */
    grade: number;
    /**其他备注 */
    content: string;
  }
  /**投诉 */
  export interface IComplaint extends IInfo, Engineer.IInfo {
    /**投诉原因 */
    other: string;
    /**其他原因 */
    content: string;
  }

  /**投诉列表 */
  export interface IComplaintList extends IInfo, Product.IInfo, IComplaint, IRepair, User.IUserInfo {
    /**系统答复 */
    system_reply: string;
  }
  /**报修信息 */
  export interface IRepair {
    /**报修日期 */
    create_time: Date | string | number;
    /**报修人 */
    offerer_name: string;
    /**报修人 */
    creater_name: string;
  }

  /**报修单 */
  export interface IQuotation
    extends Product.IInfo,
      Hospital.iDepartment,
      Price.IUnit,
      Price.IInfo,
      Product.IMaintain,
      Product.IEquipmentReason,
      IRepair {}

  /**验收单 */
  export interface IAcceptance<T = any, U = any> {
    /**配件标题 */
    partsTitle: T[];
    /**配件列表*/
    partsList: U[];
  }
}
