/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-11-02 10:50:07
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 16:14:11
 */
import Https from '@/utils/http/https';
const https = new Https();

/**设备列表 */
export function facilityPageList(params): Promise<Service.BackendResultConfig> {
  return https.get('/yixiu/equipment/list', params);
}

/**设备新增 */
export function facilityAdd(params): Promise<Service.BackendResultConfig> {
  return https.post('/yixiu/equipment', params);
}

/* 历史记录 */
export function repairLog(params): Promise<Service.BackendResultConfig> {
  return https.get('/foreign/facility/repairLog', params);
}
