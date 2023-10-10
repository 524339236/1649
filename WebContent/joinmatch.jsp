<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	color:#6495ED
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已通过申请的比赛</title>
<link rel="stylesheet" type="text/css" href="styles/common03.css" />
</head>
<body>

	<fieldset>
		<legend>所有通过审核的比赛</legend>
		<form action="search.do?source=joinmatch" name="searchform" method="post">
			<div class="search">
				<div class="search_box">
					<span class="searchicon"></span> <input type="search" name="name"
						class="search_input" id="name" placeholder="请输入你要搜索比赛的名称">
				</div>
				<label class="search_label" id="searchText"> <input
					type="submit" value="搜索" class="round_button" style="cursor:pointer">
				</label>
			</div>
		</form>
		<table class="listtable" width="100%" border="0" cellpadding="0"
			cellspacing="1">
			<tr class="listheader">
				<!-- 			nowrap属性代表不换行 				-->
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
				<td width="5%" nowrap="nowrap"><div align="center">报名人数</div></td>
				<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
			</tr>
			<c:choose>
				<c:when test="${empty requestScope.allmatchList }">
					<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
					<tr>
						<td colspan="10" align="center" bgcolor="#FFFFFF"><div
								style="font-size: 36px; color: red;">无已通过申请的比赛！</div></td>
					</tr>
					<!-- 这个是商品信息显示的结束 -->
				</c:when>
				<c:otherwise>
					<c:forEach items="${requestScope.allmatchList }" var="match"
						varStatus="status">
						<!-- 这个是商品信息的显示行 -->
						<tr>
							<td nowrap="nowrap"><div align="center">${match.matchId }</div></td>
							<td nowrap="nowrap"><div align="center">
									<a href="matchdetail.do?mid=${match.matchId }&matchsystem=${match.matchSystem }&permission=joiner" target="_blank">${match.matchName }</a>
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
										<c:when test="${match.matchNumbered ge match.matchNumber }">
										报名参加
										</c:when>										
										<c:when test="${match.matchType eq 1}">
										报名参加
										</c:when>
										<c:when test="${match.matchLife eq '进行中'}">
										报名参加
										</c:when>
										<c:when test="${match.matchSystem eq '团体赛' }">
										<a
												href="joinmatch.do?mid=${match.matchId }&matchsystem=${match.matchSystem }">团体报名🙋‍♂️</a>
										</c:when>
										<c:otherwise>
											<a
												href="joinmatch.do?mid=${match.matchId }&matchsystem=${match.matchSystem }">报名参加🙋‍♂️</a>
										</c:otherwise>
									</c:choose>
								</div>
						</tr>
						<!-- 这个是商品信息展示的结束 -->
					</c:forEach>
					<td colspan="9" height="20" bgcolor="#FFFFFF" nowrap="nowrap"><div
							align="center">私有比赛、报名截止的比赛或者爆满的比赛都不允许报名参加</div></td>
				</c:otherwise>
			</c:choose>
		</table>
	</fieldset>
	<!-- 商品显示 -->
</body>
</html>