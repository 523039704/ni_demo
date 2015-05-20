package com.demo.model;

import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Areainfo extends Model<Areainfo> {
 public static  Areainfo dao= new Areainfo();
 public String see_area(String id)
 {
		return JsonKit.listToJson(Areainfo.dao.find("select  *  from hat_area where father='"+id+"' order by id desc"), 2);
 }
}
