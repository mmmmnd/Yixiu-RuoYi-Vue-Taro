package com.ruoyi.common.exception.wx;


public class WxErrorException  extends WxException {

    public WxErrorException(String code, Object[] args) {
        super(code, args);
    }
}
