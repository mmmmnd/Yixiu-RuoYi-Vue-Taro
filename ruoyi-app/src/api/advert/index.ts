/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-27 16:06:14
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-17 16:15:38
 */
import { Order, Table } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**轮播 */
export function slideList(params): Promise<Service.BackendResultObjectConfig<Order.IComplaint>> {
  return https.get('/yixiu/swiper/list', params);
}

/**海报 */
export function footerBanner(params): Promise<Service.BackendResultObjectConfig<Order.IComplaint>> {
  return https.get('/foreign/advert/footerBanner', params);
}
