package com.demo.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Productinfo extends Model<Productinfo> {
	public static Productinfo dao = new Productinfo();
	/**
	 * 产品分页
	 * @param pageNumber 页码
	 * @param pageSize 长度
	 * @param where 条件
	 * @param objects 条件信息
	 * @return 分页内容
	 */
	public Page<Productinfo> paginate(int pageNumber, int pageSize,
			String where, Object[] objects) {
		return paginate(pageNumber, pageSize, "select *",
				"from product where 1=1 " + where, objects);
	}

	// id, name, begindate,enddate, datetime, price,
	// address, upe,information
	/**
	 *  更新信息
	 * @param id 唯一id
	 * @param name 产品名字
	 * @param begindate 开始日期
	 * @param enddate 结束时间
	 * @param datetime 多久
	 * @param price 金额
	 * @param address 地址
	 * @param upe  推荐标示
	 * @param information  产品详情
	 * @return true or  fales
	 */
	public boolean update(String id, String name, String begindate,
			String enddate, String datetime, String price, String address,
			String upe, String information) {
		// TODO Auto-generated method stub
		return Productinfo.dao.findById(id).set("name", name)
				.set("begindate", begindate).set("enddate", enddate)
				.set("longtime", datetime).set("small_mony", price)
				.set("addressid", address).set("upe", upe)
				.set("information", information).update();
	}
	/**
	 * 插入信息
	 * @param name  产品名称
	 * @param begindate 开始时间
	 * @param enddate 结束时间
	 * @param datetime 时长
	 * @param price 金额
	 * @param address 地址
	 * @param upe 推荐标识
 	 * @param information  产品信息
	 * @return 返回id信息
	 */
	public String insert(String name, String begindate, String enddate,
			String datetime, String price, String address, String upe,
			String information) {
		// Productinfo.dao
		Record product = new Record().set("name", name)
				.set("begindate", begindate).set("enddate", enddate)
				.set("longtime", datetime).set("small_mony", price)
				.set("addressid", address).set("upe", upe)
				.set("information", information);
		Db.save("product", product);
		return product.get("id").toString();
	}

}
