package com.ansitech.wechat;

import java.util.ArrayList;
import java.util.List;
import org.weixin4j.Menu;
import org.weixin4j.Weixin;
import org.weixin4j.WeixinException;
import org.weixin4j.menu.ClickButton;
import org.weixin4j.menu.SingleButton;
import org.weixin4j.menu.ViewButton;

/**
 * CustomMenuDemo业务
 *
 * @author qsyang
 * @version 1.0
 */
public class CustomMenuDemo {

    public static void main(String[] args) throws WeixinException {
//        Weixin weixin = WeixinManager.getWeixin();
//        //查询菜单
//        Menu menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }

//        Weixin weixin = new Weixin();
//        String appId = Configuration.getOAuthAppId();
//        String secret = Configuration.getOAuthSecret();
//        weixin.login("wxb4fa535e0584ac53", "763dc82c526315e45c3873492ac70a28");
//        Menu menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }
//        String access_token = "4WPHj6pxHoYflvPgCS4zqYgfCWG62DgP7W0TFt_d8CRIl_Tf8DoOpKENQGmM_NtxlHlIrvIFQwNbVh2njf5RhRt5MfFBori8XMEbUFasp5Q";
//        Weixin weixin = new Weixin();
//        String appId = Configuration.getOAuthAppId();
//        String secret = Configuration.getOAuthSecret();
//        weixin.init(access_token, appId, secret, 3600);
//        Menu menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }
        Weixin weixin = WeixinManager.getWeixin();

//        //删除菜单
//        weixin.deleteMenu();
//        //查询菜单
//        Menu menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }
        
//        //BTN-1 点我送祝福
//        //BTN-2 我的主页
//        //BTN-3 我的积分
//        Menu menu = new Menu();
//        List<SingleButton> buttons = new ArrayList<SingleButton>();
//        buttons.add(new ViewButton("主页", "http://www.weixin4j.org"));
//        buttons.add(new ClickButton("点我送祝福", "BTN-1"));
//        SingleButton singleButton = new SingleButton("我");
//        List<SingleButton> subButtons = new ArrayList<SingleButton>();
//        subButtons.add(new ViewButton("个人资料", "http://www.weixin4j.org"));
//        subButtons.add(new ClickButton("我的主页", "BTN-2"));
//        subButtons.add(new ClickButton("我的积分", "BTN-3"));
//        //设置子菜单
//        singleButton.setSubButton(subButtons);
//        buttons.add(singleButton);
//        menu.setButton(buttons);
//        System.out.println(menu.toJSONObject().toString());;
//        //创建自定义菜单
//        weixin.createMenu(menu);
//        System.out.println("创建菜单完成!");
//        //查询菜单
//        menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }

        //查询菜单
//        Menu menu = weixin.getMenu();
//        if (menu != null) {
//            String json = menu.toJSONObject().toString();
//            System.out.println("菜单json:" + json);
//        }
    }
}
