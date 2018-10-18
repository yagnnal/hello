<%@page import="kr.or.nextit.member.impl.MemberServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="kr.or.nextit.member.*" %>    
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String userPw = request.getParameter("userPw");
	String userHp = request.getParameter("userHp");
	String userSex = request.getParameter("userSex");
	String[] userHobby = request.getParameterValues("userHobby");
	String userEmail = request.getParameter("userEmail");
	
	for(String hobby : userHobby){
		out.print(hobby);
	}
	
	HashMap<String, Object> params = new HashMap();
	params.put("userId", userId);
	params.put("userName", userName);
	params.put("userPw", userPw);
	params.put("userHp", userHp);
	params.put("userSex", userSex);
	params.put("userHobby", userHobby);
	params.put("userEmail", userEmail);
	
	MemberService memService = new  MemberServiceImpl();
	memService.insertUserInfo(params);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<pre>
	el tag
	이름 ${param.userName}
	아이디 ${param.userId}
	이메일 ${param.userEmail}
</pre>

<pre>
	request
	이름 <%=request.getParameter("userName") %>
	아이디 <%=request.getParameter("userId") %>
	이메일 <%=request.getParameter("userEmail") %>
</pre>

</body>
</html>