package com.demo.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.demo.model.Roleinfo;
 
 
@SuppressWarnings("serial")
public class RoleListTag extends TagSupport {

	public int doStartTag() {
		JspWriter out = pageContext.getOut();
		String role=pageContext.getSession().getAttribute("role").toString();
		List<Roleinfo> Infos = new ArrayList<Roleinfo>();
		Infos = Roleinfo.dao.find("select * from role where id>'"+role+"'");
		try {
			out.println("<select name=\"roleID\" id=\"roleID\"    =\"selectpicker\" data-rule=\"required\"  >");
			out.println("  <option value=\"-1\">角色列表</option>");
			for (int i = 0; i < Infos.size(); i++) {
				out.println("  <option value=\"" + Infos.get(i).get("id")
						+ "\"  >" + Infos.get(i).get("social").toString() + "</option>");
			}
			out.println("</select>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return EVAL_BODY_INCLUDE;
	}
	
}
