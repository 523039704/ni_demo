package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Groupinfo extends Model<Groupinfo> {

	public static Groupinfo dao = new Groupinfo();

	public Page<Groupinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `group` where 1=1 ");
	}

	public boolean insert(String id, String name) {
		return Groupinfo.dao.set("id", id).set("name", name).save();
	}

	public boolean update(String id, String name) {
		return Groupinfo.dao.findById(id).set("name", name).update();
	}

	public boolean ids(String id) {
		boolean messager = false;
		if (Groupinfo.dao.findFirst("select * from `group` where id='" + id
				+ "'") == null) {
			messager = true;
		}
		return messager;
	}

	public boolean update_gname(String id, String groupid) {
		System.out.println(id);
		System.out.println(groupid);
		int people = Groupinfo.dao.findById(id).getInt("people") + 1;
		return Groupinfo.dao.findById(id).set("groupid", groupid)
				.set("people", people).update();
	}

	public boolean update_gname(String id) {
		int people = Groupinfo.dao.findById(id).getInt("people") + 1;
		return Groupinfo.dao.findById(id).set("people", people).update();

	}

}
