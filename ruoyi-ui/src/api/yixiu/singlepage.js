import request from '@/utils/request'

// 查询单页列表
export function listSinglepage(query) {
  return request({
    url: '/yixiu/singlepage/list',
    method: 'get',
    params: query
  })
}

// 查询单页详细
export function getSinglepage(id) {
  return request({
    url: '/yixiu/singlepage/' + id,
    method: 'get'
  })
}

// 新增单页
export function addSinglepage(data) {
  return request({
    url: '/yixiu/singlepage',
    method: 'post',
    data: data
  })
}

// 修改单页
export function updateSinglepage(data) {
  return request({
    url: '/yixiu/singlepage',
    method: 'put',
    data: data
  })
}

// 删除单页
export function delSinglepage(id) {
  return request({
    url: '/yixiu/singlepage/' + id,
    method: 'delete'
  })
}
