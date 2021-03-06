package com.demo.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.demo.model.Groupinfo;
 
 
@SuppressWarnings("serial")
public class GroupListTag extends TagSupport {

	public int doStartTag() {
		JspWriter out = pageContext.getOut();
		
		List<Groupinfo> Infos = new ArrayList<Groupinfo>();
		Infos = Groupinfo.dao.find("select * from `group`  ");
		try {
			out.println("<select name=\"groupID\" id=\"groupID\"    =\"selectpicker\" data-rule=\"required\"  >");
			out.println("  <option value=\"-1\">分组列表</option>");
			for (int i = 0; i < Infos.size(); i++) {
				out.println("  <option value=\"" + Infos.get(i).get("id")
						+ "\"  >" + Infos.get(i).get("name")+ "</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return EVAL_BODY_INCLUDE;
	}
	
}
