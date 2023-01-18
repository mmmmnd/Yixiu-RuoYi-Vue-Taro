/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 17:40:32
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-11 11:12:13
 */
import { Order, Table } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**投诉 */
export function complainAdd(params): Promise<Service.BackendResultConfig<Order.IComplaint>> {
  return https.post('/foreign/complain/add', params);
}

/**投诉列表 */
export function complainPageList(params): Promise<Service.BackendResultConfig<Table.IPage<Order.IComplaintList>>> {
  return https.get('/foreign/complain/pageList', params);
}
