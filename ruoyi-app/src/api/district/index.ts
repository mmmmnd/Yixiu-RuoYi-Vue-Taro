/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-19 17:08:20
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-19 17:23:54
 */
import { Table, Place } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

export function districtPageList(params): Promise<Service.BackendResultConfig<Table.IPage<Place.IInfo>>> {
  return https.get('/foreign/district/pageList', params);
}
