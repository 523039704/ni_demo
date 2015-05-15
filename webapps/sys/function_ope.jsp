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
		action="${pageContext.request.contextPath}/function/insert">
		<input type='hidden' name='dopost' value='listArchives' />
		<table width='100%' border='0' cellpadding='1' cellspacing='1'
			align="center" style="margin-top: 8px">
			<tr bgcolor='#f8f8f8'>
				<td align='center'>
					<table border='0' cellpadding='0' cellspacing='0'>
						<tr>
							<td width='90' align='center'>功能名称</td>
							<td width='160'>
						   	<input type="text" class="input" id="name" name="name" size="50" placeholder="名称" data-validate="required:请填写课程名称" />
         				</td>
						</tr>

						<tr>
							<td width='90' align='center'>路径</td>
							<td width='160'>   
								<input type="text" class="input" id="path" name="path" size="50" placeholder="路径" data-validate="required:请输入起购日期" />
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