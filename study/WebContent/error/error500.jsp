<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 여기가 에러페이지다 어떤 exception인지 알 수 있음--%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	
	<div class="container">
		시스템에서 에러가 발생함
		<br>
		김규리 관리자에게 전화(000-000-0000)
		
		김규리가 알려주는 에러메시지<br>
		<hr>
		에러 타입 : <%=exception.getClass().getName() %><br>
		에러 메시지 : <%=exception.getMessage() %><br>
	</div>
	
</body>
</html>