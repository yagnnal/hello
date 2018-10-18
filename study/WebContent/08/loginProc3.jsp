<%@page import="kr.or.nextit.login.service.*"%>
<%@page import="kr.or.nextit.login.impl.*"%>
<%@ page import="java.net.*" %>
<%@page import="kr.or.nextit.login.*"%>

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

아이디 : ${param.userId } <br>
비밀번호 : ${param.userPw } <br>

	<%
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");

		LoginService loginService = new LoginServiceImpl();
		LoginVo loginVo = loginService.loginCheck(userId, userPw);
		
		out.print(loginVo.getMessage());
		out.println(loginVo.isResult());
		out.println(loginVo.getUserEmail());

		loginVo.setUserEmail("test@nextit.or.kr");
		
		out.println(loginVo.getUserEmail());
		
		if(loginVo.isResult()){
			request.setAttribute("loginInfo", loginVo);
		%>
		<jsp:forward page="/index.jsp"></jsp:forward>
		<%
		}else{
			request.setAttribute("loginInfo", loginVo);
		%>
		<jsp:forward page="/08/loginForm.jsp"></jsp:forward>
		<%	
		}

		/* 		loginService.loginCheck(request);
				
				boolean result = (Boolean) request.getAttribute("result");
				String message = (String) request.getAttribute("message");
				
				out.println(result);
				out.println(message); */
	%>
	<jsp:useBean id="login" beanName="login" type="kr.or.nextit.login.service.LoginVo"></jsp:useBean>
	
	${result }
	${message }

</body>
</html>