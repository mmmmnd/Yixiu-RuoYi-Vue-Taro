/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-11-02 10:52:36
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-02 11:50:51
 */
import Https from '@/utils/http/https';
const https = new Https();

/* 科室列表 */
export function departmentGetAllList(params): Promise<Service.BackendResultObjectConfig> {
  return https.post('/foreign/department/getAllList', params);
}
