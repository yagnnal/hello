<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
		당신의 정보
		
		request.getContextPath() : <%=request.getContextPath()%>
		IP	: <%=request.getRemoteAddr() %>
		메서드	: <%=request.getMethod() %>
		URI	: <%=request.getRequestURI() %>
		URL	: <%=request.getRequestURL() %>
	</pre>
</body>
</html> 