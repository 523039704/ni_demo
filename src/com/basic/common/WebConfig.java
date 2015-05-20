package com.basic.common;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.demo.contaller.Coursecontroller;
import com.demo.contaller.Functioncontroller;
import com.demo.contaller.Groupcontroller;
import com.demo.contaller.Indexcontroller;
import com.demo.contaller.Ordercontroller;
import com.demo.contaller.Productcontroller;
import com.demo.contaller.Rangecontroller;
import com.demo.contaller.Rolecontroller;
import com.demo.contaller.Usercontroller;
import com.demo.model.Courseinfo;
import com.demo.model.Functioninfo;
import com.demo.model.Groupinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Productinfo;
import com.demo.model.Productsoninfo;
import com.demo.model.Rangeinfo;
import com.demo.model.Roleinfo;
import com.demo.model.Userinfo;
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
		arp.addMapping("admin","admin_id", Userinfo.class); 
		arp.addMapping("product", Productinfo.class); 
		arp.addMapping("course", Courseinfo.class); 
		arp.addMapping("order", Orderinfo.class); 
		arp.addMapping("function", Functioninfo.class); 
		arp.addMapping("role", Roleinfo.class); 
		arp.addMapping("product_son", Productsoninfo.class); 
		arp.addMapping("range", Rangeinfo.class); 
		arp.addMapping("group", Groupinfo.class); 
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
