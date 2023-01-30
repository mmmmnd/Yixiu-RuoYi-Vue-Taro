package com.ruoyi.yixiu.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.constant.WxConstants;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.sign.Base64;
import com.ruoyi.yixiu.service.IQrCodeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

@Service
public class IQrCodeServiceImpl implements IQrCodeService {

  private static final Logger log = LoggerFactory.getLogger(IQrCodeServiceImpl.class);

  /**
   * 接口调用凭证 access_token
   *
   * @param appId  小程序id
   * @param appKey 小程序密钥
   */
  @Override
  public String sendGet(String appId, String appKey) {

    String wxUrl = WxConstants.getTokenUrl;
    String param = "grant_type=client_credential&appid=" + appId + "&secret=" + appKey;
    String rspStr = HttpUtils.sendGet(wxUrl, param);

    /*将字符串转换为json类型*/
    JSONObject obj = JSON.parseObject(rspStr);
    String accessToken = obj.getString("access_token");

    if (!StringUtils.isEmpty(accessToken)) {
      return accessToken;
    } else {
      log.error("获取微信token失败" + rspStr);
      throw new ServiceException(rspStr, 500);
    }
  }

  /**
   * 生成微信小程序二维码
   *
   * @param page        当前小程序相对页面 必须是已经发布的小程序存在的页面（否则报错），例如 pages/index/index, 根路径前不要填加 /,不能携带参数（参数请放在scene字段里），如果不填写这个字段，默认跳主页面
   * @param scene       最大32个可见字符，只支持数字，大小写英文以及部分特殊字符：!#$&'()*+,/:;=?@-._~，其它字符请自行编码为合法字符（因不支持%，中文无法使用 urlencode 处理，请使用其他编码方式）
   * @param accessToken 接口调用凭证
   */
  @Override
  public String generateQrCode(String page, String scene, String accessToken) throws IOException {
//
//    String wxUrl = WxConstants.getWxCodeUnlimit + "?access_token=" + accessToken;
//
//    // 发送请求参数
//    JSONObject paramJson = new JSONObject();
//    //这就是你二维码里携带的参数 String型  名称不可变
//    paramJson.put("scene", scene);
//    //注意该接口传入的是page而不是path
//    paramJson.put("page", page);
//    //这是设置扫描二维码后跳转的页面
//    paramJson.put("width", 200);
//    paramJson.put("is_hyaline", true);
//    paramJson.put("auto_color", true);
//
//    String rspStr = HttpUtils.sendPost(wxUrl, paramJson);
//    InputStream inputStream = new ByteArrayInputStream(rspStr.getBytes());

    ByteArrayOutputStream baos = null;

    //调用微信接口生成二维码
    URL url = new URL(WxConstants.getWxCodeUnlimit + "?access_token=" + accessToken);
    HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
    httpURLConnection.setRequestMethod("POST");// 提交模式
    // conn.setConnectTimeout(10000);//连接超时 单位毫秒
    // conn.setReadTimeout(2000);//读取超时 单位毫秒
    // 发送POST请求必须设置如下两行
    httpURLConnection.setDoOutput(true);
    httpURLConnection.setDoInput(true);
    // 获取URLConnection对象对应的输出流
    PrintWriter printWriter = new PrintWriter(httpURLConnection.getOutputStream());

    // 发送请求参数
    JSONObject paramJson = new JSONObject();
    //这就是你二维码里携带的参数 String型  名称不可变
    paramJson.put("scene", scene);
    //注意该接口传入的是page而不是path
    paramJson.put("page", page);
    //这是设置扫描二维码后跳转的页面
    paramJson.put("width", 200);
    paramJson.put("is_hyaline", true);
    paramJson.put("auto_color", true);

    printWriter.write(paramJson.toString());
    // flush输出流的缓冲
    printWriter.flush();

    //开始获取数据
    BufferedInputStream bis = new BufferedInputStream(httpURLConnection.getInputStream());
    baos = new ByteArrayOutputStream();

    byte[] buffer = new byte[1024];
    int len = -1;
    while ((len = bis.read(buffer)) != -1) {
      baos.write(buffer, 0, len);
    }

    return Base64.encode(baos.toByteArray());
  }
}
