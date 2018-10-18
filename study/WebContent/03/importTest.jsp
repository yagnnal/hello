<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl Import</title>

<%-- <jsp:include page="/inc/lib.jsp"></jsp:include> --%>
<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>

<%-- 	<jsp:include page="/inc/navbar.jsp"></jsp:include> --%>
 <c:import url="/inc/navbar.jsp"></c:import>
 	
	<div class="container">
	<!-- 동적 include랑 같음 -->
		<c:import url="/inc/menu.jsp">
			<c:param name="test" value="menu-Test"></c:param>
		</c:import>
	</div>
	
</body>
</html>