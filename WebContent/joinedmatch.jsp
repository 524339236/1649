<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我参加的的比赛</title>
<link rel="stylesheet" type="text/css" href="styles/common03.css" />
</head>
<body>

	<fieldset>
		<legend>我参加的比赛</legend>
		<table class="listtable" width="100%" border="0" cellpadding="0" cellspacing="1">
			<tr class="listheader">
				<td width="5%" nowrap="nowrap"><div align="center">序号</div></td>
				<td width="20%" nowrap="nowrap"><div align="center">比赛名称</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">比赛类型</div></td>
				<td width="20%" nowrap="nowrap"><div align="center">比赛系统</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">开始时间</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">结束时间</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">生命周期</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">报名人数</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.matchList }">
					<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
					<tr>
						<td colspan="10" align="center" bgcolor="#FFFFFF"><div
								style="font-size: 36px; color: red;">你还没有参加任何比赛！</div></td>

					</tr>
					<tr>
						<td align=left colspan="4"><a href="allmatch.do?page=joinmatch"><font
								style="font-size: 55px">✈返回比赛页面</font></a></td>
					</tr>
					<!-- 这个是商品信息显示的结束 -->
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.matchList }" var="match" varStatus="status">
						<!-- 这个是商品信息的显示行 -->
						<tr>
							<td nowrap="nowrap"><div align="center">${match.matchId }</div></td>
							<td nowrap="nowrap"><div align="center">
									<a
										href="matchdetail.do?mid=${match.matchId }&matchsystem=${match.matchSystem }&permission=joiner"
										target="_blank">${match.matchName }</a>
								</div></td>
							<td nowrap="nowrap"><div align="center">
									<c:choose>
										<c:when test="${match.matchType eq 0}">公开比赛</c:when>
										<c:otherwise>
											<font style="color: red">私有比赛</font>
										</c:otherwise>
									</c:choose>
								</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchSystem }</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchStartTime }</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchEndTime }</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchLife }</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchNumbered }/${match.matchNumber }
								</div></td>
							<td nowrap="nowrap"><div align="center">
									<c:choose>
										<c:when test="${match.matchLife eq '进行中' }">
										申请退赛
										</c:when>
										<c:otherwise>
											<script>
										function quit(mid) {
											
											var msg = prompt("请输入退赛理由", "不乐意了");
											if (msg != null && msg != "") {
												document.getElementById(mid).reason.value = msg;
												//document.getElementsByName("quitform").mid.value = mid;
												document.getElementById(mid).submit();
											}
										}
									</script>
											<form name="${match.matchId }" id="${match.matchId }"
												action="quitmatch.do?status=申请退赛&matchId=${match.matchId }" method="post">
												<input type="hidden" name="reason"> <input type="hidden" name="mid"> <a
													onclick="quit(${match.matchId })">申请退赛📌</a>
											</form>

											<!-- 
											<input type="hidden" name="reason">
												<a
													onclick=quit()>填写退赛理由</a>
												<a
												href="quitmatch.do?status=申请退赛&matchId=${match.matchId }" onclick="quit()">申请退赛📌</a>
											-->
											<%--<a href="quitmatch.do?matchId=${match.matchId }">申请退赛📌</a> --%>
										</c:otherwise>
									</c:choose>
								</div></td>
						</tr>
						<!-- 这个是商品信息展示的结束 -->
					</c:forEach>
					<tr>
						<td align=left colspan="9"><a href="allmatch.do?page=joinmatch"><font
								style="font-size: 35px">✈参加更多比赛♻👀</font></a></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>

		<!-- 		<form name="quitform" id="quitform" -->
		<!-- 			action="quitmatch.do?status=申请退赛" -->
		<!-- 			method="post"> -->
		<!-- 			<input type="hidden" name="reason"> -->
		<!-- 			<input type="hidden" name="mid"> -->
		<!-- 		</form> -->



	</fieldset>
	<!-- 商品显示 -->
</body>
</html>