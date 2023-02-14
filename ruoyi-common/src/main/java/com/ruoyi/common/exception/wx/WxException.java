package com.ruoyi.common.exception.wx;

import com.ruoyi.common.exception.base.BaseException;

/**
 * 微信异常类
 *
 * @author mmmmnd
 */
public class WxException extends BaseException {

    public WxException(String code, Object[] args)
    {
        super("wx", code, args, null);
    }
}
