/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-11-14 08:59:19
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-14 17:12:59
 */
import Https from '@/utils/http/https';
const https = new Https();

/**报销列表 */
export function reimbursePageList(params): Promise<Service.BackendResultConfig> {
  return https.get('/foreign/reimburse/pageList', params);
}

/**报销申请 */
export function reimburseAdd(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/reimburse/add', params);
}

/*报销删除 */
export function reimburseDel(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/reimburse/del', params);
}
