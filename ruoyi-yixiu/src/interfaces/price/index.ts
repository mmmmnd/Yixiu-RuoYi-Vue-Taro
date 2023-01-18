/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 15:48:09
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-08 16:01:30
 */
/**价格 */
export namespace Price {
  /**信息 */
  export interface IInfo {
    /**单价 */
    unit_price: number | string;
    /**优惠价 */
    discount_pirce: number | string;
    /**总价 */
    totao_price: number | string;
  }
  /**总数 */
  export interface IUnit {
    /**数量 */
    num: number;
    /**单位 */
    unit: number;
  }
}
