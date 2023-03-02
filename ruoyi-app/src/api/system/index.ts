/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-23 15:18:22
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 21:24:05
 */
import Https from '@/utils/http/https';
const https = new Https();

/** 字典 */

export function orderStatus(params): Promise<Service.BackendResultConfig> {
  return https.get('/system/dict/data/type/mzc_order_status', params);
}

export function partsStatus(params): Promise<Service.BackendResultConfig> {
  return https.get('/system/dict/data/type/mzc_parts_status', params);
}

export function auditStatus(params): Promise<Service.BackendResultConfig> {
  return https.get('/system/dict/data/type/mzc_audit_status', params);
}
