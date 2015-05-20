package com.demo.model;

import com.basic.util.DateUtil;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Orderinfo extends Model<Orderinfo> {
	public static Orderinfo dao = new Orderinfo();

	public Page<Orderinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `order` where 1=1 ");
	}

	public Page<Orderinfo> performance(int pageNumber, int pageSize, String where,
			Object[] objects) {
		return paginate(pageNumber, pageSize, "select  id, nickname,createdatetime,ptoducti,productid,sum(montey)as montey ,businessid,agentid,filialeid",
				"from `order` where 1=1 and  status=1 "+ where, objects);
	}

	public boolean insert(String username, String ope, String id, String price,
			String status, String uid, String role) {
		// 用产品id 去查自己需要的信息 ，用业务员id去查询需要的信息
		Userinfo user = Userinfo.dao.findById(uid);
		Productinfo.dao.findById(id);
		return Orderinfo.dao
				.set("nickname", username)
				.set("createdatetime", DateUtil.getDateStringBySeparator())
				.set("ptoducti", ope)
				.set("productid", id)
				.set("montey", price)
				.set("serviceid",Roleinfo.dao.findById(role).get("serve").toString())
				.set("status", status).set("businessid", uid)
				.set("agentid", user.get("fid").toString())
				.set("filialeid", user.get("gfid").toString()).save();
	}

}
