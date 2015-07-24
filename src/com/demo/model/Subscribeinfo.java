package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Subscribeinfo extends Model<Subscribeinfo> {
public static Subscribeinfo dao = new Subscribeinfo();


	public boolean  s_insert(String uid,String type,String price)
	{
		return Subscribeinfo.dao.set("uid", uid).set("type", type).set("price", price).remove("id").save();
	}

	public Page<Subscribeinfo> paginate(int pageNumber, int pageSize ) {
		return paginate(pageNumber, pageSize, "select * ",
				"from subscribe s   ,   usermessager u  where   s.uid=u.user_id " );
	}
	
	
	public boolean s_update(String id,String uid)
	{
		return Subscribeinfo.dao.findById(id).set("businessid", uid).set("status", "0").update();
	}
	
	
	
	
}
