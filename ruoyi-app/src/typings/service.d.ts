/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 15:38:28
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-09-26 15:20:06
 */
/** 请求的相关类型 */
declare namespace Service {
  /** 请求错误 */
  interface RequestError {
    /** 后端错误信息 */
    errData: String | Result;
    /** JWt */
    token: String;
    /** Method 和 Api*/
    api: String;
  }

  /** 后端接口返回的数据结构配置 */
  interface BackendResultConfig<T = any> {
    /** 表示后端请求状态码的属性字段 */
    code: string | number;
    /** 表示后端请求数据的数据结构 */
    data: T;
    /** 表示后端消息的属性字段 */
    msg: string;
  }

  /** 后端接口返回的数据结构配置 data是数组类型 */
  interface BackendResultObjectConfig<T = any> {
    /** 表示后端请求状态码的属性字段 */
    code: string | number;
    /** 表示后端请求数据的数据结构 */
    data: T[];
    /** 表示后端消息的属性字段 */
    msg: string;
  }

  /** 小程序请求数据结构 */
  interface Result {
    cookies?: String[];
    data: TaroGeneral.IAnyObject;
    errMsg: string;
    header: TaroGeneral.IAnyObject;
    statusCode: string | number;
  }

  /** 自定义的请求成功结果 */
  interface SuccessResult<T = any> {
    /** 请求错误 */
    error: null | RequestError;

    /** 请求数据 */
    success: null | T;
  }

  /** 自定义的请求结果 */
  type RequestResult<T = any> = SuccessResult<T>;
}
