package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Roleinfo extends Model<Roleinfo> {
	public static Roleinfo dao = new Roleinfo();

	public Page<Roleinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from role where 1=1 ");
	}

	public String authority(String id) {
		return Roleinfo.dao.findById(id).get("authority").toString();
	}

	public boolean update(String ids,String authorityid) {
		return Roleinfo.dao.findById(ids).set("authority", authorityid).update();
	}

	
	public boolean update_serve(String id,String social,String serve)
	{
		return Roleinfo.dao.findById(id).set("social", social).set("serve", serve).update();
		
	}
	
}
