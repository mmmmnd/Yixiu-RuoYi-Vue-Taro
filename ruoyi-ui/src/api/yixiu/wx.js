import request from '@/utils/request'

// 查询微信用户列表
export function listWx(query) {
  return request({
    url: '/yixiu/wx/list',
    method: 'get',
    params: query
  })
}

// 查询微信用户详细
export function getWx(wxUserId) {
  return request({
    url: '/yixiu/wx/' + wxUserId,
    method: 'get'
  })
}

// 新增微信用户
export function addWx(data) {
  return request({
    url: '/yixiu/wx',
    method: 'post',
    data: data
  })
}

// 修改微信用户
export function updateWx(data) {
  return request({
    url: '/yixiu/wx',
    method: 'put',
    data: data
  })
}

// 删除微信用户
export function delWx(wxUserId) {
  return request({
    url: '/yixiu/wx/' + wxUserId,
    method: 'delete'
  })
}
