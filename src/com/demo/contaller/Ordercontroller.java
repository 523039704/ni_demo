package com.demo.contaller;

import java.util.ArrayList;
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
		//首先判断角色，1,2,3  之后如果为1 则 用分公司的id进行group， 为2 是   得到角色的id   让分公司的id相等 并且用分销商的id进行group 余下的找这个逻辑写就可以了
		
		String role = getSession().getAttribute("role").toString();
		String uid = getSession().getAttribute("userid").toString();
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
			if(role.equals("1"))
			{
				where.append("GROUP by filialeid,createdatetime");
			}else if (role.equals("2"))
			{
				where.append("   and filialeid=?");
				param.add(uid);
				where.append("GROUP by  agentid ,createdatetime");
			}else if (role.equals("3"))
			{
				where.append("   and agentid=?");
				param.add(uid);
				where.append("GROUP by   businessid,createdatetime");
			}		
		Page<Orderinfo> pager=Orderinfo.dao.performance(getParaToInt("pageCurrent", 1),
				getParaToInt("pageSize", 20),where.toString(), param.toArray());
		List<Orderinfo> articlesList = pager.getList();
		setAttr("performance", articlesList);
		setAttr("pager", pager);
		render("/sys/performance.jsp");
	}
	
	
	
	public void insert()
	{
		String username=getPara("username");//用户登录名
		String ope=getPara("ope");
		String id=getPara("id");
		String price=getPara("price");
		String status=getPara("status");
		String uid=getSession().getAttribute("userid").toString();
		String role=getSession().getAttribute("role").toString();
		
		if(Orderinfo.dao.insert(username,ope,id,price,status,uid,role))
		{
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/order\"}");
		}
		
		
		
	}
}
