package com.demo.contaller;

import com.demo.model.Courseinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Productinfo;
import com.jfinal.core.Controller;

public class Ordercontroller extends Controller {

	public void index()
	{
		setAttr("order", Orderinfo.dao.paginate(getParaToInt(0, 1), 10));
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
		setAttr("performance", Orderinfo.dao.performance(getParaToInt(0, 1), 10));
		render("/sys/performance.jsp");
	}
}
