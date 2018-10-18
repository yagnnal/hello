<%@page import="kr.or.nextit.mber.service.MberVO"%>
<%@page import="kr.or.nextit.mber.service.impl.MberServiceImpl"%>
<%@page import="kr.or.nextit.mber.service.MberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = request.getParameter("memId");
	MberService mberService = new MberServiceImpl();
	MberVO mberVo = mberService.getMemberItem(memId);
	
	request.setAttribute("userInfo", mberVo);

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

		<form action="<%=request.getContextPath() %>/14/memberUpdateProc.jsp" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="userId"
							value="${userInfo.memId}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPw"
								value="${userInfo.memPw }"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"
								value="${userInfo.memName }"></td>
					</tr>
					<tr>
						<td>폰번호</td>
						<td><input type="text" name="userPhone"
								value="${userInfo.memPhone }"></td>
					</tr>
					<tr>
						<td>메일</td>
						<td><input type="email" name="userEmail"
								value="${userInfo.memEmail }"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">회원수정</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>

</html>