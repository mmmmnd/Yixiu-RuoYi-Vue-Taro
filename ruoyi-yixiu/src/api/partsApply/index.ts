/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-22 14:52:02
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-12 14:50:10
 */
import { Table, Accessories } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**配件列表 */
export function partsApplyPageList(params): Promise<Service.BackendResultConfig<Table.IPage<Accessories.IList>>> {
  return https.get('/foreign/parts/pageList', params);
}

/**配件申请 */
export function partsApplyaddPost(params): Promise<Service.BackendResultConfig<Accessories.IInfo>> {
  return https.post('/foreign/parts/addPost', params);
}
