<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册账户</title>
<link rel="stylesheet" href="styles/common.css" />
</head>
<body>
	<%
		String mid = (String) request.getParameter("mid");
	%>
	<!--注册表单-->
	<form id="addteamForm" action="addteam.do?mid=<%=mid%>" method="post">
		<input type="hidden" name="action" value="register">
		<fieldset>
			<legend>队伍信息</legend>
			<table border="0" align="center" class="page-content">

				<tr>
					<td><label for="teamname">TeamName:</label></td>
					<td><input type="text" id="teamName" name="teamName"
						placeholder="请输入队伍名称"></td>
				</tr>
				<tr>
					<td><label for="teamNumber">队伍人数:</label></td>
					<td><input type="text" id="teamNumber" name="teamNumber"
						placeholder="请输入队伍最大人数"></td>
				</tr>
				<tr>
					<td><input type="submit" class="submit" value="创建"></td>
					<td><button onclick="window.history.back()">返回◀</button></td>
				</tr>
			</table>
		</fieldset>
	</form>


</body>
</html>