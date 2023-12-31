<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="styles/common02.css" />
<style>
img {
	vertical-align: middle;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${empty sessionScope.user}">
			<!-- 未登录状态  -->
			<div class="page-sidebar">
				<div class="sidebar-menugroup">
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem"><a href="login.jsp" target="_parent">登录开启功能</a></li>
					</ul>
				</div>
			</div>
			<div class="page-sidebar">
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">个人中心</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem active"><a>我参加的比赛</a></li>
						<li class="sidebar-menuitem"><a>我组织的比赛</a></li>
						<li class="sidebar-menuitem"><a>我管理的比赛</a></li>
						<li class="sidebar-menuitem"><a>我的队伍</a></li>
					</ul>
				</div>
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">比赛管理</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem"><a>发起比赛</a></li>
						<li class="sidebar-menuitem"><a>参加比赛</a></li>
						<li class="sidebar-menuitem"><a>用户信息</a></li>
					</ul>
				</div>
			</div>
		</c:when>

		<c:otherwise>
			<div class="page-sidebar">
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">个人中心</div>
					<ul class="sidebar-menu">
						<li class="sidebar-menuitem active"><a href="mymatch.do?op=join" target="main">我参加的比赛</a></li>
						<li class="sidebar-menuitem"><a href="mymatch.do?op=create" target="main">我组织的比赛</a></li>
						<li class="sidebar-menuitem"><a href="mymatch.do?op=manage" target="main">我管理的比赛</a></li>
						<li class="sidebar-menuitem"><a href="myteam.do" target="main">我的队伍</a></li>
						<li class="sidebar-menuitem"><a href="mailbox.do" target="main">mailbox</a></li>
						<li class="sidebar-menuitem"><a href="userinfo.jsp" target="main">个人信息</a></li>
					</ul>
				</div>
				<div class="sidebar-menugroup">
					<div class="sidebar-grouptitle">比赛管理</div>
					<ul class="sidebar-menu">

						<li class="sidebar-menuitem"><a href="addmatch.jsp" target="main">发起比赛</a></li>
						<li class="sidebar-menuitem"><a href="allmatch.do?page=joinmatch" target="main">参加比赛</a></li>
						
					</ul>
				</div>
				<c:choose>
					<c:when test="${sessionScope.user.userIdentity eq 'superadmin' }">
						<!-- 超级管理员权限 -->
						<div class="page-sidebar">
							<div class="sidebar-menugroup">
								<div class="sidebar-grouptitle">比赛管理</div>
								<ul class="sidebar-menu">
									<li class="sidebar-menuitem"><a href="allmatch.do?page=showallmatch" target="main">所有比赛</a></li>
									<li class="sidebar-menuitem"><a href="matchapprovalshow.do" target="main">比赛申请</a></li>
									<li class="sidebar-menuitem"><a href="finduserinfo.do?op=check" target="main">所有用户</a></li>

								</ul>
							</div>
						</div>
					</c:when>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>

</body>
</html>