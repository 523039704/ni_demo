package com.demo.model;

import com.basic.util.DateUtil;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Orderinfo extends Model<Orderinfo> {
	public static Orderinfo dao = new Orderinfo();
    /**
     *  数据分页
     * @param pageNumber  页码
     * @param pageSize 长度
     * @return 分页内容
     */
	public Page<Orderinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `order` where 1=1 ");
	}
	/**
	 *  数据有条件分页
	 * @param pageNumber  页码
	 * @param pageSize 长度
	 * @param where 条件
	 * @param objects 条件的信息
	 * @return 分页内容
	 */
	public Page<Orderinfo> performance(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select  id, nickname,ptoducti,productid,sum(montey)as montey  ,businessid,sum(business)as business ,agentid,sum(agent)as agent,filialeid,sum(filiale)as filiale,sum(admin)as admin,overdate",
				"from `order` where 1=1 and  status=1 "+ where, objects);
	}
	/**
	 * 数据插入
	 * @param username  用户名
	 * @param ope 类型
	 * @param id 产品id
	 * @param price 金额
	 * @param status 状态
	 * @param uid 业务员id
	 * @param overdatetime2 
	 * @param role 角色
	 * @return true or  fales
	 */
	public boolean insert(String username, String ope, String id, String price,
			String status, String uid, String admin,String filiale,String agent,String business,String longtime,String income,String orderid, String overdatetime) {
		// 用产品id 去查自己需要的信息 ，用业务员id去查询需要的信息
		Userinfo user = Userinfo.dao.findById(uid);
		Productinfo.dao.findById(id);
		return Orderinfo.dao
				.set("nickname", username)
				.set("createdatetime", DateUtil.getDateStringBySeparator())
				.set("ptoducti", ope).set("productid", id).set("montey", price)
				.set("admin", admin).set("filiale", filiale).set("agent", agent).set("business", business).set("longtime", longtime).set("income", income).set("orderid", orderid).set("overdate", overdatetime)
				.set("status", status).set("businessid", uid)
				.set("agentid", user.get("fid").toString())
				.set("filialeid", user.get("gfid").toString()).remove("id").save();
	}
	public boolean insert_wx( String id, String cid,String price,
			String status, String uid, String admin,String filiale,String agent,String business,String orderid) {
		// 用产品id 去查自己需要的信息 ，用业务员id去查询需要的信息
		Userinfo user = Userinfo.dao.findById(id);
		System.out.println(user);
		System.out.println(uid);
		Productinfo.dao.findById(cid);
		return Orderinfo.dao
				.set("nickname", user.get("adminname").toString())
				.set("createdatetime", DateUtil.getDateStringBySeparator())
				.set("ptoducti", "2").set("productid", cid).set("montey", price)
				.set("admin", admin).set("filiale", filiale).set("agent", agent).set("business", business).set("orderid", orderid)
				.set("status", status).set("businessid", uid).set("userid", id)
				.set("agentid", user.get("fid").toString())
				.set("filialeid", user.get("gfid").toString()).remove("id").save();
	}
	
	public boolean update_orderid(String orderid,String orderdatetime) {
		String  id= Orderinfo.dao.findFirst("select * from  `order` where orderid='"+orderid+"'").get("id").toString();
		return Orderinfo.dao.findById(id).set("status", "0").set("orderdatetime", orderdatetime).update();
	}
	
}
