package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Productinfo extends Model<Productinfo> {
	public static Productinfo dao=new Productinfo();
	public Page<Productinfo> paginate(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select *","from product where 1=1 " + where, objects);
	}

}
