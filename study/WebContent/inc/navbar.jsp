<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"	aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">${loginInfo.userName } Project</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<%=request.getContextPath()%>/">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/02/reqForm.jsp">Form</a></li>
				<li><a href="<%=request.getContextPath()%>/03/include.jsp">Contact</a></li>
				<li><a href="<%=request.getContextPath()%>/05/bufferTest.jsp">버퍼</a></li>
				<li><a href="<%=request.getContextPath()%>/06/fileRead.jsp">file Read</a></li>
				<li><a href="<%=request.getContextPath()%>/board/boardList.do">게시판(멀티)</a></li>
				<li><a href="<%=request.getContextPath()%>/14/memberInsertForm.jsp">회원가입</a></li>
				<%
					LoginVo loginVo = (LoginVo) session.getAttribute("loginInfo");
					if (loginVo == null) {
				%>
				<li><a href="<%=request.getContextPath()%>/11/loginForm.jsp">로그인</a></li>
				<%
					}else {
				%>
				<li><a href="<%=request.getContextPath()%>/11/logoutProc.jsp"> ${loginInfo.userName }님 로그아웃</a></li>
				<% } %>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
<%
	//out.flush();
	//out.clearBuffer();
%>