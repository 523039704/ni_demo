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
		action="${pageContext.request.contextPath}/user/insert">
		<input type='hidden' name='dopost' value='listArchives' />
		<table width='100%' border='0' cellpadding='1' cellspacing='1'
			align="center" style="margin-top: 8px">
			<tr bgcolor='#f8f8f8'>
				<td align='center'>
					<table border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='90' align='center'>业务员登录名</td>
							<td width='160'><input type="text" class="input"
								id="username" name="username" size="50" placeholder="登录名称"
								data-validate="required:请填写业务员登录名称,integer:请输入信息" /></td>
						</tr>

						<tr>
							<td width='90' align='center'>业务员身份证号</td>
							<td width='160'><input type="text" class="input"
								id="numbercard" name="numbercard" size="50" placeholder="身份证号"
								data-validate="required:请输入业务员的身份证号码,number:请填写正确身份证" /></td>
						</tr>

						<tr>
							<td width='90' align='center'>业务员手机</td>
							<td width='160'><input type="text" class="input" id="phone"
								name="phone" size="50" placeholder="手机号"
								data-validate="required:请输入业务员真实的手机号信息" maxlength="11" /></td>
						</tr>
						<tr>
							<td width='90' align='center'>业务员Email</td>
							<td width='160'><input type="text" class="input" id="email"
								name="email" size="50" placeholder="Email"
								data-validate="required:请输入业务员的邮箱信息,email:请输入正确格式" /></td>
						</tr>
						<tr>
							<td width='90' align='center'>操作类型</td>
							<td width='160'><select name="ope" id="ope">
									<option value="-1">请选择功能</option>
									<option value="1">子公司</option>
									<option value="2">代理商</option>
									<option value="3">业务员</option>
							</select></td>
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