/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-20 09:26:58
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-02 15:46:20
 */
import Https from '@/utils/http/https';
const https = new Https();

/* 通过单位id获取设备列表 */
export function deptEquipmentList(params): Promise<Service.BackendResultObjectConfig> {
  return https.get('/yixiu/equipment/getDeptEquipmentList', params);
}

/* 设备二维码 */
export function qrCodeEquipment(params): Promise<Service.BackendResultObjectConfig> {
  return https.get('/yixiu/equipment/equipment/' + params,);
}
