package com.basic.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexChk {

	/**
	 *  java  后台判断的正则的集合
	 * @param string
	 * @return  liu
	 */
	public  boolean startCheck( String rec ,String string) {
		boolean tem = false;
		Pattern pattern = Pattern.compile(rec);
		Matcher matcher = pattern.matcher(string);

		tem = matcher.matches();
		return tem;
	}
	/**
	 *  判断 用户输入的数据是否合法
	 * @param nr  用户输入的数据
	 * @return liu
	 */
	public boolean checkNr(String nr) {
		String reg = "^[\\u4e00-\\u9fa5a-zA-Z][\\u4e00-\\u9fa5a-zA-Z0-9\\_\\-]*$";
		return startCheck(reg, nr);
	}
	
	
}
