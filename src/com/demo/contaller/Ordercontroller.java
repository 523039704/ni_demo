package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.basic.util.DateUtil;
import com.basic.util.Mathutil;
import com.demo.innterceptor.BasiceInterceptor;
import com.demo.model.Courseinfo;
import com.demo.model.Orderinfo;
import com.demo.model.Productinfo;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
@Before(BasiceInterceptor.class)
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
				where.append("GROUP by filialeid,productid");
			}else if (role.equals("2"))
			{
				where.append("   and filialeid=?");
				param.add(uid);
				where.append("GROUP by  agentid ,productid");
			}else if (role.equals("3"))
			{
				where.append("   and agentid=?");
				param.add(uid);
				where.append("GROUP by   businessid,productid");
			}else if (role.equals("4"))
			{
				where.append("   and businessid=?  ");
				param.add(uid);
				where.append("GROUP by  productid");
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
		String income="0";
		String longtime=getPara("longtime");
		String overdatetime=getPara("overdatetime");
		String price=getPara("price");
		String admin="0";
		String filiale="0";
		String agent="0";
		String business="0";
		if(ope.equals("1"))
		{
			income=Mathutil.income(price, longtime, Mathutil.divide(getPara("income"), "100"));
			admin=Mathutil.round( Mathutil.multiply(income, Mathutil.divide(getPara("admin"), "100",2)),2);
			filiale=Mathutil.round( Mathutil.multiply(admin, Mathutil.divide(getPara("filiale"), "100",2)),2);
			agent=Mathutil.round( Mathutil.multiply(filiale,Mathutil.divide(getPara("agent"), "100",2)),2);
			business=Mathutil.round( Mathutil.multiply(agent,Mathutil.divide(getPara("business"), "100",2)),2);
		}else if(ope.equals("2"))
		{
			admin=Mathutil.round( Mathutil.multiply(price, Mathutil.divide(getPara("admin"), "100",2)),2);
			filiale=Mathutil.round( Mathutil.multiply(admin, Mathutil.divide(getPara("filiale"), "100",2)),2);
			agent=Mathutil.round( Mathutil.multiply(filiale,Mathutil.divide(getPara("agent"), "100",2)),2);
			business=Mathutil.round( Mathutil.multiply(agent,Mathutil.divide(getPara("business"), "100",2)),2);	
		}
		String id=getPara("id");
		String status=getPara("status");
		String uid=getSession().getAttribute("userid").toString();
		if(Orderinfo.dao.insert(username,ope,id,price,status,uid,admin,filiale,agent,business,longtime,income,DateUtil.makeTimestamp(),overdatetime))
		{
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,\"forward\":\"/order\"}");
		}
	}
}
