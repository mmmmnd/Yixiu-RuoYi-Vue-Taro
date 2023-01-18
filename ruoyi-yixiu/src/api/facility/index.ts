/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-11-02 10:50:07
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-10 15:34:07
 */
import Https from '@/utils/http/https';
const https = new Https();

/**设备列表 */
export function facilityPageList(params): Promise<Service.BackendResultConfig> {
  return https.get('/foreign/facility/pageList', params);
}

/**设备新增 */
export function facilityAdd(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/facility/add', params);
}

/* 历史记录 */
export function repairLog(params): Promise<Service.BackendResultConfig> {
  return https.get('/foreign/facility/repairLog', params);
}
