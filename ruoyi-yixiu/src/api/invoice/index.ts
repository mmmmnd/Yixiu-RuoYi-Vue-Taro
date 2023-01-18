/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-23 09:55:44
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-23 10:01:06
 */
import { Invoice, Table } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**发票列表 */
export function invoicePageList(params): Promise<Service.BackendResultConfig<Table.IPage<Invoice.IList>>> {
  return https.get('/foreign/invoice/pageList', params);
}

/**申请发票 */
export function applyData(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/invoice/applyData', params);
}
