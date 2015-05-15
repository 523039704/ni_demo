package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Orderinfo extends Model<Orderinfo> {
 public  static  Orderinfo dao= new Orderinfo();
 
 public Page<Orderinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *","from `order` where 1=1 ");
	}
 

 public Page<Orderinfo> performance(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *","from `order` where 1=1 and  status=1 ");
	}

}
