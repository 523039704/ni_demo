<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.3.2.min.js" language="javascript"
	type="text/javascript"></script>
</head>

<body>
<div class="mtitle">
  <h1>添加会员</h1>
</div>

	<form method="post"
		action="${pageContext.request.contextPath}/product/insert">
		<input type='hidden' name='dopost' value='listArchives' />
		<table width='100%' border='0' cellpadding='1' cellspacing='1'
			align="center" style="margin-top: 8px">
			<tr bgcolor='#f8f8f8'>
				<td align='center'>
					<table border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='90' align='center'>产品名称</td>
							<td width='160'>
						             	<input type="text" class="input" id="username" name="username" size="50" placeholder="课程名称" data-validate="required:请填写课程名称" />
								</td>
						</tr>

						<tr>
							<td width='90' align='center'>起购日期</td>
							<td width='160'><input type="text" class="input"
								id="numbercard" name="numbercard" size="50" placeholder="身份证号"
								data-validate="required:请输入业务员的身份证号码,number:请填写正确身份证" /></td>
						</tr>

						<tr>
							<td width='90' align='center'>截止日期</td>
							<td width='160'><input type="text" class="input" id="phone"
								name="phone" size="50" placeholder="手机号"
								data-validate="required:请输入业务员真实的手机号信息" maxlength="11" /></td>
						</tr>
						<tr>
							<td width='90' align='center'>期限</td>
							<td width='160'>    
							      	<input type="text" class="input" id="phone" name="phone" size="50" placeholder="金额" data-validate="required:请输入购买金额数" maxlength="11" />
                   			</td>
						</tr>
						<tr>
							<td width='90' align='center'>起购金额</td>
							<td width='160'>    
						           	<input type="text" class="input" id="email" name="email" size="50" placeholder="人数" data-validate="required:请输入最大听课人数" />
             				</td>
						</tr>
						<tr>
							<td width='90' align='center'>地区:</td>
							<td width='160'>              
							<select class="input"  name="address" id="address" >
       					 	 	 <option value="">请选择地区</option>
   						 	  	 <option value="11">北京</option>
 						  		 <option value="12">上海</option>
 						  		 <option value="13">深圳</option>
							</select>
						</td>
						</tr>
						<tr>
							<td width='90' align='center'>是否推荐:</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>

						<tr>
							<td width='90' align='center'>服务收益选择:</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						
						
						
						
						
						<tr>
							<td width='90' align='center'>收益率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						
						<tr>
							<td width='90' align='center'>服务费率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						<tr>
							<td width='90' align='center'>金额范围</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
							
						
						<tr>
							<td width='90' align='center'>收益率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						
						<tr>
							<td width='90' align='center'>服务费率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						<tr>
							<td width='90' align='center'>金额范围</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
							
						
						<tr>
							<td width='90' align='center'>收益率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						
						<tr>
							<td width='90' align='center'>服务费率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						<tr>
							<td width='90' align='center'>金额范围</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
							
						
						<tr>
							<td width='90' align='center'>收益率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						
						<tr>
							<td width='90' align='center'>服务费率</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						<tr>
							<td width='90' align='center'>金额范围</td>
							<td width='160'>
							<select class="input"  name="address" id="address" >
   						 	  <option value="1">否</option>
 						 	  <option value="2">是</option>
							</select>	
							</td>
						</tr>
						<tr>
							<td width='90' align='center'>产品详情</td>
							<td width='160'>
							   	<textarea   rows="5" cols="50" id="servce" name="email" placeholder="请填写产品详情" data-validate="required:请填写产品详情"></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td width='90' align='center'>
								<button class="btn1" type="submit">提交</button>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>