/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-07-02 16:47:37
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-11-21 09:03:45
 */
const config = Symbol('config');
import * as Taro from '@tarojs/taro';
import { BASE_URL } from '@/config';
import CheckHttp from './check_http';
import { RequestEnum, ContentTypeEnum } from '@/enum';
import InheritsHttp from './inherits_http';

const Https: any = (function(o) {
  InheritsHttp(Https, o);

  function Https() {
    return o.apply(this, arguments) || this;
  }

  Https.prototype[config] = {
    url: BASE_URL,
    header: {
      'Content-type': ContentTypeEnum.JSON
    },
    dataType: 'json',
    responseType: 'text',
    timeout: 1000
  };

  Https.prototype.get = function(url, data = {}) {
    const params = { url, data, method: RequestEnum.GET };
    return this.request(params);
  };

  Https.prototype.post = function(url, data = {}) {
    const params = { url, data, method: RequestEnum.POST };
    return this.request(params);
  };

  Https.prototype.delete = function(url, data = {}) {
    const params = { url, data, method: RequestEnum.DELETE };
    return this.request(params);
  };

  Https.prototype.put = function(url, data = {}) {
    const params = { url, data, method: RequestEnum.PUT };
    return this.request(params);
  };

  Https.prototype.hasHttpUrl = function(url) {
    const isHttp = /http(s)?/;
    return isHttp.test(url) ? url : this[config].url + url;
  };

  Https.prototype.request = function(params: request.Option, option: any = {}) {
    option.url = this.hasHttpUrl(params.url);
    option.header = this[config].header;
    option.method = params.method;
    option.data = params.data || '';

    option = { ...option, ...this.interceptors.request(option) };

    return new Promise((resolve, reject) => {
      option.success = res => resolve(this.interceptors.response(res, option));
      option.fail = err => reject(this.interceptors.response(err, option));

      Taro.request(option);
    })
      .then((res: Service.BackendResultConfig) => {
        if (res && !res.code) {
          return res;
        } else if (res) {
          console.log('res', res);

          Taro.showToast({
            title: res.msg,
            icon: 'none',
            duration: 3000
          });
        } else throw new Error('服务器异常');
      })
      .catch(err => {
        /* response 层抛出异常 catch 层捕获不到 */
        Taro.showToast({
          title: '服务器连接错误',
          icon: 'none',
          duration: 3000
        });
        console.log('服务器连接错误', err);
        throw err;
      });
  };

  return Https;
})(CheckHttp);

export default Https;
