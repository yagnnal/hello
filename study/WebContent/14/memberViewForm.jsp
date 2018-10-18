<%@page import="kr.or.nextit.mber.service.MberVO"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");

MberService mber = new MberServiceImpl();

String memId = request.getParameter("memId");
MberVO result = mber.getMemberItem(memId);

out.println(result);

request.setAttribute("result", result);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<table class="table">
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${result.memId }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${result.memName }</td>
				</tr>
				<tr>
					<th>폰 번호</th>
					<td>${result.memPhone }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${result.memEmail }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${result.regDate }</td>
				</tr>
			</tbody>
		</table>

<%
String url = request.getContextPath();
%>
<table class="table">
	<tbody>
		<tr>
			<td>
				<%-- <a href="<%=url%>/14/memberListForm.jsp"> --%>
				<a href="<c:url value="/14/memberListForm.jsp"/>">
					목록
				</a> 
			</td>
			<td>
				<%-- <a href="<%=url%>/14/memberUpdateForm.jsp?memId=${result.memId }"> --%>
				<c:url var="updatePage" value="/14/memberUpdateForm.jsp">
					<c:param name="memId" value="${result.memId }"/>
					<c:param name="memTest" value="테스트중"/>
				</c:url>
				<a href="${updatePage }">
					수정
				</a> 
			</td>
			<td>
				<a href="<%=url%>/14/memberDeleteProc.jsp?memId=${result.memId }">
					삭제
				</a> 
			</td>
		</tr>
	</tbody>
</table>
	</div>
</body>
</html>