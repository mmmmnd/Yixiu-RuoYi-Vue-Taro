/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-26 11:13:13
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-27 21:41:50
 */
import { Order, User, Menu } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**添加订单 */
export function addOrder(params): Promise<Service.BackendResultConfig<User.IMyInfo>> {
  return https.post('/yixiu/order', params);
}

/**获取反馈单详情 */
export function getFeedbackInfo(feedbackId): Promise<Service.BackendResultConfig<User.IMyInfo>> {
  return https.get('/yixiu/order/feedbackInfo/'+feedbackId);
}

