/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-09-09 16:33:27
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-26 14:48:05
 */
import { Product, Work, Engineer, Table, Hospital, Order, Accessories } from '@/interfaces/';
import Https from '@/utils/http/https';
const https = new Https();

/** 一键报修 */
export function oneKey(params): Promise<Service.BackendResultConfig<Product.IRepair>> {
  return https.post('/foreign/repair/oneKey', params);
}

/**工作类别 */
export function orderTypeArr(params): Promise<Service.BackendResultConfig<Work.IType>> {
  return https.get('/system/dict/data/type/mzc_order_type', params);
}

/** 扫码 */
export function scanQrcodeRepair(params): Promise<Service.BackendResultConfig<Hospital.IInfo>> {
  return https.post('/foreign/repair/scanQrcodeRepair', params);
}

/**订单记录 */
export function orderList(params): Promise<Service.BackendResultConfig<Table.IPage<Engineer.IInfo>>> {
  return https.get('/yixiu/order/list', params);
}

/**详情明细 */
export function orderInfo(params): Promise<Service.BackendResultConfig<Hospital.IInfo>> {
  return https.get('/foreign/repair/orderInfo', params);
}

// /**维修验收 */
// export function acceptDetail(params): Promise<Service.BackendResultConfig<Order.IAcceptance<Accessories.ITltle>>> {
//   return https.get('/foreign/repair/acceptDetail', params);
// }
/**维修验收 确定验收 */
export function acceptConfirm(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/repair/acceptConfirm', params);
}

/**评价 */
export function comment(params): Promise<Service.BackendResultConfig<Order.IAssess>> {
  return https.post('/foreign/repair/comment', params);
}

/**接单 */
export function takeUp(params): Promise<Service.BackendResultConfig> {
  return https.post('/yixiu/order/pick', params);
}

/**立即检测 */
export function handling(params): Promise<Service.BackendResultConfig> {
  return https.get('/yixiu/order/detection/'+params);
}

/**检测报告 */
export function report(params): Promise<Service.BackendResultConfig> {
  return https.post('/yixiu/order/report', params);
}

/**开始维修 */
export function startRepair(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/repair/startRepair', params);
}

/**维修完成 */
export function repairComplete(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/repair/repairComplete', params);
}

/**报价单提交 */
export function offerSubmit(params): Promise<Service.BackendResultConfig> {
  return https.post('/foreign/repair/offerSubmit', params);
}
