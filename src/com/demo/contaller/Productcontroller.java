package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.demo.model.Productinfo;
import com.jfinal.core.Controller;

public class Productcontroller extends Controller {

	public void index()
	{
		String address=getPara("address");
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		if(address!=null&&address.length()>0){
		where.append("   and addressid=?");
		param.add(address); 
		setAttr("address",address);
		}else{setAttr("address","-1");}
		where.append(" order by id  ");
		setAttr("product", Productinfo.dao.paginate(getParaToInt(0, 1), 10,where.toString(),param.toArray()));
		render("/sys/product.jsp");
	}
	public void add()
	{
		render("/sys/product_ope.jsp");
	}
}
