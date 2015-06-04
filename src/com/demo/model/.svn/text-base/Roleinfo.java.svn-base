package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Roleinfo extends Model<Roleinfo> {
	public static Roleinfo dao = new Roleinfo();
	/**
	 * 分页
	 * @param pageNumber  页码
	 * @param pageSize 长度
	 * @return 分页信息
	 */
	public Page<Roleinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from role where 1=1 ");
	}
	/**
	 * 查权限信息
	 * @param id  唯一id
 	 * @return 返回 角色能够使用的权限信息
	 */
	public String authority(String id) {
		return Roleinfo.dao.findById(id).get("authority").toString();
	}
	/**
	 * 更新
	 * @param ids 唯一id
	 * @param authorityid  权限id添加
	 * @return true or  fales
	 */
	public boolean update(String ids,String authorityid) {
		return Roleinfo.dao.findById(ids).set("authority", authorityid).update();
	}
	/**
	 * 更新服务费率
	 * @param id 唯一id
	 * @param social 
	 * @param serve  服务费率 
	 * @return
	 */
	public boolean update_serve(String id,String social,String serve)
	{
		return Roleinfo.dao.findById(id).set("social", social).set("serve", serve).update();
		
	}
	
}
