<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="css/ny.css" />
<script type="text/javascript" src="provinceCity.js"></script>
<title>课程详细信息</title>
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
  if (validate_required(email,"邮箱不能为空")==false)
    {email.focus();return false}
  if (validate_required(numbercard,"身份证号不能为空")==false)
  {numbercard.focus();return false}
  if (validate_required(address,"地址不能为空")==false)
  {address.focus();return false}
  if (validate_required(phone,"电话不能为空")==false)
  {phone.focus();return false}
   
  }

}
</script>
<body>
	<div class="quanju_b">
		<div class="kop" style="position: relative;">
			<div class="tupian_a">
				<div class="nei_c">
					<img src="${(counrse.img)}">
				</div>
			</div>
			<div class="rong_a">
				<div class="neirong_a">
					<div class="wenben_a">
						<table width="95%" cellpadding="0" cellspacing="0" align="center">
							<tr>
								<td width="85%">
									<h2>
										<a href="#">课程名称:${(counrse.name)}</a>
									</h2>
								</td>
								<td width="15%"></td>
							</tr>
						</table>
					</div>
					<div class="wenben_b">
						<table width="89%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="72%"><h2>
										<span>微信价：</span>${(counrse.price)}<span>元</span>
									</h2></td>
								<td width="28%"></td>
							</tr>
						</table>
					</div>
					<div class="jiange_a"></div>
				</div>
				<div class="neirong_b">
					<div class="wenben_b">
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="3%"></td>
								<td width="97%">
									<h1>开课日期：${(counrse.coursedatetime)}</h1>
								</td>
							</tr>
							<tr>
								<td height="8" colspan="3"></td>
							</tr>
						</table>
						<div class="jiange_a"></div>
					</div>
				</div>
				<div class="neirong_c">
					<div class="wenben_c">
						<table width="75%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="4%" height="40"></td>
								<td width="15%">地区</td>
								<td width="81%">${(counrse.peoples)}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="rong_c">
				<h2>课程介绍</h2>
				<div class="wenben_e">
					<div class="wenben_f">
						<p>${(counrse.summary)}。</p>
						<img src="images/tu19.png">
					</div>
				</div>
			</div>


			<div class="rong_c">
			<form action="/pay/wx_pay_befion"onsubmit="return validate_form(this);" method="post">
				<h2>我要报名</h2>
				<div class="wenben_e">
					<div class="neirongye">

						<div class="tewr_ss">


							<table width="100%" cellpadding="0" cellspacing="0"
								style="border-bottom: solid 1px #dddddd;">
								<tr>
									<td width="22%" height="10"></td>
									<td width="78%"></td>
								</tr>
								<tr>
									<td>姓名</td>
									<td>
									<input name="price" type="text"style="width: 80%; height: 30px; background: #FFF; border: 0px;" value="${(counrse.price)}"  />
									<input name="id" type="hidden"style="width: 80%; height: 30px; background: #FFF; border: 0px;" value="${(counrse.id)}" />
									<input name="name" type="text"	style="width: 80%; height: 30px; background: #FFF; border: 0px;"  value="${(user.nickname)}" /></td>
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
									<td><input name="numbercard" type="text"
										style="width: 80%; height: 30px; background: #FFF; border: 0px;" value="${(user.numbrcard)}" /></td>
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
									<td><input name="phone" type="text"
										style="width: 80%; height: 30px; background: #FFF; border: 0px;" value="${(user.phone)}" /></td>
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
									<td><input name="address" type="text"
										style="width: 80%; height: 30px; background: #FFF; border: 0px;" value="${(user.address)}"/></td>
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
									<td><input name="email" type="text"
										style="width: 80%; height: 30px; background: #FFF; border: 0px;"  value="${(user.email)}"/></td>
								</tr>
								<tr>
									<td width="22%" height="10"></td>
									<td width="78%"></td>
								</tr>
							</table>
						</div>

					</div>
				</div>
				<div class="dubu_ss" style="position: absolute; bottom: 0; position: fixed; _top: expression(eval(document.documentElement.scrollTop) +110px); z-index: 1000;">
				<input type="submit" value="直接购买">
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
