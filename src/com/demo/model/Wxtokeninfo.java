package com.demo.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Wxtokeninfo extends Model<Wxtokeninfo> {
	public static  Wxtokeninfo dao= new Wxtokeninfo();
	
	
	
	public String insert_openid(String openid) {
		Record wxtoken = new Record() .set("openid", openid);
		Db.save("wxtoken", wxtoken);
		return wxtoken.get("id").toString();
	}
	 
	public String update_openid(String accesstoken, String openid, String aclongtimen,
			String acc_time ) {
		Record wxtoken = new Record().set("accesstoken", accesstoken)
				.set("openid", openid).set("aclongtimen", aclongtimen)
				.set("acc_time", acc_time);
		Db.save("wxtoken", wxtoken);
		return wxtoken.get("id").toString();
	}
	public Wxtokeninfo see_openid(String openid)// 用户登录成功
	{
		return Wxtokeninfo.dao.findFirst("select * from wxtoken where openid='"+ openid + "'");
	}
}