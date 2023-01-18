/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 16:42:56
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-22 15:10:29
 */
import { Hospital } from '@/interfaces/';

/**配件 */
export namespace Accessories {
  /**配件 */
  export interface ITltle {
    /**标题 */
    title: string;
    /**列表kay值 */
    key: string;
    /**对齐方式 */
    align: string;
  }

  export interface IInfo {
    /**配件名称 */
    parts_name: string;
    /**规格型号 */
    pasrt_size: string;
    /**数量 */
    pasrt_num: number;
    /**用途 */
    purpose: string;
    /**是否急需 */
    urgency: number;
    /**备注 */
    remark: string;
  }

  export interface IList extends IInfo, Hospital.iDepartment {}
}
