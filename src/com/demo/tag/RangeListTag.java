package com.demo.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.demo.model.Rangeinfo;
 
 
@SuppressWarnings("serial")
public class RangeListTag extends TagSupport {

	public int doStartTag() {
		JspWriter out = pageContext.getOut();
		
		List<Rangeinfo> Infos = new ArrayList<Rangeinfo>();
		Infos = Rangeinfo.dao.find("select * from `range`  ");
		try {
			out.println("  <option value=\"-1\">金额列表</option>");
			for (int i = 0; i < Infos.size(); i++) {
				out.println("  <option value=\"" + Infos.get(i).get("id")
						+ "\"  >" + Infos.get(i).get("amount_min")+"至" + Infos.get(i).get("amount_max")+ "</option>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return EVAL_BODY_INCLUDE;
	}
	
}
