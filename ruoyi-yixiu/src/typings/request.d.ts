/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-25 14:44:14
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-25 14:51:10
 */
declare namespace request {
  interface Option<T = any, U extends string | TaroGeneral.IAnyObject | ArrayBuffer = any | any> {
    /** 开发者服务器接口地址 */
    url: string;
    /** 请求的参数 */
    data?: U;
    /** 设置请求的 header，header 中不能设置 Referer。
     *
     * `content-type` 默认为 `application/json`
     */
    header?: TaroGeneral.IAnyObject;
    /** 超时时间，单位为毫秒
     * @default 2000
     * @supported weapp, h5, tt
     */
    timeout?: number;
    /** HTTP 请求方法
     * @default GET
     */
    method?: keyof Method;
    /** 返回的数据格式 */
    dataType?: keyof DataType | string;
    /** 响应的数据类型 */
    responseType?: keyof ResponseType;
    /** 开启 http2
     * @default false
     * @supported weapp
     */
    /** 接口调用成功的回调函数 */
    success?: (result: Service.BackendResultConfig<T>) => void;
    /** 接口调用失败的回调函数 */
    fail?: (res: TaroGeneral.CallbackResult) => void;
    /** 接口调用结束的回调函数（调用成功、失败都会执行） */
    complete?: (res: TaroGeneral.CallbackResult) => void;
  }

  /** HTTP 请求方法 */
  interface Method {
    /** HTTP 请求 OPTIONS */
    OPTIONS;
    /** HTTP 请求 GET */
    GET;
    /** HTTP 请求 HEAD */
    HEAD;
    /** HTTP 请求 POST */
    POST;
    /** HTTP 请求 PUT */
    PUT;
    /** HTTP 请求 DELETE */
    DELETE;
    /** HTTP 请求 TRACE */
    TRACE;
    /** HTTP 请求 CONNECT */
    CONNECT;
  }

  /** 返回的数据格式 */
  interface DataType {
    /** 返回的数据为 JSON，返回后会对返回的数据进行一次 JSON.parse
     * 其他: 不对返回的内容进行 JSON.parse
     */
    json;
  }

  /** 响应的数据类型 */
  interface ResponseType {
    /** 响应的数据为文本 */
    text;
    /** 响应的数据为 ArrayBuffer */
    arraybuffer;
  }
}
