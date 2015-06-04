package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Productsoninfo extends Model<Productsoninfo> {
	public static Productsoninfo dao = new Productsoninfo();

	/**
	 * 更新金额饭为信息
	 * @param id 唯一id
	 * @param pric 金额范围
	 * @return  true or  fales
	 */
	public boolean update(String id, String pric) {

		return Productsoninfo.dao.findById(id).set("rangeid", pric).update();
	}

	/**
	 * 插入信息
	 * @param pid 产品id
	 * @param pric 金额范围
	 * @return true or  fales
	 */
	public boolean insert(String pid, String pric) {
		long id = Productsoninfo.dao.findFirst(
				"select * from product_son order by id DESC limit 1").getLong(
				"id");
		return Productsoninfo.dao.set("id", id + 1).set("pid", pid)
				.set("rangeid", pric).save();
	}

}
