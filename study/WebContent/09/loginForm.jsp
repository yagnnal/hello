<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String userId = "";
	CookieBox cookieBox = new CookieBox(request);
	if(cookieBox.exists("userId")){
		userId = cookieBox.getValue("userId");
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var result = '${result}'
if(result != null && result != ""){
	alert('${message}')
}
</script>

</head>
<body>

${result }
${message }

<form action="<%=request.getContextPath()%>/09/loginProc.jsp" method="post">
	<table class="table">
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" value="<%=userId%>">
				${cookie.userRemember.value eq 'Y' ? cookie.userId.value : "" }
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPw"></td>
			</tr>
			<tr>
				<td>아이디 저장</td>
				<td><input type="checkbox" name="userRemember" value="Y" ${cookie.userRemember.value eq 'Y' ? 'checked="checked"' : '' }></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">로그인</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>