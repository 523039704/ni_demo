package com.basic.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 加载配置文件
 * 
 * @author Administrator
 * 
 */
public class SMSProperties {
	private static SMSProperties loadProp = null;
	private static Properties prop;
	static {
		loadProp = new SMSProperties();
		InputStream in = loadProp.getClass().getResourceAsStream("/sms_config.properties");
		prop = new Properties();
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String getProperty(String key) {
		return prop.getProperty(key);
	}
	
	 
}
