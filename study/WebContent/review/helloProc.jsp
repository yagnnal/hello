<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="kr.or.nextit.review.service.ReViewVO"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.nextit.review.service.ReviewService" %>
<%@page import="kr.or.nextit.function.service.CommCodeVO"%>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>

<%
	ReviewService paramService = new ReviewService();
HashMap<String, Object> hachMap = paramService.getRequestParamsTest(request);

out.println(hachMap.get("uName"));
out.println(hachMap.get("uAge"));

out.println(request.getParameter("userName"));
out.println(request.getParameter("userAge"));

// List<CommCodeVO> hobby = (List<CommCodeVO>) hachMap.get("hobbyList");

// 선택한거만 가져옴
String[] uHobby = request.getParameterValues("userHobby");

String[] selectHobby =paramService.selectHobby(uHobby);
for(String hobby : selectHobby){
	out.println(hobby);
}

/* 	for (String item : uHobby) {
		//내가 선택한 값
		//out.println(items);
		for (CommCodeVO hitem : hobby) {
			// hobby리스트에 있는 모든 값
			if (item.equals(hitem.getKey())) {
				//내가 선택한 value와 hobby리스트의 key값 비교해서 선택한거만 이름 출력해줌
				out.println(String.format("%s (%s) : 당신이 선택한 취미", hitem.getValue(), hitem.getKey()));
				break;
			} else {
				//out.println(String.format("%s (%s)", hitem.getValue(), hitem.getKey()));
			}
		}
	} */
%>

======================================================================================
코드 목록
<%
	ReviewService.getRequestCodeTest(request);

	List<ReViewVO> cList = (List<ReViewVO>)request.getAttribute("codeList");
	
	for(ReViewVO value : cList){
		out.println(String.format("%s (%s)", value.getName(),value.getCode()));
	}
%>

======================================================================================

회원 목록
<%
	ReviewService service = new ReviewService();
	service.getRequestTest(request);
	
	List<String> mList = (List<String>)request.getAttribute("memberList");

	for(String value : mList){
		out.println(value);
	}
%>


======================================================================================
	나이 3살이면 "이벤트 당첨" 문구 출력
	<%
	int age = Integer.parseInt(request.getParameter("userAge"));
	if(age == 3){
		out.println(String.format("%s살 이벤트 당첨", age));
	}else{
		out.println(String.format("%s살 이벤트 다음기회에", age));	
	}
	
	String result =(age == 3 ? "축하" : "다음에");
	out.println(result);
	
	%>
	
	표현식 : <%=(age == 3 ? "축하" : "다음에") %>
	el == ${param.userAge == 3 ? "경축" : "꽝"}
======================================================================================
	이름
	request.getParameter("userName")	:	<%=request.getParameter("userName") %>
	
	param.userName	:	${param.userName }
======================================================================================
	나이
	request.getParameter("userAge")	:	<%=request.getParameter("userAge") %>
	
	param.userAge	:	${param.userAge }
======================================================================================
<%
request.setAttribute("testName", "멋진 녀석들");
request.setAttribute("testAge", 50);

%>

request.getAttribute("testName") : <%=request.getAttribute("testName") %>

el request.setAttribute : ${testName}
el request.setAttribute : ${testAge}




</pre>
</body>
</html>