package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.demo.model.Productinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

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
		
		Page<Productinfo> pager=Productinfo.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20),where.toString(),param.toArray());
		List<Productinfo> articlesList = pager.getList();
		setAttr("product",articlesList );
		setAttr("pager", pager);
		render("/sys/product.jsp");
	}
	public void add()
	{
		render("/sys/product_ope.jsp");
	}
}
