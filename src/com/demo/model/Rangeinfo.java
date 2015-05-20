package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Rangeinfo extends Model<Rangeinfo> {
	public static Rangeinfo dao = new Rangeinfo();

	public Page<Rangeinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `range`  where 1=1 ");
	}

	public boolean insert(String min, String max, String income) {

		 long id = Rangeinfo.dao.findFirst("select * from `range` order by id DESC limit 1").getLong("id");
		return Rangeinfo.dao.set("id", id+1).set("amount_min", min).set("amount_max", max)
				.set("income", income).save();

	}

	public boolean update(String id, String min, String max, String income) {

		return Rangeinfo.dao.findById(id)
				.set("amount_min", min)
				.set("amount_max", max).set("income", income).update();

	}

}
