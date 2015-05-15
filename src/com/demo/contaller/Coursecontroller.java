package com.demo.contaller;

import java.util.List;

import com.demo.model.Courseinfo;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

public class Coursecontroller extends Controller {
	public void index()
	{	Page<Courseinfo> pager=Courseinfo.dao.paginate(getParaToInt("pageCurrent", 1),
			getParaToInt("pageSize", 20));
		List<Courseinfo> articlesList = pager.getList();
		setAttr("course",articlesList );
		setAttr("pager", pager);
		render("/sys/course.jsp");
	}

	public void add()
	{
		render("/sys/course_ope.jsp");
	}
}
