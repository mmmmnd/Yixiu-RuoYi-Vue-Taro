import request from '@/utils/request'

// 查询不良事件列表
export function listBurst(query) {
  return request({
    url: '/yixiu/burst/list',
    method: 'get',
    params: query
  })
}

// 查询不良事件详细
export function getBurst(burstId) {
  return request({
    url: '/yixiu/burst/' + burstId,
    method: 'get'
  })
}

// 新增不良事件
export function addBurst(data) {
  return request({
    url: '/yixiu/burst',
    method: 'post',
    data: data
  })
}

// 修改不良事件
export function updateBurst(data) {
  return request({
    url: '/yixiu/burst',
    method: 'put',
    data: data
  })
}

// 删除不良事件
export function delBurst(burstId) {
  return request({
    url: '/yixiu/burst/' + burstId,
    method: 'delete'
  })
}
