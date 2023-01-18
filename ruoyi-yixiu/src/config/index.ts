/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-06-15 17:58:34
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-10-09 17:04:38
 */
export const WHITE_PATH = 'pages/home/index';

export const WHITELIST_ROUTES = ['/foreign/login/getPhoneNumber', '/foreign/login/binding'];

export const IS_DEV = process.env.NODE_ENV === 'development';

export const BASE_URL = IS_DEV ? 'https://xcx.ylqx.top' : 'https://xcx.ylqx.top';

export const HTTP_ERROR = {
  200: '服务器成功返回请求数据',
  201: '用户新建或修改数据成功',
  202: '请求已经进入后台排队',
  204: '用户删除数据成功',
  400: '发出的请求有错误，服务器没有进行新建或修改数据的操作',
  401: '用户没有权限',
  403: '用户得到授权，但是访问是被禁止的',
  404: '请求不存在',
  405: '请求方法未允许',
  406: '请求的格式不可得',
  408: '请求超时',
  410: '请求的资源被永久删除，且不会再得到的',
  411: '需要知道长度',
  413: '请求的实体太大',
  414: '请求的URL太长',
  415: '不支持的媒体类型',
  422: '当创建一个对象时，发生一个验证错误',
  500: '服务器发生错误，请检查服务器',
  501: '网络未实现',
  502: '网关错误',
  503: '服务不可用，服务器暂时过载或维护',
  504: '网关超时',
  505: 'http版本不支持该请求'
};
