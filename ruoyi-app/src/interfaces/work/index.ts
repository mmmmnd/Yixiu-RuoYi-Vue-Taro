/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-13 11:14:54
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-13 11:15:33
 */
/**工作信息 */
export namespace Work {
  /**工作类型 */
  export interface IType {
    checking: string;
    examine_approval: string;
    pending_approval: string;
    repaired: string;
    repairing: string;
    reporting: string;
  }
}
