package com.demo.model;

import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class Usermessagerinfo extends Model<Usermessagerinfo> {
	public static Usermessagerinfo dao = new Usermessagerinfo();

	public boolean insert(String uid, String subscribe, String nickname,
			String sex, String language, String city, String province,
			String country, String headimgurl, String subscribe_time,
			String remark, String groupid,String fid) {

		return Usermessagerinfo.dao.set("user_id", uid)
				.set("subscribe", subscribe).set("nickname", nickname)
				.set("sex", sex).set("language", language).set("city", city)
				.set("province", province).set("country", country)
				.set("headimgurl", headimgurl)
				.set("subscribe_time", subscribe_time).set("remark", remark)
				.set("groupid", groupid).set("fid", fid).save();
	}

	public boolean update_messager(String uid, String numbercard, String phone,
			String email, String address) {
		return Usermessagerinfo.dao.findById(uid).set("numbrcard", numbercard)
				.set("phone", phone).set("email", email)
				.set("address", address).update();
	}

}
