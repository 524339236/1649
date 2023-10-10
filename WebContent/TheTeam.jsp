<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>比赛信息</title>
<style>
body, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend,
	button, input, textarea, th, td, section, span, font {
	margin: 0;
	padding: 0;
	font-family: "Microsoft yahei";
}

/* body { */
/* 	padding-bottom: 70px; */
/* } */
body {
	padding: 0;
	padding-bottom: 70px;
	margin: 0;
	width: 100%;
	background-color: lightgray;
}

label.xrequired:before {
	content: '* ';
	color: red;
}

.gcs-footer {
	/* 	margin-top: 15px; */
	background: #222c3a;
	width: 100%;
	height: 65px;
	text-align: center;
	color: white;
	bottom: 0;
	position: fixed;
	/* 	position: absolute; */
}

fieldset {
	padding: 10px;
	width:
}

legend {
	font-size: 16px;
	font-weight: bold;
}

.gcs-footer .footer-top {
	margin-top: 20px;
}

.gcs-footer a {
	color: #f0f1f1;
	text-decoration: none;
	padding: 0 10px;
	vertical-align: middle;
}

.gcs-footer a:hover {
	color: red;
	text-decoration: underline;
}

.gcs-footer p {
	height: 15px;
	color: #888888;
	margin-top: 30px;
}
</style>
</head>
<body>
	<input type="hidden" name="op" id="op" value="${requestScope.op }">
	<script>
		var op = document.getElementById("op").value;
		if (op == "success") {
			alert("添加管理员成功！")
		}
	</script>
	<!--创建一条水平线标签-->
	<hr />
	<table border="1px" width="80%" align="center">
		<tr>
			<td colspan="9" align="center">------------------------------🏃‍♀️队伍成员------------------------------</td>
		</tr>
	</table>
<%-- 	<h2>${match.matchName }🐋</h2> --%>
	
	

	<!-- 	参赛人员视角始	 -->

	<div class="team">

		<table border="1px" width="80%" align="center">



			<tr class="listheader">
				<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
				<td width="15%" nowrap="nowrap"><div align="center">用户名</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">手机号</div></td>
				<td width="15%" nowrap="nowrap"><div align="center">身份</div></td>
				<td width="15%" nowrap="nowrap"><div align="center">邮箱</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.userList }">
					<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
					<tr>
						<td colspan="10" align="center" bgcolor="#FFFFFF"><div
								style="font-size: 36px; color: red;">该队伍没有人！</div></td>

					</tr>
					<!-- 这个是商品信息显示的结束 -->
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.userList }" var="teamuser" varStatus="status">
						<!-- 这个是商品信息的显示行 -->
						<tr>
							<td nowrap="nowrap"><div align="center">${teamuser.userId }</div></td>
							<td nowrap="nowrap"><div align="center">${teamuser.userName }</div></td>
							<td nowrap="nowrap"><div align="center">${teamuser.userPhone }</div></td>
							<td nowrap="nowrap"><div align="center">${teamuser.userIdentity }</div></td>
							<td nowrap="nowrap"><div align="center">${teamuser.userEmail }</div></td>
						</tr>
						<!-- 这个是商品信息展示的结束 -->
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>


	</div>


	<!-- 	参赛人员视角结束	 -->


	<div class="gcs-footer">

		<div class="footer-top">
			<hr />
			更多问题，请联系赛事组织者➡<a href="mailto:${requestScope.creater.userEmail }"><span>${requestScope.creater.userName }</span></a>
		</div>
	</div>
</body>

<script type="text/javascript">
	window.onload = function() {
		//得到当前时间
		var date_now = new Date();
		//得到当前年份
		var year = date_now.getFullYear();
		//得到当前月份
		//注：
		//  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一
		//  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份
		var month = date_now.getMonth() + 1 < 10 ? "0"
				+ (date_now.getMonth() + 1) : (date_now.getMonth() + 1);
		//得到当前日子（多少号）
		var date = date_now.getDate() < 10 ? "0" + date_now.getDate()
				: date_now.getDate();
		//设置input标签的max属性
		// 			$("matchstarttime").attr("min", year + "-" + month + "-" + date);
		// 			$("matchendtime").attr("min", year + "-" + month + "-" + date);
		document.getElementById("matchstarttime").setAttribute("min",
				year + "-" + month + "-" + date);
		document.getElementById("matchendtime").setAttribute("min",
				year + "-" + month + "-" + date);
	}
</script>
</html>