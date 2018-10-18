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
	<pre>
	이름 : ${param.userName }	
	취미 : 
	<%
		String[] hobbys = request.getParameterValues("userHobby");
		for(String hobby : hobbys){
			out.println(hobby);
		}
	%>
	혈액형 :
	<%
	String blood = request.getParameter("userBlood");
	out.println(blood);
	
	StringBuilder path = new StringBuilder();
	
	switch(blood){
	case "A" :
		out.print("A형 입니다.");
		path.append(request.getContextPath());
		path.append("/07/A.jsp");
		break;
	case "B" :
		out.print("B형 입니다.");
		path.append(request.getContextPath());
		path.append("/07/B.jsp");
		break;
	case "O" :
		out.print("O형 입니다.");
		break;
	case "AB" :
		out.print("AB형 입니다.");
		break;
	default :
		out.print("모름");
	}
	
	//path = request.getContextPath()+"/07/"+ blood + ".jsp?blood=" + blood;
	path.setLength(0);	// 0 번지 부터 재사용
	path = new StringBuilder();	// 
	
	path.append(request.getContextPath());
	path.append("/07/");
	path.append(blood);
	path.append(".jsp?blood=");
	path.append(blood);
	
	response.sendRedirect(path.toString());
	
	%>
</pre>
</body>
</html>