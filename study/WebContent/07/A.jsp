<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A형 입니다.</title>
</head>
<body>
	<pre>
	당신의 이름 :
	<%=request.getParameter("userName")%>
	취미 :	<%
		String[] hobbys = request.getParameterValues("userHobby");
		if (hobbys != null) {
			for (String hobby : hobbys) {
				out.println(hobby);
			}
		} else {
			out.println("userHobby Data is null");

		}
	%>
	<%
		List<String> hello = (List<String>) request.getAttribute("hello");
		if (hello != null) {
			for (String value : hello) {
				out.println(value + "<br>");
			}
		} else {
			out.println("데이터가 널임");
		}
	%>
</pre>
	A형 입니다.

</body>
</html>