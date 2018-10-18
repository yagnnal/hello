<%@page import="java.util.Enumeration"%>
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
당신의 IP :  <%=request.getRemoteAddr() %>
Header 정보
<%
	Enumeration headers = request.getHeaderNames();

	while(headers.hasMoreElements()){
		String name = (String) headers.nextElement();
//		out.print(name + " : " + request.getHeader(name)+"<br>");
		out.print(String.format("%s : %s <br>", name, request.getHeader(name)));
	}

%>
</pre>

</body>
</html>