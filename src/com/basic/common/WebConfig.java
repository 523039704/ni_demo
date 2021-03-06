package com.basic.common;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.demo.contaller.Coursecontroller;
import com.demo.contaller.Embodycontroller;
import com.demo.contaller.Functioncontroller;
import com.demo.contaller.Groupcontroller;
import com.demo.contaller.Indexcontroller;
import com.demo.contaller.Ordercontroller;
import com.demo.contaller.Paycontaller;
import com.demo.contaller.Productcontroller;
import com.demo.contaller.Rangecontroller;
import com.demo.contaller.Rolecontroller;
import com.demo.contaller.Subscribecontroller;
import com.demo.contaller.Usercontroller;
import com.demo.contaller.WeixinApiController;
import com.demo.contaller.WeixinMsgController;
import com.demo.contaller.Weixincheck;
import com.demo.contaller.Wxappcontroller;
import com.demo.contaller.Zonecontroller;
import com.demo.model.Areainfo;
import com.demo.model.Cityinfo;
import com.demo.model.Courseinfo;
import com.demo.model.Embodyinfo;
import com.demo.model.Functioninfo;
import com.demo.model.Groupinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Productinfo;
import com.demo.model.Productsoninfo;
import com.demo.model.Provinceinfo;
import com.demo.model.Rangeinfo;
import com.demo.model.Roleinfo;
import com.demo.model.Subscribeinfo;
import com.demo.model.Userinfo;
import com.demo.model.Usermessagerinfo;
import com.demo.model.Wxconfig;
import com.demo.model.Wxtokeninfo;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;

public class WebConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		loadPropertyFile("classes/config.properties");
		me.setDevMode(getPropertyToBoolean("devMode", false));
		me.setEncoding("utf8");
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		// TODO Auto-generated method stub
		me.add("/", Indexcontroller.class); 
		me.add("/user", Usercontroller.class); 
		me.add("/product", Productcontroller.class); 
		me.add("/course", Coursecontroller.class); 
		me.add("/order", Ordercontroller.class); 
		me.add("/function", Functioncontroller.class); 
		me.add("/role", Rolecontroller.class); 
		me.add("/range", Rangecontroller.class); 
		me.add("/group", Groupcontroller.class); 
		me.add("/zone", Zonecontroller.class); 
		me.add("/embody", Embodycontroller.class); 
		me.add("/subscribe", Subscribecontroller.class); 
		
		
		//微信
		me.add("/msg", WeixinMsgController.class);//基础 在中间 用户关注的时候和用户取消关注的时候 能用到
		me.add("/api", WeixinApiController.class);//这个基本上在这个后台没有用得到了   中间有一个方法使用到的了 就是  重置  微信上面的菜单  
		me.add("/app", Wxappcontroller.class);// 在开发的微信账户上显示的内容接口  具体的都是怎样显示 怎样处理的逻辑代码
		me.add("/check", Weixincheck.class); // 这个不用去管  就是一个微信机制的校验功能
		me.add("/pay", Paycontaller.class); //微信支付
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		// 配置alibaba数据库连接池插件
		DruidPlugin druidPlugin = new DruidPlugin(getProperty("jdbc.url"),
				getProperty("jdbc.username"), getProperty("jdbc.password"),
				getProperty("jdbc.driverClassName"));
		WallFilter wall = new WallFilter();
		wall.setDbType(getProperty("jdbc.dbType"));
		druidPlugin.addFilter(wall);
		druidPlugin.addFilter(new StatFilter());
		me.add(druidPlugin);

		// 配置ActiveRecord插件
		// ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		me.add(arp);
		arp.addMapping("admin", Userinfo.class); 
		arp.addMapping("product", Productinfo.class); 
		arp.addMapping("course", Courseinfo.class); 
		arp.addMapping("order", Orderinfo.class); 
		arp.addMapping("function", Functioninfo.class); 
		arp.addMapping("role", Roleinfo.class); 
		arp.addMapping("product_son", Productsoninfo.class); 
		arp.addMapping("range", Rangeinfo.class); 
		arp.addMapping("group", Groupinfo.class); 
		arp.addMapping("hat_province", Provinceinfo.class); 
		arp.addMapping("hat_city", Cityinfo.class); 
		arp.addMapping("hat_area", Areainfo.class); 
		arp.addMapping("embody", Embodyinfo.class); 
		arp.addMapping("usermessager", "user_id", Usermessagerinfo.class); 
		arp.addMapping("subscribe",  Subscribeinfo.class); 
		//微信配置
		arp.addMapping("Wxconfig", Wxconfig.class); 
		arp.addMapping("wxtoken", Wxtokeninfo.class); 
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
	}
	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
	}
}
