package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Wxconfig extends Model<Wxconfig>{

	public static Wxconfig dao = new Wxconfig();
	
	//取数据库微信公众号参数配置
	public Wxconfig getWxconfig() {
		
		return Wxconfig.dao.findFirst("select * from Wxconfig");
		
	}
	
	//编辑微信公众号参数配置
	public boolean saveorupdate(int id,String appId,String token,String appSecret,int encryptMessage) {
		if(id>0) {
			return Wxconfig.dao.findById(id).set("appId", appId).set("token", token).set("appSecret", appSecret).set("encryptMessage", encryptMessage).update();
		}
		return Wxconfig.dao.set("appId", appId).set("token", token).set("appSecret", appSecret).set("encryptMessage", encryptMessage).save();
		
	}
	
	//带分页的查询
	public Page<Wxconfig> paginate(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select *",
				"from Wxconfig where 1=1 " + where, objects);
	}
	
}
