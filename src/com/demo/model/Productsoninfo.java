package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Productsoninfo extends Model<Productsoninfo> {
  public static  Productsoninfo  dao = new Productsoninfo();
  
  public boolean update(String id,String pric)
  {
	  
	  return Productsoninfo.dao.findById(id).set("rangeid", pric).update();
  }
  
  public boolean insert(String pid,String pric)
  {
	  long id = Productsoninfo.dao.findFirst("select * from product_son order by id DESC limit 1").getLong("id");
	  return Productsoninfo.dao.set("id", id+1).set("pid", pid).set("rangeid", pric).save();	  
  }
  
}
