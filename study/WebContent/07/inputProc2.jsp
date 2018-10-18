<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.List" %>
	<%@ page import="java.util.ArrayList" %>
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
	<%
		List<String> hello = new ArrayList();
		hello.add("안녕하세요");
		hello.add("반갑");
		hello.add("이름뭐임?");
		
		request.setAttribute("hello", hello);
	%>
	

	이름 : ${param.userName }	
	취미 : 
	<%
		String[] hobbys = request.getParameterValues("userHobby");
	if(hobbys != null){
		for(String hobby : hobbys){
			out.println(hobby);
		}
	}else{
		out.println("userHobby Data is null");
		
	}
	%>
	혈액형 :
	<%
	String blood = request.getParameter("userBlood");
	out.println(blood);
	
	StringBuilder path = new StringBuilder();
	
	switch(blood){
	case "A" :
		hello.add("A형 입니다.");
		break;
	case "B" :
		hello.add("B형 입니다.");
		break;
	case "O" :
		hello.add("O형 입니다.");
		break;
	case "AB" :
		hello.add("AB형 입니다.");
		break;
	default :
		hello.add("모름");
	}
	
	//path = request.getContextPath()+"/07/"+ blood + ".jsp?blood=" + blood;
	path.setLength(0);	// 0 번지 부터 재사용
	path = new StringBuilder();	// 
	
	path.append(request.getContextPath());
	path.append("/07/");
	path.append(blood);
	path.append(".jsp");

	out.println(path.toString());
	//response.sendRedirect(path.toString());
	%>
	<!-- forward는 주소창에 주소 안바뀜 내가 가지고 있는 데이터를 넘겨줌-->
	<jsp:forward page="<%=path.toString()%>"></jsp:forward>
</pre>
</body>
</html>