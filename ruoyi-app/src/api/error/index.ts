/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-26 09:44:58
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-08 14:35:25
 */
import Https from '@/utils/http/https';
const https = new Https();

export function errAddRecord(params): Promise<Service.BackendResultConfig<Service.RequestError>> {
  return https.post('/foreign/err/addRecord', params);
}
