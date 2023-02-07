import request from '@/utils/request'

// 查询配件清单列表
export function listInventory(query) {
  return request({
    url: '/yixiu/inventory/list',
    method: 'get',
    params: query
  })
}

// 查询配件清单详细
export function getInventory(inventoryId) {
  return request({
    url: '/yixiu/inventory/' + inventoryId,
    method: 'get'
  })
}

// 新增配件清单
export function addInventory(data) {
  return request({
    url: '/yixiu/inventory',
    method: 'post',
    data: data
  })
}

// 修改配件清单
export function updateInventory(data) {
  return request({
    url: '/yixiu/inventory',
    method: 'put',
    data: data
  })
}

// 删除配件清单
export function delInventory(inventoryId) {
  return request({
    url: '/yixiu/inventory/' + inventoryId,
    method: 'delete'
  })
}
