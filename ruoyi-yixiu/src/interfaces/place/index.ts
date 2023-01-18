/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 17:20:43
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-19 17:23:34
 */
/**维修点 */
export namespace Place {
  /**信息 */
  export interface IInfo {
    /**维修点名称 */
    name: string;
    /**联系电话 */
    phone: string;
    /**服务时间 */
    server_time: string;
    /**地址 */
    address: string;
  }
}
