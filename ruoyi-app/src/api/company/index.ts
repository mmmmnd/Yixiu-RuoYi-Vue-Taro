/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-10-17 09:04:39
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-02 11:21:08
 */
import { Order, Table } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**新增客户 */
export function companyAdd(params): Promise<Service.BackendResultConfig<Order.IComplaint>> {
  return https.post('/foreign/company/add', params);
}

/**客户列表 */
export function companyList(params): Promise<Service.BackendResultConfig<Table.IPage<Order.IComplaintList>>> {
  return https.get('/foreign/company/pageList', params);
}

/**医院列表 */
export function companygetAllList(params): Promise<Service.BackendResultObjectConfig> {
  return https.get('/foreign/company/getAllList', params);
}
