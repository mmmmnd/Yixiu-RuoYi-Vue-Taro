/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-06 16:19:36
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-06 17:35:40
 */
import request from '@/utils/request'

// 查询配件申请列表
export function listParts (query) {
  return request({
    url: '/yixiu/parts/list',
    method: 'get',
    params: query
  })
}

// 查询配件申请详细
export function getParts (partsId) {
  return request({
    url: '/yixiu/parts/' + partsId,
    method: 'get'
  })
}

// 新增配件申请
export function addParts (data) {
  return request({
    url: '/yixiu/parts',
    method: 'post',
    data: data
  })
}

// 修改配件申请
export function updateParts (data) {
  return request({
    url: '/yixiu/parts',
    method: 'put',
    data: data
  })
}

// 审核配件申请
export function auditParts (data) {
  return request({
    url: '/yixiu/parts/audit/' + data.partsId,
    method: 'put',
    data: data
  })
}

// 删除配件申请
export function delParts (partsId) {
  return request({
    url: '/yixiu/parts/' + partsId,
    method: 'delete'
  })
}
