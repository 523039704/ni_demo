package com.demo.model;

import com.basic.util.MD5;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Userinfo extends Model<Userinfo> {
	public static Userinfo dao = new Userinfo();

	public boolean login(String username, String password) {
		boolean messager = false;
		Userinfo user = Userinfo.dao
				.findFirst("select * from admin where adminname='" + username
						+ "' and password ='" + MD5.md5Digest(password) + "'");
		if (user != null) {
			messager = true;
		}
		return messager;
	}

	public Userinfo see_role(String username, String password) {
		 

		return Userinfo.dao
				.findFirst("select * from admin where adminname='" + username
						+ "' and password ='" + MD5.md5Digest(password) + "'");
	}

	public boolean see_name(String username)// 用户登录成功
	{
		boolean messager = true;
		if (Userinfo.dao.findFirst("select * from admin where adminname='"
				+ username + "'") == null) {
			messager = false;
		}
		return messager;
	}

	public Page<Userinfo> paginate(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select *",
				"from admin where 1=1 " + where, objects);
	}

	public boolean insert(String username, String password, String realname,
			String numbercard, String phone, String email, String ope,
			String addtime) {
		return Userinfo.dao.set("adminname", username)
				.set("password", password).set("realname", realname)
				.set("numbercard", numbercard).set("phone", phone)
				.set("email", email).set("ope", ope).set("add_time", addtime)
				.save();
	}

	public boolean update(String id, String username, String realtname,
			String numbercard, String phone, String email, String ope,String groupID) {

		return Userinfo.dao.findById(id).set("adminname", username)
				.set("realname", realtname).set("numbercard", numbercard)
				.set("phone", phone).set("email", email).set("ope", ope).set("groupid", groupID)
				.update();
	}
}
