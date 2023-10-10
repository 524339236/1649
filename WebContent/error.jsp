<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误信息提示</title>
</head>
<body>
	<table>
	<%
		String msg = (String) request.getAttribute("msg");
	%>
	<!-- 如果不为空才显示,为空就什么也不显示 -->
	<%
		if (msg != null) {
	%>
	<tr>
		<td>提示信息:</td>
		<td><font color='red'> <%=msg%>
		</font></td>
	</tr>
	<%
		}
	%>
	</table>
</body>
</html>