/*
 * @Author: mmmmnd
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-01-24 10:40:38
 * @LastEditors: mmmmnd
 * @LastEditTime: 2023-03-02 15:33:42
 */
import request from '@/utils/request'

// 查询设备列表列表
export function listEquipment (query) {
  return request({
    url: '/yixiu/equipment/list',
    method: 'get',
    params: query
  })
}

// 查询设备列表详细
export function getEquipment (equipmentId) {
  return request({
    url: '/yixiu/equipment/' + equipmentId,
    method: 'get'
  })
}

// 新增设备列表
export function addEquipment (data) {
  return request({
    url: '/yixiu/equipment',
    method: 'post',
    data: data
  })
}

// 修改设备列表
export function updateEquipment (data) {
  return request({
    url: '/yixiu/equipment',
    method: 'put',
    data: data
  })
}

// 删除设备列表
export function delEquipment (equipmentId) {
  return request({
    url: '/yixiu/equipment/' + equipmentId,
    method: 'delete'
  })
}

// 设备二维码
export function qrCodeEquipment (param) {
  return request({
    url: '/yixiu/equipment/equipment/' + param,
    method: 'get',
  })
}


// 查询报废申请详细
export function getDeptEquipmentList (query) {
  return request({
    url: '/yixiu/equipment/getDeptEquipmentList',
    method: 'get',
    params: query
  })
}