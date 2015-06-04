package com.demo.model;

import com.basic.util.MD5;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Userinfo extends Model<Userinfo> {
	public static Userinfo dao = new Userinfo();
	/**
	 * 登陆
	 * @param username  用户名
	 * @param password 密码
	 * @return  true or false
	 */
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
	/**
	 *  查看用户基本信息
	 * @param username 用户名
	 * @param password 密码
	 * @return Userinfo
	 */
	public Userinfo see_role(String username, String password) {
		 

		return Userinfo.dao
				.findFirst("select * from admin where adminname='" + username
						+ "' and password ='" + MD5.md5Digest(password) + "'");
	}
	/**
	 * 是否由此用户
	 * @param username  用户名
	 * @return  true or false
	 */
	public boolean see_name(String username)// 用户登录成功
	{
		boolean messager = true;
		if (Userinfo.dao.findFirst("select * from admin where adminname='"
				+ username + "'") == null) {
			messager = false;
		}
		return messager;
	}
	/**
	 * 分页
	 * @param pageNumber 页码
	 * @param pageSize 长度
	 * @param where 条件
	 * @param objects 条件信息
	 * @return 分页信息
	 */
	public Page<Userinfo> paginate(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select *",
				"from admin where 1=1 " + where, objects);
	}
	/**
	 *  插入信息
	 * @param username 用户名
	 * @param password 密码
	 * @param realname 真实姓名
	 * @param numbercard 身份号码
	 * @param phone 电话
	 * @param emai 邮箱
	 * @param ope 角色
	 * @param addtime  注册时间
	 * @return  true or false
	 */
	public String insert(String username, String password, String realname,
			String numbercard, String phone, String email, String ope,
			String addtime,String groupID) {
		
		
		
		Record user = new Record().set("adminname", username)
				.set("password", password).set("realname", realname)
				.set("numbercard", numbercard).set("phone", phone)
				.set("email", email).set("role", ope).set("add_time", addtime).set("groupid", groupID);
		Db.save("admin", user);
		return user.get("id").toString();
		
		 
	}
	/**
	 *  更新操作
	 * @param id 唯一id
	 * @param username 用户名
	 * @param realtname 真实姓名
	 * @param numbercard 身份证号
	 * @param phone  电话
	 * @param email 邮箱
	 * @param ope 角色
	 * @param groupID 分组地
	 * @return  true  or  false
	 */
	public boolean update(String id, String username, String realtname,
			String numbercard, String phone, String email, String ope,String groupID) {

		return Userinfo.dao.findById(id).set("adminname", username)
				.set("realname", realtname).set("numbercard", numbercard)
				.set("phone", phone).set("email", email).set("role", ope).set("groupid", groupID)
				.update();
	}
	/**
	 * 验证旧密码
	 * @param uid  用户id 
	 * @param oldpassword  旧密码
	 * @return true  or  false
	 */
	public boolean oldpassword(String uid,String oldpassword)
	{ 
		boolean messager = false;
		if(Userinfo.dao.findById(uid).get("password").toString().equals(MD5.md5Digest(oldpassword)))
		{
			messager=true;
		}
		return messager;
	}
	/**
	 * 更新新密码
	 * @param uid  用户id
	 * @param newpassword  新密码
	 * @return true  or  false
	 */
	public boolean changerpassword(String uid,String newpassword)
	{
		return Userinfo.dao.findById(uid).set("password", MD5.md5Digest(newpassword)).update();
	}
}
