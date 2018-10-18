<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><h4>${title }</h4></title>

<jsp:include page="/inc/lib.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>

	<div class="container">

		<form action="<%=request.getContextPath() %>/14/memberInsertProc.jsp" method="post">
			<table class="table">
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="userId"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPw"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"></td>
					</tr>
					<tr>
						<td>폰번호</td>
						<td><input type="text" name="userPhone"></td>
					</tr>
					<tr>
						<td>메일</td>
						<td><input type="email" name="userEmail"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">회원가입</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>