/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-01-30 17:29:42
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-01 16:14:04
 */
import request from '@/utils/request'

// 查询报废申请列表
export function listScrap (query) {
  return request({
    url: '/yixiu/scrap/list',
    method: 'get',
    params: query
  })
}

// 查询报废申请详细
export function getScrap (scrapId) {
  return request({
    url: '/yixiu/scrap/' + scrapId,
    method: 'get'
  })
}

// 新增报废申请
export function addScrap (data) {
  return request({
    url: '/yixiu/scrap',
    method: 'post',
    data: data
  })
}

// 修改报废申请
export function updateScrap (data) {
  return request({
    url: '/yixiu/scrap',
    method: 'put',
    data: data
  })
}

// 删除报废申请
export function delScrap (scrapId) {
  return request({
    url: '/yixiu/scrap/' + scrapId,
    method: 'delete'
  })
}
