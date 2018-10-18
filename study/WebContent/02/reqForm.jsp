<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.or.nextit.function.MemberUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title }</title>

<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<h4>${title }</h4>
	<h4>${title2 }</h4>
		<form action="<%=request.getContextPath()%>/02/reqProc.jsp" method="post">
			
			<table class="table">
				<tbody>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" class="form-control"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><select name="sex" class="form-control">
								<option value="M">남자</option>
								<option value="W">여자</option>
								<option value="G">모름</option>
						</select></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="age" class="form-control"></td>
					</tr>
					<tr>
						<td>취미</td>
						<td>
							<%
								List<HashMap<String, Object>> items = MemberUtil.getDisplayHobbyList();

								for (HashMap<String, Object> item : items) {
									//	out.println(item.get("key"));
									//	out.println(item.get("display"));
							%> 
							<input type="checkbox" name="hobby" value="<%=item.get("key")%>"> <%=item.get("display")%> <br> 
							<%
							 	}
							%>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit" class="btn btn-default">전송</button></td>
					</tr>
				</tbody>
			</table>

		</form>
	</div>

</body>
</html>