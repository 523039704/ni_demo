package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Functioninfo extends Model<Functioninfo> {
public static Functioninfo dao = new Functioninfo();
	/**
	 * 功能分页 
	 * @param pageNumber 当前加一的页码
	 * @param pageSize  长度
	 * @return  分页内容
	 */
	public Page<Functioninfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *","from `function` where 1=1 ");
	}
	/**
	 * 功能插入
	 * @param name  名称
	 * @param path  路径
	 * @return true or  fales
	 */
	public boolean insert(String name,String path)
	{
		int id=Functioninfo .dao.findFirst("select * from function ORDER BY id DESC").getInt("id")+1;
		return Functioninfo.dao.set("id", id).set("name", name).set("path", path).save();
	}
	 /**
	  * 功能更新
	  * @param id  字段唯一id
	  * @param name 名字
	  * @param path 路径
	  * @return true or  fales
	  */
	public boolean update(String id,String name,String path)
	{
		return Functioninfo.dao.findById(id).set("name", name).set("path", path).update();
	}
	
	
	 
	
	public Functioninfo see_index(String id)
	{
		return Functioninfo .dao.findById(id);	
		
	}
	
	
	
}
