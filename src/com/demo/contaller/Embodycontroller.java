package com.demo.contaller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.basic.util.DateUtil;
import com.demo.model.Embodyinfo;
import com.demo.model.Userinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Embodycontroller extends Controller {
	public void index() {
		String uid = getSession().getAttribute("userid").toString();
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		where.append(" and fid=?   ");
		param.add(uid);
		Page<Embodyinfo> pager = Embodyinfo.dao.paginate(
				getParaToInt("pageCurrent", 1), getParaToInt("pageSize", 20),
				where.toString(), param.toArray());
		List<Embodyinfo> articlesList = pager.getList();
		setAttr("embody", articlesList);
		setAttr("pager", pager);
		render("/sys/embody.jsp");

	}

	public void embody_add() {// 存在时间和角色的问题 需不需要进行时间的比对 现在取款的时间是是否到了期限日期
								// 或者过了期限日期呢，还有角色问题：同一笔款分公司未领取代理商是否能领取呢？

		String role = getSession().getAttribute("role").toString();
		String uid = getSession().getAttribute("userid").toString();
		String fid = Userinfo.dao.findById(uid).get("fid").toString();
		String price = getPara("price");
		String time = getPara("time");
		String id = getPara("id");
		if (DateUtil.compare_date(time,	DateUtil.getDateStringBySeparator_date(new Date()))) {

			if (Embodyinfo.dao.see_id(id, uid)) {
				if (Embodyinfo.dao.add(uid, role, fid, price, id)) {
					renderJson("{\"statusCode\":\"200\",\"message\":\"\u64cd\u4f5c\u6210\u529f\",\"closeCurrent\":true,\"forward\":\"/order/performance\"}");
				}
			} else {
				renderJson("{\"statusCode\":\"300\",\"message\":\"请不要重复提交信息！！\",\"closeCurrent\":false}");
			}

		} else {
			renderJson("{\"statusCode\":\"300\",\"message\":\"预约时间未到，不能提现！！\",\"closeCurrent\":false}");
		}
	}

	public void edit() {
		setAttr("embody",Embodyinfo.dao.findFirst("select * from embody e  where id='"	+ getPara("id") + "'"));
		render("/sys/embody_ope.jsp");
	}

	public void update_embody() {

	}
}
