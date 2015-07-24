package com.utils;

import org.weixin4j.Configuration;
import org.weixin4j.Weixin;
import org.weixin4j.WeixinException;

/**
 * 微信操作类
 *
 * @author YangQS
 */
public class WeixinHelp {

    private static Weixin weixin = null;

    public static Weixin getInstance() throws WeixinException {
        if (weixin == null) {
            weixin = new Weixin();
        }
        weixin.login(Configuration.getOAuthAppId(), Configuration.getOAuthSecret());
        return weixin;
    }
}
