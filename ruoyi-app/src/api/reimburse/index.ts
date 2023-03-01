/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-11-14 08:59:19
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-01 21:46:40
 */
import Https from '@/utils/http/https';
const https = new Https();

/**报销列表 */
export function reimbursePageList(params): Promise<Service.BackendResultConfig> {
  return https.get('/yixiu/reimbursement/list', params);
}

/**报销申请 */
export function reimburseAdd(params): Promise<Service.BackendResultConfig> {
  return https.post('/yixiu/reimbursement', params);
}

/**报销修改 */
export function reimburseEdit(params): Promise<Service.BackendResultConfig> {
  return https.put('/yixiu/reimbursement', params);
}

/*报销删除 */
export function reimburseDel(params): Promise<Service.BackendResultConfig> {
  return https.delete('/yixiu/reimbursement/'+params);
}
