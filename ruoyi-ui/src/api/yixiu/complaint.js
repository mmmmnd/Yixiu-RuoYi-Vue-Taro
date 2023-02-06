import request from '@/utils/request'

// 查询投诉列表
export function listComplaint(query) {
  return request({
    url: '/yixiu/complaint/list',
    method: 'get',
    params: query
  })
}

// 查询投诉详细
export function getComplaint(complaintId) {
  return request({
    url: '/yixiu/complaint/' + complaintId,
    method: 'get'
  })
}

// 新增投诉
export function addComplaint(data) {
  return request({
    url: '/yixiu/complaint',
    method: 'post',
    data: data
  })
}

// 修改投诉
export function updateComplaint(data) {
  return request({
    url: '/yixiu/complaint',
    method: 'put',
    data: data
  })
}

// 删除投诉
export function delComplaint(complaintId) {
  return request({
    url: '/yixiu/complaint/' + complaintId,
    method: 'delete'
  })
}
