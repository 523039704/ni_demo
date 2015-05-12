package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Courseinfo extends Model<Courseinfo> {
public static Courseinfo dao= new Courseinfo();

public Page<Courseinfo> paginate(int pageNumber, int pageSize) {
	return paginate(pageNumber, pageSize, "select *","from course where 1=1 ");
}



}
