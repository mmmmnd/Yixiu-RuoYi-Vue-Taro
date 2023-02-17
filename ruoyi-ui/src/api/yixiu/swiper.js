import request from '@/utils/request'

// 查询轮播图列表
export function listSwiper(query) {
  return request({
    url: '/yixiu/swiper/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图详细
export function getSwiper(swiperId) {
  return request({
    url: '/yixiu/swiper/' + swiperId,
    method: 'get'
  })
}

// 新增轮播图
export function addSwiper(data) {
  return request({
    url: '/yixiu/swiper',
    method: 'post',
    data: data
  })
}

// 修改轮播图
export function updateSwiper(data) {
  return request({
    url: '/yixiu/swiper',
    method: 'put',
    data: data
  })
}

// 删除轮播图
export function delSwiper(swiperId) {
  return request({
    url: '/yixiu/swiper/' + swiperId,
    method: 'delete'
  })
}
