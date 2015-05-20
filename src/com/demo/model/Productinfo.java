package com.demo.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Productinfo extends Model<Productinfo> {
	public static Productinfo dao = new Productinfo();

	public Page<Productinfo> paginate(int pageNumber, int pageSize,
			String where, Object[] objects) {
		return paginate(pageNumber, pageSize, "select *",
				"from product where 1=1 " + where, objects);
	}

	// id, name, begindate,enddate, datetime, price,
	// address, upe,information

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
