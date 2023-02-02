/*
 * @Author: 莫卓才
 * @eMail: handsome.mo@foxmail.com
 * @Descripttion: 描述
 * @version: 1.0.0
 * @Date: 2022-08-24 15:40:40
 * @LastEditors: 莫卓才
 * @LastEditTime: 2022-08-26 10:57:44
 */
import { EnumDataType } from '@/enum';

export function isNumber(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.number;
}
export function isString(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.string;
}
export function isBoolean(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.boolean;
}
export function isNull(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.null;
}
export function isUndefined(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.undefined;
}
export function isObject(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.object;
}
export function isArray(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.array;
}
export function isDate(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.date;
}
export function isRegExp(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.regexp;
}
export function isSet(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.set;
}
export function isMap(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.map;
}
export function isArrayBuffer(data: unknown) {
  return Object.prototype.toString.call(data) === EnumDataType.arrayBuffer;
}