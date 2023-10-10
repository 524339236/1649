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

	<h2>${match.matchName }🐋</h2>
	<!--创建一条水平线标签-->
	<hr />

	<!-- 	参赛人员视角始	 -->
	<c:choose>
		<c:when test="${requestScope.permission eq 'joiner' }">
			<div class="matchJoiner">
				<h4>
					<font style="color: #222c3a;">比赛介绍：</font>
					<marquee direction="left" bgcolor="#222c3a">
						<font style="color: white;">${match.matchInfo }</font>
					</marquee>
				</h4>
				<div>
					<table>
						<tr>
							<td nowrap="nowrap">比赛ID：</td>
							<td nowrap="nowrap"><span>${match.matchId } </span></td>
						</tr>
						<tr>
							<td nowrap="nowrap">比赛时间：</td>
							<td nowrap="nowrap"><span>${match.matchStartTime } ~ ${match.matchEndTime }</span></td>
						</tr>
						<tr>
							<td nowrap="nowrap"><font style="font-color: #222c3a;">比赛类型：</font></td>
							<td nowrap="nowrap"><c:choose>
									<c:when test="${match.matchType eq 0}">公开比赛</c:when>
									<c:otherwise>
										<font style="color: red">私有比赛</font>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<td nowrap="nowrap">比赛赛制：</td>
							<td nowrap="nowrap">${match.matchSystem }</td>
						</tr>
						<c:choose>
							<c:when test="${match.matchSystem eq '团体赛'}">
								<tr>
									<td nowrap="nowrap"><a href="addteam.jsp?mid=${match.matchId }">创建队伍</a></td>
									<td nowrap="nowrap">
										<form action="jointeam.do?mid=${match.matchId }" name="teamIdForm" id="teamIdForm">
											<input type="text" id="teamId" name="teamId" placeholder="请输入队伍ID"> 
											<input type="hidden" id="mid" name="mid" value="${match.matchId }">
											<input
												type="submit" value="加入队伍">
										</form>
									</td>
								</tr>

							</c:when>
						</c:choose>
						<tr>
							<td nowrap="nowrap">生命周期：</td>
							<td nowrap="nowrap">${match.matchLife }</td>
					</table>
				</div>
				<div>
					<span>对阵信息表</span>
				</div>


				<table border="1px" width="80%" align="center">
					<tr>
						<td colspan="9" align="center">------------------------------🏃‍♀️参赛人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">所属队伍</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.joineduserList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">没有人报名本次比赛</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.joineduserList }" var="joineduser" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${joineduser.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduserTeamNameList[status.count-1] }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userEmail }</div></td>
									<c:choose>
										<c:when test="${requestScope.permission eq 'creater' }">
											<td nowrap="nowrap"><div align="center">
													<a
														href="removeMember.do?uid=${joineduser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&op=remove">取消资格</a>
												</div></td>
										</c:when>
									</c:choose>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

				<table border="1px" width="80%" align="center">
					<tr>
						<td colspan="9" align="center">------------------------------👨‍💻赛事管理人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>

						<td width="15%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.managerList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">该比赛暂时没有管理人员</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.managerList }" var="manager" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${manager.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userEmail }</div></td>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</c:when>
	</c:choose>

	<!-- 	参赛人员视角结束	 -->


	<!-- 比赛创建者视角开始 -->

	<c:choose>
		<c:when test="${requestScope.permission eq 'creater' }">

			<div class="matchCreater">
				<!-- 			比赛细节信息展示开始 			-->
				<h4>
					<font style="color: #222c3a;">比赛介绍：</font>
					<marquee direction="left" bgcolor="#222c3a">
						<font style="color: white;">${match.matchInfo }</font>
					</marquee>
				</h4>


				<span><font style="bgcolor: #222c3a">添加/删除赛事管理员</font><a
					href="finduserinfo.do?op=setmanager&mid=${match.matchId }&matchsystem=${match.matchSystem }">➕/➖</a></span>


				<div class="left">
					<fieldset>
						<legend>比赛信息更改</legend>
						<form action="changematchdetail.do?op=changematch&matchsystem=${match.matchSystem }" name="changeform" method="post">
							<input type="hidden" id="mid" name="mid" value="${match.matchId }">
							<table>
								<tr>
									<td><font style="font-color: red;">现定的比赛类型：</font></td>
									<td><c:choose>
											<c:when test="${match.matchType eq 0}">公有比赛</c:when>
											<c:otherwise>
												<font style="color: red">私有比赛</font>
											</c:otherwise>
										</c:choose></td>

									<td><label class="xrequired">请选择比赛类型：</label></td>
									<td><input type="radio" name="matchtype" value="0">公有比赛<input type="radio"
										name="matchtype" value="1">私有比赛</td>
								</tr>
								<tr>
									<td>现定比赛赛制：</td>
									<td>${match.matchSystem }</td>

									<td><label class="xrequired">修改比赛赛制:</label></td>
									<td><select id="matchsystem" name="matchsystem">
											<option></option>
											<option value="联赛">联赛</option>
											<option value="杯赛">杯赛</option>
											<option value="淘汰赛">淘汰赛</option>
											<option value="锦标赛">锦标赛</option>
											<option value="团体赛">团体赛</option>
									</select></td>
								</tr>
								<tr>
									<td>现定比赛时间：</td>
									<td><span>${match.matchStartTime } ~ ${match.matchEndTime }</span></td>

									<td><label class="xrequired">修改比赛时间：</label></td>
									<td><input type="date" min="2021-05-26" id="matchstarttime" name="matchstarttime">
										~ <input type="date" id="matchendtime" min="2021-05-26" name="matchendtime"></td>
								</tr>
								<tr>

									<td>现定人数/队伍上限:</td>
									<td>${match.matchNumbered }/${match.matchNumber }</td>

									<td><label class="xrequired">人数/队伍上限:</label></td>
									<td><input type="text" id="matchnumber" name="matchnumber" placeholder="人数/队伍上限"></td>
								</tr>

								<tr>
									<td>生命周期：</td>
									<td>${match.matchLife }</td>

									<td><label class="xrequired">修改生命周期:</label></td>
									<td><select id="matchlife" name="matchlife">
											<option></option>
											<option value="准备中">准备中</option>
											<option value="报名中">报名中</option>
											<option value="已开始">已开始</option>
											<option value="已结束">已结束</option>
									</select></td>
								</tr>
								
								<tr>
									<td>修改比赛介绍:</td>
									<td><textarea id="matchinfo" name="matchinfo">${match.matchInfo }</textarea></td>
								</tr>
								
								<tr>
									<td colspan="4" align="center"><button type="submit">
											<font style="font-size: 20px;">提交修改</font>
										</button>
								</tr>
							</table>
						</form>
						<form action="changematchdetail.do?op=changeresult&matchsystem=${match.matchSystem }"
							name="changeresultform" method="post">
							<input type="hidden" id="mid" name="mid" value="${match.matchId }">
							<table>
								<tr>
									<td align="left">比赛结果：</td>
									<td>${match.matchResult }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td align="right">填写比赛结果：</td>
									<td><input type="text" id="matchresult" name="matchresult"></td>



									<td colspan="4" align="center"><button type="submit">
											<font style="font-size: 15px;">确认</font>
										</button>
								</tr>
							</table>
						</form>
					</fieldset>
				</div>

				<div class="right">
					<span>对阵信息表</span>
				</div>
				<!-- 		比赛细节信息展示结束 		-->

				<table style="align: center;" border="1px" width="80%" align="center">
					<tr>



						<td colspan="9" align="center">------------------------------👊参赛人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">所属队伍</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.joineduserList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">没有人报名本次比赛</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.joineduserList }" var="joineduser" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${joineduser.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduserTeamNameList[status.count-1] }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${joineduser.userEmail }</div></td>
									<c:choose>
										<c:when test="${requestScope.permission eq 'creater' }">
											<td nowrap="nowrap"><div align="center">
													<a
														href="removeMember.do?uid=${joineduser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&op=remove">取消资格</a>
												</div></td>
										</c:when>
									</c:choose>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</table>


				<table border="1px" width="80%" align="center">
					<tr>
						<td colspan="6" align="center">------------------------------🤝申请参赛人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">所属队伍</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>

						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.applyinguserList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">没有人申请报名本次比赛</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.applyinguserList }" var="applyinguser" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${applyinguser.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${applyinguserTeamNameList[status.count-1] }</div></td>
									<td nowrap="nowrap"><div align="center">${applyinguser.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${applyinguser.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${applyinguser.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${applyinguser.userEmail }</div></td>
									<td nowrap="nowrap"><div align="center">
											<a
												href="matchmemberapply.do?uid=${applyinguser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&status=同意">同意</a>
											<a
												href="matchmemberapply.do?uid=${applyinguser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&status=拒绝">拒绝</a>
										</div></td>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tr>
					</tr>
				</table>

				<table border="1px" width="80%" align="center">
					<tr>
						<td colspan="9" align="center">------------------------------👋申请退赛人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">所属队伍</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>

						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.quitinguserList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">没有人申请退出本次比赛</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.quitinguserList }" var="quitinguser" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${quitinguser.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${quitinguserTeamNameList[status.count-1] }</div></td>
									<td nowrap="nowrap"><div align="center">${quitinguser.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${quitinguser.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${quitinguser.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${quitinguser.userEmail }</div></td>
									<td nowrap="nowrap"><div align="center">
											<a
												href="removeMember.do?uid=${quitinguser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&op=remove">同意</a>
											<a
												href="matchmemberapply.do?uid=${quitinguser.userId }&mid=${match.matchId }&matchsystem=${match.matchSystem }&status=同意">拒绝</a>
										</div></td>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

				<table border="1px" width="80%" align="center">
					<tr>
						<td colspan="9" align="center">------------------------------👨‍💻赛事管理人员------------------------------</td>
					</tr>
					<tr class="listheader">
						<td width="5%" nowrap="nowrap"><div align="center">身份ID</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">所属队伍</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">用户名</div></td>
						<td width="10%" nowrap="nowrap"><div align="center">报名手机号</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名人身份</div></td>
						<td width="15%" nowrap="nowrap"><div align="center">报名邮箱</div></td>
						<td width="5%" nowrap="nowrap"><div align="center">基本操作</div></td>
					</tr>
					<c:choose>
						<c:when test="${empty requestScope.managerList }">
							<!-- 这是没有查询到商品的显示行，在when标签为true即容器为空时执行 -->
							<tr>
								<td colspan="10" align="center" bgcolor="#FFFFFF"><div
										style="font-size: 36px; color: red;">该比赛暂时没有管理人员</div></td>

							</tr>
							<!-- 这个是商品信息显示的结束 -->
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.managerList }" var="manager" varStatus="status">
								<!-- 这个是商品信息的显示行 -->
								<tr>
									<td nowrap="nowrap"><div align="center">${manager.userId }</div></td>
									<td nowrap="nowrap"><div align="center">${managerTeamNameList[status.count-1] }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userName }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userPhone }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userIdentity }</div></td>
									<td nowrap="nowrap"><div align="center">${manager.userEmail }</div></td>
									<td>取消管理员</td>
								</tr>
								<!-- 这个是商品信息展示的结束 -->
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</c:when>
	</c:choose>
	<!-- 比赛创建者视角结束 -->
	<div class="gcs-footer">

		<div class="footer-top">
			<hr />
			更多问题，请联系赛事组织者➡<a href="mailto:${requestScope.creater.userEmail }"><span>${requestScope.creater.userName }</span></a>
		</div>
	</div>
</body>

<!-- <!-- <script type="text/javascript"> --> -->
<!-- // 	window.onload = function() { -->
<!-- // 		//得到当前时间 -->
<!-- // 		var date_now = new Date(); -->
<!-- // 		//得到当前年份 -->
<!-- // 		var year = date_now.getFullYear(); -->
<!-- // 		//得到当前月份 -->
<!-- // 		//注： -->
<!-- // 		//  1：js中获取Date中的month时，会比当前月份少一个月，所以这里需要先加一 -->
<!-- // 		//  2: 判断当前月份是否小于10，如果小于，那么就在月份的前面加一个 '0' ， 如果大于，就显示当前月份 -->
<!-- // 		var month = date_now.getMonth() + 1 < 10 ? "0" -->
<!-- // 				+ (date_now.getMonth() + 1) : (date_now.getMonth() + 1); -->
<!-- // 		//得到当前日子（多少号） -->
<!-- // 		var date = date_now.getDate() < 10 ? "0" + date_now.getDate() -->
<!-- // 				: date_now.getDate(); -->
<!-- // 		//设置input标签的max属性 -->
<!-- // 		// 			$("matchstarttime").attr("min", year + "-" + month + "-" + date); -->
<!-- // 		// 			$("matchendtime").attr("min", year + "-" + month + "-" + date); -->
<!-- // 		document.getElementById("matchstarttime").setAttribute("min", -->
<!-- // 				year + "-" + month + "-" + date); -->
<!-- // 		document.getElementById("matchendtime").setAttribute("min", -->
<!-- // 				year + "-" + month + "-" + date); -->
<!-- // 	} -->
<!-- <!-- </script> --> -->
</html>