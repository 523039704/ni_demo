package com.demo.contaller;

import java.util.ArrayList;
import java.util.List;

import com.basic.util.DateUtil;
import com.basic.util.MD5base;
import com.demo.innterceptor.BasiceInterceptor;
import com.demo.model.Groupinfo;
import com.demo.model.Userinfo;
import com.demo.model.Usermessagerinfo;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

@Before(BasiceInterceptor.class)
public class Usercontroller extends Controller {
	public void index() {
		
		String role = getSession().getAttribute("role").toString();
		String username = getPara("username");
		String id = getPara("id");
		String phone = getPara("phone");
		String reservation = getPara("reservation");
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		where.append("   and role>=? and  role<10 ");
		param.add(role);
		if (id != null && id.length() > 0) {
			setAttr("id", id);
			where.append("   and fid=?");
			param.add(id);
		}
		if (username != null && username.length() > 0) {
			setAttr("username", username);
			where.append("   and adminname=?");
			param.add(username);
		}
		if (phone != null && phone.length() > 0) {
			setAttr("phone", phone);
			where.append("   and  phone=?  ");
			param.add(phone);
		}
		if (reservation != null && reservation.length() > 0) {
			where.append(" and add_time>=? and add_time<=?");
			setAttr("reservation", reservation);
			String[] datetime = reservation.split("至");
			param.add(datetime[0].trim() + " 00:00:00");
			param.add(datetime[1].trim() + " 23:59:59");
		}
		where.append(" order by id  ");
		Page<Userinfo> pager = Userinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20),
				where.toString(), param.toArray());
		List<Userinfo> articlesList = pager.getList();
		setAttr("blogPage", articlesList);
		setAttr("pager", pager);
		render("/sys/user.jsp");
	}

	public void add() {
		render("/sys/user_ope.jsp");
	}

	public void insert() {
		String username = getPara("username");
		String realtname = getPara("realtname");
		String password = MD5base.md5Digest("111111");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String ope =  getPara("roleID");
		String captain = getPara("captain");  
		String groupID = getPara("groupID");
		String addtime = DateUtil.getDateStringBySeparator();
		String id =Userinfo.dao.insert(username, password, realtname, numbercard,phone, email, ope, addtime,groupID);

		if(!groupID.equals("-1")){
		if(captain.equals("1"))//设置队长id 更新队长id 和人数
		{
			Groupinfo.dao.update_gname(groupID,id);
		}else
		{
			Groupinfo.dao.update_gname(groupID);
		}
		}
		 if(id.length()>0&&!id.equals("")){
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/user\"}");
		 }
	}

	public void edit() {
		setAttr("user", Userinfo.dao.findById(getPara("id")));
		render("/sys/user_ope.jsp");

	}

	public void delete() {
	String id=getPara("id");
	Userinfo userinfo = Userinfo.dao.findById(id);
	Usermessagerinfo umsinfo= Usermessagerinfo.dao.findById(id);
		if (userinfo.set("fid", umsinfo.get("fid").toString()).update()&&umsinfo.set("role", userinfo.get("role").toString()).update()) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true,   \"forward\":\"/user\"}");
		}
	}

	public void update() {
		String id = getPara("id");
		String username = getPara("username");
		String realtname = getPara("realtname");
		String numbercard = getPara("numbercard");
		String phone = getPara("phone");
		String email = getPara("email");
		String ope = getPara("roleID");
		String captain = getPara("captain");
		String groupID = getPara("groupID");
		if(!groupID.equals("-1")){
		if(captain.equals("1"))//设置队长id 更新队长id 和人数
		{
			Groupinfo.dao.update_gname(groupID,id);
		}else
		{
			Groupinfo.dao.update_gname(groupID);
		}
		}
		if (Userinfo.dao.update(id, username, realtname, numbercard, phone,
				email, ope,groupID)) {
			renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"tabid\":\"table, table-fixed\",\"closeCurrent\":true, \"forward\":\"/user\"}");
		}
	}

}
