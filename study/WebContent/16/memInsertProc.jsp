<%@page import="kr.or.nextit.function.service.CommCodeVO"%>
<%@page import="kr.or.nextit.function.service.impl.ComCodeServiceImpl"%>
<%@page import="kr.or.nextit.function.service.ComCodeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");

	ComCodeService codeService = new ComCodeServiceImpl();
	



%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 처리</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
<jsp:include page="/inc/navbar.jsp"></jsp:include>
</head>
<body>

	<div class="container">
		<%
			String[] checkHobby = request.getParameterValues("userHobby");
		
			for(String hobby : checkHobby){
				out.println(hobby);
				CommCodeVO codeItem = codeService.getCodeName(hobby);
				out.println(String.format("%s	(%s) ", codeItem.getKey(),codeItem.getValue()));
			}
		%>
	</div>

</body>
</html>