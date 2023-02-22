/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2023-02-21 17:27:54
 * @LastEditors: 莫卓才
 * @LastEditTime: 2023-02-21 21:54:29
 */
import request from '@/utils/request'

// 新增接单
export function addReceiving (data) {
  return request({
    url: '/yixiu/receiving',
    method: 'post',
    data: data
  })
}

