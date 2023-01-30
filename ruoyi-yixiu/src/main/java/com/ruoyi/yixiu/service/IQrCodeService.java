package com.ruoyi.yixiu.service;

import java.io.IOException;

public interface IQrCodeService {

  /**
   * 接口调用凭证 access_token
   */
  public String sendGet(String appId, String appKey);

  /**
   * 生成微信小程序二维码
   *
   * @param page        当前小程序相对页面 必须是已经发布的小程序存在的页面（否则报错），例如 pages/index/index, 根路径前不要填加 /,不能携带参数（参数请放在scene字段里），如果不填写这个字段，默认跳主页面
   * @param scene       最大32个可见字符，只支持数字，大小写英文以及部分特殊字符：!#$&'()*+,/:;=?@-._~，其它字符请自行编码为合法字符（因不支持%，中文无法使用 urlencode 处理，请使用其他编码方式）
   * @param accessToken 接口调用凭证
   */
  public String generateQrCode(String page, String scene, String accessToken) throws IOException;
}
