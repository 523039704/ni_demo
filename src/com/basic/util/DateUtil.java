package com.basic.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class DateUtil {
	public static SimpleDateFormat DefaultDateFormat = null;
	public static SimpleDateFormat DefaultDateFormatSeparator = null;

	/**
	 * 生成时间戳
	 * @return 返回系统当前时间(格式 yyyyMMddHHmmssSSS)
	 */
	public static String makeTimestamp() {
		try {
			if (DefaultDateFormat == null) DefaultDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");  
			return DefaultDateFormat.format(new Date());
		} catch (Exception ex) {
			return null;
		}
	}
	 
	/**
	 * 生成时间戳,并加入2位随机数,1位和校验
	 * @return 返回系统当前时间(格式 yyyyMMddHHmmssSSSrrC)
	 */
	public static String makeTimestampExt() {
		String temp = makeTimestamp();
		
		Random random = new Random();
        //random.setSeed(System.currentTimeMillis());
        String randStr = String.valueOf(random.nextInt(100));
        if (randStr.length() == 1) randStr = "0" + randStr;
        temp += randStr;
        //
        char[] buff = temp.toCharArray();
        int CharCount = 0;
        for (int i=0; i<buff.length; i++) CharCount += (buff[i] - '0');
        CharCount %= 10;
        temp += String.valueOf(CharCount);
        return temp;
	}
	/**
	 * 格式化时间戳为yyyy-MM-dd HH:mm:ss格式时间
	 * @return 
	 */
	public static String makeLongTime(Long time) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date(time);
		return sdf.format(d);
		
	} 
	/**
	 * 获取当前系统时间字符串(带分隔符)
	 * @return 返回系统当前时间(格式 yyyy-MM-dd HH:mm:ss)
	 */
	public static String getDateStringBySeparator() {
		try {
			if (DefaultDateFormatSeparator == null) DefaultDateFormatSeparator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			return DefaultDateFormatSeparator.format(new Date());
		} catch (Exception ex) {
			return null;
		}
	}
	
	/**
	 * 获取当前系统时间字符串(带分隔符)
	 * @param date 指定日期
	 * @return 返回指定时间的字符串格式(格式 yyyy-MM-dd HH:mm:ss)
	 */
	public static String getDateStringBySeparator(Date date) {
		try {
			if (DefaultDateFormatSeparator == null) DefaultDateFormatSeparator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			return DefaultDateFormatSeparator.format(date);
		} catch (Exception ex) {
			return null;
		}
	}
	
	
	/**
	 * 获取当前系统时间字符串(带分隔符)
	 * @param date 指定日期
	 * @return 返回指定时间的字符串格式(格式 yyyy-MM-dd HH:mm:ss)
	 */
	public static String getDateStringBySeparator_date(Date date) {
		try {
			if (DefaultDateFormatSeparator == null) DefaultDateFormatSeparator = new SimpleDateFormat("yyyy-MM-dd");  
			return DefaultDateFormatSeparator.format(date);
		} catch (Exception ex) {
			return null;
		}
	}
	
	/**
	 * 获取指定格式的当前系统时间字符串
	 * @param FormatString 格式化字符串(例如 yyyy-MM-dd HH:mm:ss)
	 * @return 返回指定格式的系统当前时间
	 */
	public static String getDateStringByFormst(String FormatString) {
		try {
			return new SimpleDateFormat(FormatString).format(new Date());
		} catch (Exception ex) {
			return null;
		}
	}
	
	public static Date getDateByString(String source, String FormatString) {
		if (source == null || source.length() <=0) return null;
		try {
			SimpleDateFormat format = new SimpleDateFormat(FormatString);
			return format.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取指定格式的当前系统时间字符串
	 * @param FormatString 格式化字符串(例如 yyyy-MM-dd HH:mm:ss)
	 * @param date 要格式化的日期
	 * @return 返回指定格式指定时间的字符串
	 */
	public static String getDateStringByFormst(String FormatString,Date date) {
		try {
			return new SimpleDateFormat(FormatString).format(date);
		} catch (Exception ex) {
			return null;
		}
	}
	
	/**
	 * 获取指定格式的当前系统时间字符串
	 * @param FormatString 格式化字符串(例如 yyyy-MM-dd HH:mm:ss)
	 * @param DateString 要格式化的日期
	 * @return 返回指定格式指定时间的字符串
	 */
	public static String getDateStringByFormst(String FormatString,String DateString) {
		try {
			return new SimpleDateFormat(FormatString).format(DateString);
		} catch (Exception ex) {
			return null;
		}
	}
	
	public static Date getNowDateByAdd(int year,int month,int day,int hour) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.YEAR, year);
		calendar.add(Calendar.MONTH, month);
		calendar.add(Calendar.DAY_OF_YEAR, day);
		calendar.add(Calendar.HOUR_OF_DAY, hour);
		return calendar.getTime();
	}
	
	public static Date getNowDateByAdd(String stringdate,String day) {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Date date = null;
		try {
			date = sdf.parse(stringdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, 0);
		calendar.add(Calendar.MONTH, 0);
		calendar.add(Calendar.DAY_OF_YEAR, Integer.parseInt(day));
		return calendar.getTime();
	}
	public static Date getNowDateByhout(Date date,int hour) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.HOUR_OF_DAY, hour);
		return calendar.getTime();
	}
	
	
	 public static boolean  get(String appindatetime) {
		 boolean susses=false;
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date = null;
		 try {
			  date = sdf.parse(appindatetime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 Date d1 =	DateUtil.getNowDateByhout(date, 8);
		 Date d2 = new Date();	
		 long diff = d2.getTime() - d1.getTime();
		 if(diff>0 )
		 {
    	
			 susses=true;
    		
		 	}
		 return susses;
	 	}
	 
	 
	  public static boolean compare_date(String DATE1, String DATE2) {
	        
		  boolean messager=false;
		  
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime()<=dt2.getTime()) { 
	                 messager=true;
	            } 
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return messager;
	    }
	 
	 
	 
	public static int getLastDayByMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	public static int getFirstDayByMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getActualMinimum(Calendar.DAY_OF_MONTH);
	}
}