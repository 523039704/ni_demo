package com.ansitech.test;

import java.util.List;

import org.weixin4j.Data;
import org.weixin4j.Followers;
import org.weixin4j.Group;
import org.weixin4j.User;
import org.weixin4j.Weixin;
import org.weixin4j.WeixinException;

import com.ansitech.wechat.WeixinManager;

/**
 * WeixinDemo业务
 *
 * @author qsyang
 * @version 1.0
 */
public class WeixinDemo {

    public static void main(String[] args) throws WeixinException {
        Weixin weixin = WeixinManager.getWeixin();
        User user = weixin.getUserInfo("o_p8Lt5WEixC9ODeSkGU5-wnYicw");
        System.out.println(user.getNickname());
//        Followers followers = weixin.getAllUserList();
//        System.out.println("粉丝数：" + followers.getCount());
//        Data data = followers.getData();
//        List<String> openIds = data.getOpenid();
//        int i = 1;
//        for (String openId : openIds) {
//            User user = weixin.getUserInfo(openId);
//            System.out.println("粉丝" + i + " ：" + user.getNickname());
//            i++;
//        }
//        FgroupCreate(weixin);
//        groupUpdate(weixin);
//        groupGet(weixin);
    }

    private static void groupUpdate(Weixin weixin) throws WeixinException {
        weixin.updateGroup(100, "weixin4j粉丝");
    }

    private static void groupCreate(Weixin weixin) throws WeixinException {
        Group group = weixin.createGroup("weixin4j开发粉丝");
        System.out.println("创建组Id:" + group.getId() + ",组名称" + group.getName());
    }

    public static void groupGet(Weixin weixin) throws WeixinException {

        List<Group> groups = weixin.getGroups();
        if (groups != null) {
            for (Group group : groups) {
                System.out.println("组Id:" + group.getId() + ",组名称" + group.getName() + ",组粉丝数：" + group.getCount());
            }
        } else {
            System.out.println("暂无分组!");
        }
    }
}
