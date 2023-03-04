/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-20 10:30:13
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-03-04 10:12:22
 */
import { Order, User, Menu } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/**我的信息 */
export function myInfo(params): Promise<Service.BackendResultConfig<User.IMyInfo>> {
  return https.get('/getInfo', params);
}

/**关于 */
export function myAbout(params): Promise<Service.BackendResultConfig<Order.IComplaint>> {
  return https.get('/yixiu/singlepage/list', params);
}

/**Nav导航栏 */
export function headerMenu(params): Promise<Service.BackendResultObjectConfig<Menu.IFooterMenu>> {
  return https.get('/yixiu/config/headerMenu', params);
}

/**Tabbar导航栏 */
export function footerMenu(params): Promise<Service.BackendResultObjectConfig<Menu.IFooterMenu>> {
  return https.get('/yixiu/config/footerMenu', params);
}
