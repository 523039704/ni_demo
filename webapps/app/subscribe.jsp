<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="css/gy.css" />
<script type="text/javascript" src="provinceCity.js"></script>
<title></title>
</head>
<script type="text/javascript">

function validate_required(field,alerttxt)
{
with (field)
  {
  if (value==null||value=="")
    {alert(alerttxt);return false}
  else {return true}
  }
}

function validate_form(thisform)
{
with (thisform)
  {
	var sex_obj = document.getElementsByName('type');   
	var temp_sex = false;   
	for(var i = 0; i < sex_obj.length; i ++){   
	if(sex_obj[i].checked){   
	var sex = sex_obj[i].value;   
	temp_sex = true;   
	break;   
	}   
	}   
	if(temp_sex == false){   
	alert('请选择预约类型');   
	return false;   
	} 
	 if (validate_required(price,"金额不能为空")==false)
	    {price.focus();return false}
	 if (validate_required(username,"名字不能为空")==false)
	    {username.focus();return false}
  if (validate_required(numbercard,"身份证号不能为空")==false)
  {numbercard.focus();return false}
  if (validate_required(address,"地址不能为空")==false)
  {address.focus();return false}
  if (validate_required(phone,"电话不能为空")==false)
  {phone.focus();return false}
  if (validate_required(email,"邮箱不能为空")==false)
  {email.focus();return false} 
  }
}
</script>
<body>
	<div class="quanju">
		<div class="kop" style="position: relative;">
			<div class="dingbu">
				<table width="95%" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td width="12%" height="8"></td>
						<td width="76%"></td>
						<td width="12%"></td>
					</tr>
					<tr>
						<td width="12%"><a href="#"><img src="images/tu1.png"
								style="border: 0px;"></a></td>
						<td width="76%">个人中心</td>
						<td width="12%"></td>
					</tr>
					<tr>
						<td width="12%" height="8"></td>
						<td width="76%"></td>
						<td width="12%"></td>
					</tr>
				</table>
			</div>
			<div class="xinxi">
				<div class="touxiang">
					<img src="${(user.headimgurl)}" width="80px" height="80px">
				</div>
				<div class="xi">
					<h2>会员ID：${(user.user_id)}</h2>
					<h2>昵称：${(user.nickname)}</h2>
					<h2>加入时间：${(user.subscribe_time)}</h2>
					<c:if test="${(user.role ) eq '0'}">
						<h2>身份：客户</h2>

					</c:if>

					<c:if test="${(user.role ) eq '4' }">
						<h2>上级公司：${(user.fid)}</h2>
						<h2>身份：业务员</h2>

					</c:if>

					<c:if test="${(user.role )   eq '3'}">
						<h2>上级公司：${(user.fid)}</h2>
						<h2>身份：代理商</h2>

					</c:if>

					<c:if test="${(user.role)  eq '2' }">
						<h2>上级公司：自己公司的名字</h2>
						<h2>身份：分公司</h2>
					</c:if>

				</div>
				<div class="clear"></div>
			</div>
			<div class="biao_a">
				<table width="95%" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td height="10"></td>
						<td></td>
					</tr>
					<tr>
						<c:if test="${empty perfor}">
							<td>我的业绩：0.00</td>
						</c:if>
						<c:if test="${!empty perfor}">
							<td>我的业绩：${(perfor.price)}</td>
						</c:if>

						<td style="text-align: right;"><a
							href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf4d5687f651cbe90&redirect_uri=http://22.ftezu.net/app/sqdls&response_type=code&scope=snsapi_base&state=1#wechat_redirect">申请业务员</a></td>
					</tr>
					<tr>
						<td height="10"></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="nei_a">


				<form action="/app/subscribe_insert" onsubmit="return validate_form(this);" method="post">
					<div class="taopu">
						<table width="70%" cellpadding="0" cellspacing="0" align="center">
							<tr>
								<td width="37%" height="20"></td>
								<td width="32%"></td>
								<td width="31%"></td>
							</tr>
							<tr>
								<td style="font-size: 1.2em;">预约产品</td>
								<td>
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td width="17%"><p>
													<label> <input type="radio" name="type" value="1"
														id="type" /></label></td>
											<td width="83%" style="background: #e9f6fa;">私募</td>
										</tr>
									</table>
								</td>
								<td>
									<table width="100%" cellpadding="0" cellspacing="0">
										<tr>
											<td width="17%"><p>
													<label> <input type="radio" name="type" value="2"
														id="type" /></label></td>
											<td width="83%" style="background: #e9f6fa;">基金</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="37%" height="20"></td>
								<td width="32%"></td>
								<td width="31%"></td>
							</tr>
						</table>
					</div>
					<div class="tewr">
						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>投资金额</td>
								<td><input name="price" id="price" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>


						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td><input name="username" id="username" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.nickname)}" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>身份证</td>
								<td><input name="numbercard" id="numbercard" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.numbrcard)}" /> <input name="uid" id="uid"
									type="hidden"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.user_id)}" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>电话</td>
								<td><input name="phone" id="phone" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.phone)}" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>地址</td>
								<td><input name="address" id="address" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.address)}" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
							<tr>
								<td>邮箱</td>
								<td><input name="email" id="email" type="text"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.email)}" /></td>
							</tr>
							<tr>
								<td width="22%" height="10"></td>
								<td width="78%"></td>
							</tr>
						</table>
					</div>

					<div class="anniu_c">
						<input type="submit" value="提交" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	new PCAS("home_prov", "home_city", "home_qu");
</script>
</html>
