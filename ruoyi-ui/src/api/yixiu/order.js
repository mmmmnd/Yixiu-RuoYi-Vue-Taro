import request from '@/utils/request'

// 查询订单列表
export function listOrder (query) {
  return request({
    url: '/yixiu/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getOrder (orderId) {
  return request({
    url: '/yixiu/order/' + orderId,
    method: 'get'
  })
}

// 新增订单
export function addOrder (data) {
  return request({
    url: '/yixiu/order',
    method: 'post',
    data: data
  })
}

// 修改订单
export function updateOrder (data) {
  return request({
    url: '/yixiu/order',
    method: 'put',
    data: data
  })
}

// 删除订单
export function delOrder (orderId) {
  return request({
    url: '/yixiu/order/' + orderId,
    method: 'delete'
  })
}

// 自主接单
export function pickOrder (data) {
  return request({
    url: '/yixiu/order/pick',
    method: 'post',
    data: data
  })
}

// 系统接单
export function sendOrder (data) {
  return request({
    url: '/yixiu/order/send',
    method: 'post',
    data: data
  })
}

// 配件
export function getPartsOrder (feedbackId) {
  return request({
    url: '/yixiu/order/parts/' + feedbackId,
    method: 'get'
  })
}

// 报价
export function feedbackOrder (data) {
  return request({
    url: '/yixiu/order/feedback',
    method: 'post',
    data: data
  })
}

// 审核
export function auditOrder (data) {
  return request({
    url: '/yixiu/order/audit',
    method: 'post',
    data: data
  })
}

// 获取反馈单详情
export function getFeedbackInfo (feedbackId) {
  return request({
    url: '/yixiu/order/feedbackInfo/' + feedbackId,
    method: 'get'
  })
}

// 订单验收
export function acceptanceOrder (orderId) {
  return request({
    url: '/yixiu/order/acceptance/' + orderId,
    method: 'get'
  })
}
