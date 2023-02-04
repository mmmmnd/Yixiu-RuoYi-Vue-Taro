import request from '@/utils/request'

// 查询耗材列表
export function listMaterial(query) {
  return request({
    url: '/yixiu/material/list',
    method: 'get',
    params: query
  })
}

// 查询耗材详细
export function getMaterial(materialId) {
  return request({
    url: '/yixiu/material/' + materialId,
    method: 'get'
  })
}

// 新增耗材
export function addMaterial(data) {
  return request({
    url: '/yixiu/material',
    method: 'post',
    data: data
  })
}

// 修改耗材
export function updateMaterial(data) {
  return request({
    url: '/yixiu/material',
    method: 'put',
    data: data
  })
}

// 删除耗材
export function delMaterial(materialId) {
  return request({
    url: '/yixiu/material/' + materialId,
    method: 'delete'
  })
}
