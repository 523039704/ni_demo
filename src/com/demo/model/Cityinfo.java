package com.demo.model;

import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Cityinfo extends Model<Cityinfo> {
 public static Cityinfo dao= new Cityinfo();
 public String see_city(String id)
 {
		return JsonKit.listToJson(Cityinfo.dao.find("select  *  from hat_city where father='"+id+"' order by id desc"), 2);
 }
}
