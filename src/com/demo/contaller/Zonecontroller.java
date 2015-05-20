package com.demo.contaller;

import com.demo.model.Areainfo;
import com.demo.model.Cityinfo;
import com.jfinal.core.Controller;

public class Zonecontroller extends Controller {

	
	public void city()
	{
		renderJson(Cityinfo.dao.see_city(getPara("id")));
	}
	public void area()
	{
		renderJson(Areainfo.dao.see_area(getPara("id")));
	}
	
}
