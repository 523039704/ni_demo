package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.demo.model.Productinfo;
import com.demo.model.Productsoninfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Productcontroller extends Controller {

	public void index() {
		String address = getPara("address");
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		if (address != null && address.length() > 0) {
			where.append("   and addressid=?");
			param.add(address);
			setAttr("address", address);
		} else {
			setAttr("address", "-1");
		}

		where.append(" order by id  ");

		Page<Productinfo> pager = Productinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20),
				where.toString(), param.toArray());
		List<Productinfo> articlesList = pager.getList();
		setAttr("product", articlesList);
		setAttr("pager", pager);
		render("/sys/product.jsp");
	}

	public void add() {
		setAttr("sid","1");
		render("/sys/product_ope.jsp");
	}

	public void edit() {
		setAttr("sid",getPara("sid"));
		setAttr("product_son", Productsoninfo.dao.find("select * from product_son where pid='1'"));
		setAttr("product", Productinfo.dao.findById(getPara("id")));
		render("/sys/product_ope.jsp");
	}

	public void delete() {
		if (Productinfo.dao.findById(getPara("id")).delete()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/product\"}");
		}
	}
	 public void update()
	 { 	String id=getPara("id");
		//-------------------------------- 
		 String p_id0=getPara("p_id0");
		 String pric0=getPara("pric0");
		 if(p_id0.equals("")&&p_id0.length()==0)
		 {
			 Productsoninfo.dao.insert(id, pric0 );  
		 }else
		 {
			 Productsoninfo.dao.update(p_id0, pric0 );
		 }
		 String p_id1=getPara("p_id1");
		 String pric1=getPara("pric1");
		 if(p_id1.equals("")&&p_id1.length()==0)
		 {
			 Productsoninfo.dao.insert(id, pric1);  
		 }else
		 {
			 Productsoninfo.dao.update(p_id1, pric1);
		 }
		 String p_id2=getPara("p_id2");
		 String pric2=getPara("pric2");
		 if(p_id2.equals("")&&p_id2.length()==0)
		 {
			 Productsoninfo.dao.insert(id, pric2);  
		 }else
		 {
			 Productsoninfo.dao.update(p_id2, pric2);
		 }
		 String p_id3=getPara("p_id3");
		 String pric3=getPara("pric3");
		 if(p_id3.equals("")&&p_id3.length()==0)
		 {
			 Productsoninfo.dao.insert(id, pric3);  
		 }else
		 {
			 Productsoninfo.dao.update(p_id3, pric3);
		 }
		 String p_id4=getPara("p_id4");
		 String pric4=getPara("pric4");
		 if(p_id4.equals("")&&p_id4.length()==0)
		 {
			 Productsoninfo.dao.insert(id, pric4);  
		 }else
		 {
			 Productsoninfo.dao.update(p_id4, pric4);
		 } 
		 String name=getPara("name");
		 String begindate=getPara("begindate");
		 String enddate=getPara("enddate");
		 String datetime=getPara("datetime");
		 String price=getPara("price");
		 String address=getPara("address");
		 String upe=getPara("upe");
		 String information=getPara("information");
	
	
	 if(Productinfo.dao.update(id, name, begindate,enddate, datetime, price,
			 address, upe,information))
	 {
	 renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/product\"}");
	 }
	 }
	 public void insert()
	 {
		 String name=getPara("name");
		 String begindate=getPara("begindate");
		 String enddate=getPara("enddate");
		 String datetime=getPara("datetime");
		 String price=getPara("price");
		 String address=getPara("address");
		 String upe=getPara("upe");
		 String information=getPara("information");
		 String id=Productinfo.dao.insert( name, begindate,enddate, datetime, price, address, upe,information) ;
		 
		 
		//-------------------------------- 
		 String pric0=getPara("pric0");
		 Productsoninfo.dao.insert(id, pric0);  
		 
		 String pric1=getPara("pric1");
		 Productsoninfo.dao.insert(id, pric1);
		 
		 String pric2=getPara("pric2");
		 Productsoninfo.dao.insert(id, pric2);  
		 
		 String pric3=getPara("pric3");
		 Productsoninfo.dao.insert(id, pric3);
		 
		 String pric4=getPara("pric4");
		 
		 Productsoninfo.dao.insert(id, pric4);  
			//--------------------------------  	 
		
	 
	 renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/product\"}");
	  
	 }

}
