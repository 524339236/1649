<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我管理的比赛</title>
<link rel="stylesheet" type="text/css" href="styles/common03.css" />
<script>
	function remove() {
		if (confirm("确定删除该比赛吗？")) {
			//document.getElementById("changematchform").submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>

	<fieldset>
		<legend>我管理的比赛</legend>
		<table class="listtable" width="100%" border="0" cellpadding="0"
			cellspacing="1">
			<tr class="listheader">
				<td width="3%"><div align="center"></div></td>
				<td width="5%" nowrap="nowrap"><div align="center">序号</div></td>
				<td width="20%" nowrap="nowrap"><div align="center">比赛名称
					</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">比赛类型</div></td>
				<td width="20%" nowrap="nowrap"><div align="center">比赛系统
					</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">开始时间
					</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">结束时间
					</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">生命周期
					</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">已报人数
					</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.matchList }">
					<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
					<tr>
						<td colspan="10" align="center" bgcolor="#FFFFFF"><div
								class="STYLE1" style="font-size: 36px; color: red;">无正在管理的比赛！</div></td>
					</tr>
					<!-- 这个是商品信息显示的结束 -->
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.matchList }" var="match"
						varStatus="status">
						<!-- 这个是商品信息的显示行 -->
						<tr>
							<td nowrap="nowrap"><div align="center">
									<input type="checkbox" name="matchId" value="${match.matchId }" />
								</div></td>
							<td nowrap="nowrap"><div align="center">${match.matchId }</div></td>
							<td nowrap="nowrap"><div align="center">
									<a
										href="matchdetail.do?mid=${match.matchId }&matchsystem=${match.matchSystem }&permission=creater"
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
										进行中|删除比赛不可用
										</c:when>
										<c:otherwise>

											<a
												href="changematchdetail.do?op=deletematch&mid=${match.matchId }"
												onclick="return remove();">删除比赛❌</a>
											<c:choose>
												<c:when test="${match.matchStatus eq '已拒绝'}">
													
											| <a href="changematchdetail.do?op=reapply&mid=${match.matchId }">再次申请✔</a>
												</c:when>
											</c:choose>

										</c:otherwise>
									</c:choose>

								</div></td>
						</tr>
						<!-- 这个是商品信息展示的结束 -->
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</fieldset>
	<!-- 商品显示 -->
</body>
</html>