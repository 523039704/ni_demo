package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Functioninfo extends Model<Functioninfo> {
public static Functioninfo dao = new Functioninfo();
	
	public Page<Functioninfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *","from `function` where 1=1 ");
	}
 
	public boolean insert(String name,String path)
	{
		int id=Functioninfo.dao.ids()+1;
		return Functioninfo.dao.set("id", id).set("name", name).set("path", path).save();
	}
	
	
	
	public int ids()
	{
		
		
		
		
		return Functioninfo .dao.findFirst("select * from function ORDER BY id DESC").getInt("id");
		
	}
	
	
	
	
}
