package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.basic.util.DateUtil;
import com.basic.util.MD5;
import com.demo.innterceptor.BasiceInterceptor;
import com.demo.model.Userinfo;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;


@Before(BasiceInterceptor.class)
public class Usercontroller extends Controller {
	public void index()
	{
				String username=getPara("username");
				String phone=getPara("phone");
				String reservation=getPara("reservation");
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		if(username!=null&&username.length()>0){
		where.append("   and adminname=?");
		param.add(username); 
		} 
		if(phone!=null&&phone.length()>0){
			where.append("   and  phone=?  ");
			param.add(phone);
			}
		if(reservation!=null&&reservation.length()>0){
			where.append(" and add_time>=? and add_time<=?");
			String [] datetime=reservation.split("至");
			param.add(datetime[0].trim()+" 00:00:00");
			param.add(datetime[1].trim()+" 23:59:59");
			}
		where.append(" order by admin_id  ");
		setAttr("username",username);
		setAttr("phone", phone);
		setAttr("reservation",reservation);
		setAttr("blogPage", Userinfo.dao.paginate(getParaToInt(0, 1), 10,where.toString(),param.toArray()));
		render("/sys/user.jsp");
	}
	
	public void add()
	{
		render("/sys/user_ope.jsp");
	}
	public void insert()
	{
		String username=getPara("username");
		String realtname=getPara("realtname");
		String password=MD5.md5Digest("111111");
		String numbercard=getPara("numbercard");
		String phone=getPara("phone");
		String email=getPara("email");
		String ope=getPara("ope");
		String addtime=DateUtil.getDateStringBySeparator();
		if(Userinfo.dao.insert(username,password, realtname, numbercard, phone, email, ope,addtime))
		{
			redirect("/user");	
		}
	}
 }
