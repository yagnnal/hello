<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/inc/lib.jsp"/>
<body>
<jsp:include page="/inc/navbar.jsp"/>
<form action="<%=request.getContextPath()%>/07/inputProc2.jsp" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<input type="checkbox" name="userHobby" value="A01"> 야구	<br>
					<input type="checkbox" name="userHobby" value="A02"> 축구	<br>
					<input type="checkbox" name="userHobby" value="A03"> 농구	<br>
					<input type="checkbox" name="userHobby" value="A04"> 배구	<br>
				</td>
			</tr>
			<tr>
				<td>혈액형</td>
				<td>
					<input type="radio" name="userBlood" value="A"> A형 <br>
					<input type="radio" name="userBlood" value="B"> B형 <br>
					<input type="radio" name="userBlood" value="O"> O형 <br>
					<input type="radio" name="userBlood" value="AB"> AB형 <br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">전송</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>

</body>
</html>