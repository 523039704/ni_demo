package com.demo.contaller;

import com.demo.model.Courseinfo;
import com.jfinal.core.Controller;

public class Coursecontroller extends Controller {
	public void index()
	{
		setAttr("course", Courseinfo.dao.paginate(getParaToInt(0, 1), 10));
		render("/sys/course.jsp");
	}

	public void add()
	{
		render("/sys/course_ope.jsp");
	}
}
