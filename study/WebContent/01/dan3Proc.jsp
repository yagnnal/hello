<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

mm 변수값 : <%=request.getParameter("mm")%> <br>
nn 변수값 : <%=request.getParameter("nn")%> <br>

<%

	int mm = Integer.parseInt(request.getParameter("mm"));
	int nn = Integer.parseInt(request.getParameter("nn"));
	int dan = mm * nn;

%>
<%=mm%> * <%=nn%> = <%=dan%>
<br>

<a href="<%=request.getContextPath()%>/01/dan3.jsp"> 다시하기 </a>

</body>
</html>