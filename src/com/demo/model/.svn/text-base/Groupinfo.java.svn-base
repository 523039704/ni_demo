package com.demo.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Groupinfo extends Model<Groupinfo> {

	public static Groupinfo dao = new Groupinfo();
    /**
     * 设置分组 分页
     * @param pageNumber  当前页码
     * @param pageSize 长度
     * @return 分页内容
     */
	public Page<Groupinfo> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from `group` where 1=1 ");
	}
    /**
     * 插入 分组
     * @param id 分组id
     * @param name 组名
     * @return true or  fales
     */
	public boolean insert(String id, String name) {
		return Groupinfo.dao.set("id", id).set("name", name).save();
	}
    /**
     *  更新分组
     * @param id 分组id
     * @param name 名字
     * @return true or  fales
     */
	public boolean update(String id, String name) {
		return Groupinfo.dao.findById(id).set("name", name).update();
	}
    /**
     * 查询id  是否使用
     * @param id 唯一id
     * @return true or  fales
     */
	public boolean ids(String id) {
		boolean messager = false;
		if (Groupinfo.dao.findFirst("select * from `group` where id='" + id
				+ "'") == null) {
			messager = true;
		}
		return messager;
	}
    /**
     * 更新分组信息
     * @param id  唯一id
     * @param groupid  组长id
     * @return  true or  fales
     */
	public boolean update_gname(String id, String groupid) {
		int people = Groupinfo.dao.findById(id).getInt("people") + 1;
		return Groupinfo.dao.findById(id).set("groupid", groupid)
				.set("people", people).update();
	}
    /**
     * 更新增加人数 自动添加
     * @param id  唯一id
     * @return true or  fales
     */
	public boolean update_gname(String id) {
		int people = Groupinfo.dao.findById(id).getInt("people") + 1;
		return Groupinfo.dao.findById(id).set("people", people).update();

	}

}
