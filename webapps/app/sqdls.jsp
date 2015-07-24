<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="css/gy.css" />
<script type="text/javascript" src="provinceCity.js"></script>
<script src="BJUI/js/jquery-1.7.2.min.js"></script>
<script src="BJUI/js/jquery.cookie.js"></script>
<title></title>

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
  
  if (validate_required(username,"用户名不能为空")==false)
  {username.focus();return false}
  if (validate_required(realtname,"姓名不能为空")==false)
  {realtname.focus();return false}
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



</head>

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
					<img src="${(usermessager.headimgurl)}">
				</div>
				<div class="xi">
					<h2>会员ID：${(user.user_id)}</h2>
					<h2>昵称：${(user.nickname)}</h2>
					<h2>加入时间：${(user.subscribe_time)}</h2>

					<c:if test="${empty userinfo  ||(user.role ) eq '0' }">
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
						<td height="10"></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="nei_a">

				<div class="tewr">
					<form
						action="/app/<%if (request.getAttribute("userinfo") == null) {
				out.print("insert_wx");
			} else {
				out.print("update_wx");
			}%>"    onsubmit="return validate_form(this);" method="post">
						<div class="taopu">
							<table width="100%" cellpadding="0" cellspacing="0"
								align="center">
								<tr>
									<td>申请成为</td>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="17%"><label> <c:if
															test="${(userinfo.role)  eq '2' }">
															<input type="radio" name="role" value="2" id="role"
																checked="checked" />
														</c:if> <c:if test="${(userinfo.role)  ne '2' }">
															<input type="radio" name="role" value="2" id="role" />
														</c:if>
												</label></td>
												<td width="60%" style="background: #e9f6fa;">分公司</td>
											</tr>
										</table>
									</td>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="17%"><label> <c:if
															test="${(userinfo.role)  eq '3' }">
															<input type="radio" name="role" value="3" id="role"
																checked="checked" />
														</c:if> <c:if test="${(userinfo.role)  ne '3' }">
															<input type="radio" name="role" value="3" id="role" />
														</c:if>

												</label></td>
												<td width="60%" style="background: #e9f6fa;">代理商</td>
											</tr>
										</table>
									</td>
									<td>
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="17%"><label> <c:if
															test="${(userinfo.role)  eq '4' }">
															<input type="radio" name="role" value="4" id="role"
																checked="checked" />
														</c:if> <c:if test="${(userinfo.role)  ne '4' }">
															<input type="radio" name="role" value="4" id="role" />
														</c:if></label></td>
												<td width="60%" style="background: #e9f6fa;">业务员</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td width="10%" height="20"></td>
									<td width="10%"></td>
									<td width="10%"></td>
									<td width="10%"></td>
								</tr>
							</table>
						</div>
						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
							<tr>
								<td width="50%">后台登录名</td>
								<td><input name="username" type="text" id="username"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(userinfo.adminname)}" /></td>
							</tr>
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
						</table>


						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
							<tr>
								<td width="30%">姓名</td>
								<td><input name="realtname" type="text" id="realtname"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(userinfo.realname)}" /> <input name="uid"
									type="hidden"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(usermessager.user_id)}" /> <input name="status"
									id="status" type="hidden"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(user.role)}" /></td>
							</tr>
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
							<tr>
								<td width="30%">身份证</td>
								<td><input name="numbercard" type="text"  id="numbercard"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(userinfo.numbercard)}" /></td>
							</tr>
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
						</table>

						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
							<tr>
								<td width="30%">电话</td>
								<td><input name="phone" type="text" id="phone"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(userinfo.phone)}" /></td>
							</tr>
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
						</table>



						<table width="100%" cellpadding="0" cellspacing="0"
							style="border-bottom: solid 1px #dddddd;">
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
							<tr>
								<td width="30%">邮箱</td>
								<td><input name="email" type="text"   id="email"
									style="width: 80%; height: 30px; background: #FFF; border: 0px;"
									value="${(userinfo.email)}" /></td>
							</tr>
							<tr>
								<td width="17%" height="10"></td>
								<td width="83%"></td>
							</tr>
						</table>

						<div class="anniu_c">
							<input type="submit" value="提交" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

