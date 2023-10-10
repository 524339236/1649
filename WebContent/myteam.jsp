<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<style>
.search {
	background-color: #F0EEEE;
	display: flex;
	padding: .5rem 1rem;
	position: relative;
}

.search_box {
	flex: 1;
	position: relative;
}

.searchicon {
	position: absolute;
	height: .5rem;
	width: .5rem;
	background: transparent;
	border: 2px solid #43b3e7;
	top: .5rem;
	left: .5rem;
	border-radius: 100%;
}

.searchicon:after {
	content: "";
	position: absolute;
	background: #43b3e7;
	height: 6px;
	width: 3px;
	bottom: -5px;
	right: -3px;
	transform: rotate(-45deg);
}

.search_box input {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-appearance: none;
	font-size: 1rem;
	height: 2.2rem;
	width: 100%;
	border-radius: 0.3rem;
	padding-left: 1.8rem;
}

.search_label {
	padding-left: 1rem;
	height: 2rem;
	line-height: 2rem;
	font-size: 1rem;
}

.round_button {
	border: 1px solid;
	font: bold 12px/25px Arial, sans-serif;
	text-align: center;
	font-size: 20px;
	width: 60px;
	height: 35px;
	border-radius: 15px;
	color: #6495ED
}
</style>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已通过申请的比赛</title>
<link rel="stylesheet" type="text/css" href="styles/common03.css" />
<script>
	function remove() {
		if (confirm("确定退出队伍吗？")) {
			//document.getElementById("changematchform").submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>

	<fieldset>
		<legend>我的队伍信息</legend>

		<table class="listtable" width="100%" border="0" cellpadding="0">
			<tr class="listheader">
				<td width="5%" height="19"><div align="center"></div></td>
				<td width="10%" nowrap="nowrap"><div align="center">队伍ID</div></td>
				<td width="15%" nowrap="nowrap"><div align="center">队伍名称</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">队伍人数</div></td>
				<td width="10%" nowrap="nowrap"><div align="center">比赛ID</div></td>
				<td width="15%" nowrap="nowrap"><div align="center">比赛名称</div></td>
				<td width="15%" height="19"><div align="center">基本操作</div></td>
				<c:choose>
					<c:when test="${empty requestScope.teamList }">
						<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
						<tr>
							<td colspan="10" align="center" bgcolor="#FFFFFF"><div class="STYLE1"
									style="font-size: 36px; color: red;">您还没有队伍！</div></td>
						</tr>
						<!-- 这个是商品信息显示的结束 -->
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.teamList }" var="team" varStatus="status">
							<!-- 这个是商品信息的显示行 -->
							<tr>
								<td height="20" nowrap="nowrap"><div align="center">
										<input type="checkbox" name="teamId" value="${team.teamId }" />
									</div></td>
								<td height="20" nowrap="nowrap"><div align="center">${team.teamId }</div></td>
								<td height="20" nowrap="nowrap"><div align="center">
										<a href="teamdetail.do?tid=${team.teamId }&matchsystem=团体赛" target="_blank">${team.teamName }</a>
									</div></td>
								<td height="20" nowrap="nowrap"><div align="center">${team.teamNumbered }/${team.teamNumber }</div></td>
								<td height="20" nowrap="nowrap"><div align="center">${team.mid }</div></td>
								<td height="20" nowrap="nowrap"><div align="center">${matchNameList[status.count-1] }</div></td>
								<td height="20" nowrap="nowrap"><div align="center">
										<c:choose>
											<c:when test="${match.matchLife eq '进行中' }">
										进行中|删除比赛不可用
										</c:when>
											<c:otherwise>

												<a href="quitteam.do?tid=${team.teamId }&mid=${team.mid }" onclick="return remove();">退出队伍❌</a>

											</c:otherwise>
										</c:choose>
									</div>
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