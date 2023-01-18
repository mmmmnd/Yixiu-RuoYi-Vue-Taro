/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-14 10:06:37
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-19 16:48:25
 */
/**表格 */
export namespace Table {
  /**分页详情 */
  export interface IPage<T = any> {
    data: T[];
    current_page: number;
    last_page: number;
    per_page: number;
    total: number;
  }
}
