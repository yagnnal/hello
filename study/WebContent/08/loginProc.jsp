<%@ page import="java.net.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--  get방식 인코딩 server.xml에서 URIEncording 해줘야함 -->

아이디 : ${param.userId } <br>
비밀번호 : ${param.userPw } <br>

<%
	// 아이디 master / 비번 12345 로그인 성공
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	if("master".equals(userId) && "12345".equals(userPw)){
		application.log(String.format("로그인 %s", true));
		
		StringBuilder redirect = new StringBuilder();
		redirect.append("/index.jsp?");
		redirect.append(String.format("result=%s", true));
		redirect.append(String.format("&message=%s",URLEncoder.encode("정상 로그인 됨","UTF-8")));
		
		response.sendRedirect(redirect.toString());
		//		response.sendRedirect("/index.jsp");

	}else{
		application.log(String.format("로그인 %s", false));
		request.setAttribute("result", false);
		request.setAttribute("message", "아이디 또는 비밀번호 누락");
%>
	<jsp:forward page="/08/loginForm.jsp"></jsp:forward>
<%
//		response.sendRedirect("/08/loginForm.jsp");
	}
%>



</body>
</html>