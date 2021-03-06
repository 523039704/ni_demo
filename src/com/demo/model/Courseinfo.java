package com.demo.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Courseinfo extends Model<Courseinfo> {
	public static Courseinfo dao = new Courseinfo();
	/**
	 * 课程分页
	 * @param pageNumber 分页的页码
	 * @param pageSize 分页的条数
	 * @return 返回分页 的信息
	 */
	public Page<Courseinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from course where 1=1 ");
	}
    /**
     * 更新课程的信息
     * @param id 课程唯一id
     * @param name 课程名称
     * @param createdatetime 创建时间
     * @param coursedatetime 截止报名时间
     * @param price 入场费
     * @param peoples 入场人数
     * @param service 佣金费率
     * @param summary  详情 简介
     * @return true or  fales
     */
	public boolean update(String id, String name, String createdatetime,
			String coursedatetime, String price, String peoples,
			  String summary,String admin,String filiale,String agent,String business) {
		return Courseinfo.dao.findById(id).set("name", name)
				.set("createdatetime", createdatetime).set("coursedatetime", coursedatetime).set("price", price)
				.set("admin", admin).set("filiale", filiale).set("agent", agent).set("business", business)
				.set("peoples", peoples).set("summary", summary).update();
	}

	/**
	 * 
	 * @param name  课程名称
	 * @param createdatetime  开始日期
	 * @param coursedatetime   截止日期
	 * @param price 金额价格
	 * @param peoples 人数
	 * @param service 佣金费率
	 * @param summary 详情简介
	 * @return true or  fales
	 */
	public boolean  insert(String id,String name, String createdatetime,
			String coursedatetime, String price, String peoples,
			  String summary,String admin,String filiale,String agent,String business)
	{
		 System.out.println(business);
		return Courseinfo.dao.findById(id).set("name", name)
				.set("createdatetime", createdatetime).set("coursedatetime", coursedatetime).set("price", price)
				.set("admin", admin).set("filiale", filiale).set("agent", agent).set("business", business)
				.set("peoples", peoples).set("summary", summary).update();
	}
	
	
	
	
	
	
	
	public String insert_img(String img, String img_reall) {
		Record course = new Record().set("img", img).set("img_reall", img_reall);
		Db.save("course", course);
		return course.get("id").toString();
	}
	
	
	
	
	
	
}
