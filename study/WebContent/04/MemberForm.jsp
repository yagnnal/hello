<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.nextit.function.MemberUtil" %>
<%@ page import="kr.or.nextit.function.service.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	MemberUtil utils = new MemberUtil();
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
	
	<form action="/04/memberProc.jsp" method="post">
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" class="form-control"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" class="form-control"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userPw" class="form-control"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="userHp" class="form-control"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<% 
						List<CommCodeVO> items = utils.getSexItems();
						/* for(CommCodeVO item : items){
							out.println(item.getKey());
							out.println(item.getValue());
						} */
					%>
						<select name="userSex">
						<% for(CommCodeVO item : items){%>
							<option value="<%=item.getKey()%>"><%=item.getValue() %></option>
						<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
					<%
					List<CommCodeVO> hobby = utils.getHobbyItems();
					for(CommCodeVO itemHobby : hobby){
					%>
						<input type="checkbox" name="userHobby" value="<%=itemHobby.getKey()%>"> <%=itemHobby.getValue() %><br>
					<%} %>
					</td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td>
						<input type="test" name="userEmail">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">가입</button>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		
	</div>
</body>
</html>