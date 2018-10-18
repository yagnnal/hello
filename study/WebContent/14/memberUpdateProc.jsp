<%@page import="kr.or.nextit.mber.service.MberVO"%>
<%@page import="kr.or.nextit.mber.service.impl.TestMberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String memId = request.getParameter("userId");
	String memPwd = request.getParameter("userPw");
	String memName = request.getParameter("userName");
	String memPhone = request.getParameter("userPhone");
	String memEmail = request.getParameter("userEmail");

	MberService test = new TestMberServiceImpl();
	MberVO testVo = test.updateMemberItem(memId, memPwd, memName, memPhone, memEmail);
	
	MberService mber = new MberServiceImpl();
	MberVO mberVo = mber.updateMemberItem(memId, memPwd, memName, memPhone, memEmail);
	
	if (mberVo.isState()){
		// 뷰 페이지 이동
		StringBuilder url = new StringBuilder();
		url.append(request.getContextPath());
		url.append("/14/memberViewForm.jsp");
		url.append("?memId=");
		url.append(mberVo.getMemId());
		
		response.sendRedirect(url.toString());
	}
	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>

	<div class="container">
	
	<%
	if (!mberVo.isState()){
		// 에러 메시지 출력
		%>
			<pre>
			다음과 같은 에러가 발생 하였습니다. <br>
			<%=mberVo.getMessage() %>
			
			</pre>
			<script type="text/javascript">
				 message = '<%=mberVo.getMessage() %>';
				alert(message);
			</script>
			
		<%
	}
	
	%>
	
	
	</div>












</body>
</html>