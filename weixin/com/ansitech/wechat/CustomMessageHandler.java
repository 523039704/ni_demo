package com.ansitech.wechat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.weixin4j.message.Articles;
import org.weixin4j.message.NewsOutputMessage;
import org.weixin4j.message.OutputMessage;
import org.weixin4j.message.TextOutputMessage;
import org.weixin4j.spi.IMessageHandler;
import org.weixin4j.spi.InputMessage;

/**
 * CustomMessageHandler业务
 *
 * @author qsyang
 * @version 1.0
 */
public class CustomMessageHandler implements IMessageHandler {

    private final static Map<String, String> maps = new HashMap<String, String>();
    private final static Map<String, String> buttonMaps = new HashMap<String, String>();

    static {
        maps.put("电话", "15288889999");
        maps.put("网址", "www.weixin4j.org");
        buttonMaps.put("BTN-1", "点我送祝福");
//        buttonMaps.put("BTN-2", "我的主页");
        buttonMaps.put("BTN-3", "我的积分");
    }

    @Override
    public OutputMessage textTypeMsg(InputMessage im) {
        if (maps.containsKey(im.getContent())) {
            String value = maps.get(im.getContent());
            return new TextOutputMessage(value);
        }
        //实例化一个图文消息
        NewsOutputMessage newsOutputMsg = new NewsOutputMessage();
        List<Articles> list = new ArrayList<Articles>();
        Articles articles = new Articles();
        articles.setTitle("欢迎使用weixin4j微信开发包!");
        articles.setDescription("为Java微信开发爱好者提供的微信公众开发平台SDK，简化了Java对微信的开发。");
        articles.setPicUrl("http://files.colabug.com/forum/201504/26/151806nahhqqh7p4pxlqxs.jpg");
        articles.setUrl("http://www.weixin4j.org");
        list.add(articles);
        //一条图文消息
        newsOutputMsg.setArticles(list);
        return newsOutputMsg;
    }

    @Override
    public OutputMessage imageTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OutputMessage linkTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OutputMessage voiceTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OutputMessage locationTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OutputMessage eventTypeMsg(InputMessage im) {
        if (buttonMaps.containsKey(im.getEventKey())) {
            String value = buttonMaps.get(im.getEventKey());
            return new TextOutputMessage("你点击了按钮" + value);
        }
        return new TextOutputMessage("不知道你点了什么按钮！");
    }

    public OutputMessage videoTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public OutputMessage shortvideoTypeMsg(InputMessage im) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
