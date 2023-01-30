/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2021-07-02 16:47:37
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-01-27 16:21:15
 */
function _inheritsLoose (subClass, superClass) {
  subClass.prototype = Object.create(superClass.prototype);
  subClass.prototype.constructor = subClass;
  _setPrototypeOf(subClass, superClass);
}

function _setPrototypeOf (o, p) {
  _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf (o, p) {
    o.__proto__ = p;
    return o;
  };
  return _setPrototypeOf(o, p);
}

export default _inheritsLoose;