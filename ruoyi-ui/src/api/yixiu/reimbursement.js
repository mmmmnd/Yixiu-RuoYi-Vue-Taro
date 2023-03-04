/*
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-07 11:39:58
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-02-07 14:48:18
 */
import request from '@/utils/request'

// 查询报销列表
export function listReimbursement (query) {
  return request({
    url: '/yixiu/reimbursement/list',
    method: 'get',
    params: query
  })
}

// 查询报销详细
export function getReimbursement (reimbursementId) {
  return request({
    url: '/yixiu/reimbursement/' + reimbursementId,
    method: 'get'
  })
}

// 新增报销
export function addReimbursement (data) {
  return request({
    url: '/yixiu/reimbursement',
    method: 'post',
    data: data
  })
}

// 修改报销
export function updateReimbursement (data) {
  return request({
    url: '/yixiu/reimbursement',
    method: 'put',
    data: data
  })
}

// 审核配件申请
export function auditReimbursement (data) {
  return request({
    url: '/yixiu/reimbursement/audit/' + data.reimbursementId,
    method: 'put',
    data: data
  })
}

// 删除报销
export function delReimbursement (reimbursementId) {
  return request({
    url: '/yixiu/reimbursement/' + reimbursementId,
    method: 'delete'
  })
}
