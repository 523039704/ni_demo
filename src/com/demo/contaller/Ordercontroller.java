package com.demo.contaller;

import java.util.List;

import com.demo.model.Courseinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Productinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Ordercontroller extends Controller {

	public void index()
	{
		Page<Orderinfo> pager=Orderinfo.dao.paginate(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20));
		List<Orderinfo> articlesList = pager.getList();
		setAttr("order", articlesList);
		setAttr("pager", pager);
		render("/sys/order.jsp");
	}
	
	public void  add()
	 {
		if(getPara("ptoducti").equals("1"))
		{
			setAttr("messager",Productinfo.dao.findById(getPara("id")));
		}else if(getPara("ptoducti").equals("2"))
		{
			setAttr("messager",Courseinfo.dao.findById(getPara("id")));
		}
		setAttr("ptoducti", getPara("ptoducti"));
		render("/sys/order_ope.jsp"); 
	 }
	
	
	
	
	public void  performance()
	{
		Page<Orderinfo> pager=Orderinfo.dao.performance(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20));
		List<Orderinfo> articlesList = pager.getList();
		setAttr("performance", articlesList);
		setAttr("pager", pager);
		render("/sys/performance.jsp");
	}
}
