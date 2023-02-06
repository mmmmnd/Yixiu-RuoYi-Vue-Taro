import request from '@/utils/request'

// 查询借配列表
export function listDeploy(query) {
  return request({
    url: '/yixiu/deploy/list',
    method: 'get',
    params: query
  })
}

// 查询借配详细
export function getDeploy(deployId) {
  return request({
    url: '/yixiu/deploy/' + deployId,
    method: 'get'
  })
}

// 新增借配
export function addDeploy(data) {
  return request({
    url: '/yixiu/deploy',
    method: 'post',
    data: data
  })
}

// 修改借配
export function updateDeploy(data) {
  return request({
    url: '/yixiu/deploy',
    method: 'put',
    data: data
  })
}

// 删除借配
export function delDeploy(deployId) {
  return request({
    url: '/yixiu/deploy/' + deployId,
    method: 'delete'
  })
}
