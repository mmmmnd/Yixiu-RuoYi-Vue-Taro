/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-23 09:51:49
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-23 09:55:31
 */
/**发票 */
export namespace Invoice {
  /**发票列表 */
  export interface IList {
    /**开票单位 */
    company_name: string;
    /**单位税号 */
    tax_id: number;
    /**开票金额 */
    apply_price: number;
    /**开票状态 */
    apply_status: string;
    /**开票人 */
    apply_person: string;
    /**开票时间 */
    apply_time: string;
    /**开票意见 */
    reject_reason: string;
    /**驳回时间 */
    reject_time: string;
  }
}
