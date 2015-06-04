package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Rangeinfo extends Model<Rangeinfo> {
	public static Rangeinfo dao = new Rangeinfo();
	/**
	 * 金额范围信息
	 * @param pageNumber 页码
	 * @param pageSize 长度
	 * @return 分页信息
	 */
	public Page<Rangeinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `range`  where 1=1 ");
	}
	/**
	 * 插入信息
	 * @param min 金额最小值
	 * @param max  金额最大值
	 * @param income 收益率
	 * @return true or  fales
	 */
	public boolean insert(String min, String max, String income) {

		 long id = Rangeinfo.dao.findFirst("select * from `range` order by id DESC limit 1").getLong("id");
		return Rangeinfo.dao.set("id", id+1).set("amount_min", min).set("amount_max", max)
				.set("income", income).save();

	}
	/**
	 * 更新
	 * @param id 唯一id
	 * @param min 最小金额
	 * @param max 最大金额
	 * @param income 收益率
	 * @return true or  fales
	 */ 
	public boolean update(String id, String min, String max, String income) {

		return Rangeinfo.dao.findById(id)
				.set("amount_min", min)
				.set("amount_max", max).set("income", income).update();

	}

}
