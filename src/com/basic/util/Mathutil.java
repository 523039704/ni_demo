package com.basic.util;

import java.math.BigDecimal;

public class Mathutil

{

	// 默认除法运算精度

	private static final int DEFAULT_DIV_SCALE = 10;

	/**
	 * 
	 * 提供精确的加法运算。
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的和
	 */

	public static double add(double v1, double v2)

	{

		BigDecimal b1 = new BigDecimal(Double.toString(v1));

		BigDecimal b2 = new BigDecimal(Double.toString(v2));

		return b1.add(b2).doubleValue();

	}

	/**
	 * 
	 * 提供精确的加法运算
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数数学加和，以字符串格式返回
	 */

	public static String add(String v1, String v2)

	{

		BigDecimal b1 = new BigDecimal(v1);

		BigDecimal b2 = new BigDecimal(v2);

		return b1.add(b2).toString();

	}

	/**
	 * 
	 * 提供精确的减法运算。
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的差
	 */

	public static double subtract(double v1, double v2)

	{

		BigDecimal b1 = new BigDecimal(Double.toString(v1));

		BigDecimal b2 = new BigDecimal(Double.toString(v2));

		return b1.subtract(b2).doubleValue();

	}

	/**
	 * 
	 * 提供精确的减法运算
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数数学差，以字符串格式返回
	 */

	public static String subtract(String v1, String v2)

	{

		BigDecimal b1 = new BigDecimal(v1);

		BigDecimal b2 = new BigDecimal(v2);

		return b1.subtract(b2).toString();

	}

	/**
	 * 
	 * 提供精确的乘法运算。
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的积
	 */

	public static double multiply(double v1, double v2)

	{

		BigDecimal b1 = new BigDecimal(Double.toString(v1));

		BigDecimal b2 = new BigDecimal(Double.toString(v2));

		return b1.multiply(b2).doubleValue();

	}

	/**
	 * 
	 * 提供精确的乘法运算
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的数学积，以字符串格式返回
	 */

	public static String multiply(String v1, String v2)

	{

		BigDecimal b1 = new BigDecimal(v1);

		BigDecimal b2 = new BigDecimal(v2);

		return b1.multiply(b2).toString();

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到
	 * 
	 * 小数点以后10位，以后的数字四舍五入,舍入模式采用ROUND_HALF_EVEN
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的商
	 */

	public static double divide(double v1, double v2)

	{

		return divide(v1, v2, DEFAULT_DIV_SCALE);

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	 * 
	 * 定精度，以后的数字四舍五入。舍入模式采用ROUND_HALF_EVEN
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @param scale
	 *            表示需要精确到小数点以后几位。
	 * 
	 * @return 两个参数的商
	 */

	public static double divide(double v1, double v2, int scale)

	{

		return divide(v1, v2, scale, BigDecimal.ROUND_HALF_EVEN);

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	 * 
	 * 定精度，以后的数字四舍五入。舍入模式采用用户指定舍入模式
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @param scale
	 *            表示需要精确到小数点以后几位
	 * 
	 * @param round_mode
	 *            表示用户指定的舍入模式
	 * 
	 * @return 两个参数的商
	 */

	public static double divide(double v1, double v2, int scale, int round_mode) {

		if (scale < 0)

		{

			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");

		}

		BigDecimal b1 = new BigDecimal(Double.toString(v1));

		BigDecimal b2 = new BigDecimal(Double.toString(v2));

		return b1.divide(b2, scale, round_mode).doubleValue();

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到
	 * 
	 * 小数点以后10位，以后的数字四舍五入,舍入模式采用ROUND_HALF_EVEN
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @return 两个参数的商，以字符串格式返回
	 */

	public static String divide(String v1, String v2)

	{

		return divide(v1, v2, DEFAULT_DIV_SCALE);

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	 * 
	 * 定精度，以后的数字四舍五入。舍入模式采用ROUND_HALF_EVEN
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @param scale
	 *            表示需要精确到小数点以后几位
	 * 
	 * @return 两个参数的商，以字符串格式返回
	 */

	public static String divide(String v1, String v2, int scale)

	{

		return divide(v1, v2, DEFAULT_DIV_SCALE, BigDecimal.ROUND_HALF_EVEN);

	}

	/**
	 * 
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指
	 * 
	 * 定精度，以后的数字四舍五入。舍入模式采用用户指定舍入模式
	 * 
	 * @param v1
	 * 
	 * @param v2
	 * 
	 * @param scale
	 *            表示需要精确到小数点以后几位
	 * 
	 * @param round_mode
	 *            表示用户指定的舍入模式
	 * 
	 * @return 两个参数的商，以字符串格式返回
	 */

	public static String divide(String v1, String v2, int scale, int round_mode)

	{

		if (scale < 0)
		{
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		}

		BigDecimal b1 = new BigDecimal(v1);
		BigDecimal b2 = new BigDecimal(v2);
		return b1.divide(b2, scale, round_mode).toString();

	}
	 
	/**
	 * 提供精确的小数位四舍五入处理,舍入模式采用ROUND_HALF_EVEN
	 * @param v 需要四舍五入的数字
	 * @param scale  小数点后保留几位
	 * @return 四舍五入后的结果
	 */

	public static double round(double v, int scale)

	{

		return round(v, scale, BigDecimal.ROUND_HALF_EVEN);

	}
	
	
	public static  String   income(String price,String longtime,String income)
	{
		String income_day=Mathutil.divide(income, "365",2);
		String income_qi=Mathutil.round(Mathutil.multiply(price, longtime),2);
		return Mathutil.round( Mathutil.multiply(income_qi, income_day),2);
	}
	
	/**
	 * 
	 * 提供精确的小数位四舍五入处理
	 * 
	 * @param v
	 *            需要四舍五入的数字
	 * 
	 * @param scale
	 *            小数点后保留几位
	 * 
	 * @param round_mode
	 *            指定的舍入模式
	 * 
	 * @return 四舍五入后的结果
	 */

	public static double round(double v, int scale, int round_mode)

	{

		if (scale < 0)

		{

			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");

		}

		BigDecimal b = new BigDecimal(Double.toString(v));

		return b.setScale(scale, round_mode).doubleValue();

	}

	/**
	 * 
	 * 提供精确的小数位四舍五入处理,舍入模式采用ROUND_HALF_EVEN
	 * 
	 * @param v
	 *            需要四舍五入的数字
	 * 
	 * @param scale
	 *            小数点后保留几位
	 * 
	 * @return 四舍五入后的结果，以字符串格式返回
	 */

	public static String round(String v, int scale)

	{

		return round(v, scale, BigDecimal.ROUND_HALF_EVEN);

	}

	/**
	 * 
	 * 提供精确的小数位四舍五入处理
	 * 
	 * @param v
	 *            需要四舍五入的数字
	 * 
	 * @param scale
	 *            小数点后保留几位
	 * 
	 * @param round_mode
	 *            指定的舍入模式
	 * 
	 * @return 四舍五入后的结果，以字符串格式返回
	 */

	public static String round(String v, int scale, int round_mode)

	{
		if (scale < 0) {
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(v);

		return b.setScale(scale, round_mode).toString();

	}
	
	/**
	 * 四舍五入
	 * @param v  具体的数字
	 * @param num 舍到具体的位数
	 * @return 返回值
	 */
	public String doubleOutPut(double v, Integer num) {
		if (v == Double.valueOf(v).intValue())
			return Double.valueOf(v).intValue() + "";
		else {
			BigDecimal b = new BigDecimal(Double.toString(v));
			return b.setScale(num, BigDecimal.ROUND_HALF_UP).toString();
		}

	}

	

}

// 小示例
//
// //如何判断一个Double数如果有小数为的话保留相应的位数，如果无小数位则返回整数？
// /*例如：public String round(double v,int num){
// }
// v是要计算的数,num是保留的位数
// 例如传:12.123,2 则返回12.12 传12 则返回12
// 传12.123,3 则返回12.123 谢谢!
// */
//

