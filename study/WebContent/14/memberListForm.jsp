
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
		<%
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;

			StringBuilder query = new StringBuilder();

			query.append("		SELECT	                    ");
			query.append("		   	mem_id,                 ");
			query.append("		   	mem_pw,                 ");
			query.append("		   	mem_name,               ");
			query.append("		   	mem_phone,              ");
			query.append("		   	mem_email,              ");
			query.append("		   	reg_date                ");
			query.append("		FROM                        ");
			query.append("		    tb_member2              ");
			query.append("		order by reg_date desc      ");
			
			
			
			
		%>
		<table class="table">
			<thead>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>이메일</th>
				<th>가입일</th>
			</thead>
			<tbody>
				<% 
					try{
						Class.forName("oracle.jdbc.driver.OracleDriver");
						conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
						
						psmt = conn.prepareStatement(query.toString());
						
						rs = psmt.executeQuery();
						
						while(rs.next()){
							String memId = rs.getString("mem_id");
					
				%>
				<tr>
					<td>
						<c:url var="viewPage" value="/14/memberViewForm.jsp">
							<c:param name="memId" value="<%=memId%>"></c:param>
						</c:url>

						<c:set var="memId" value="<%=memId %>"></c:set>
						<c:url var="viewPage2" value="/14/memberViewForm.jsp">
							<c:param name="memId" value="${memId}"></c:param>
						</c:url>
						
						<%-- <a href="<%=request.getContextPath()%>/14/memberViewForm.jsp?memId=<%=rs.getString("mem_id")%>"> --%>
						
						<a href="${viewPage2 }">
							<%=rs.getString("mem_id") %>
						</a>
						
					</td>
					<td><%=rs.getString("mem_name") %></td>
					<td><%=rs.getString("mem_phone") %></td>
					<td><%=rs.getString("mem_email") %></td>
					<td><%=rs.getString("reg_date") %></td>
				</tr>
				<%
						}
					}catch(Exception ex){
						out.println(ex.getMessage());
						
					}finally{
						if(rs != null){
							try{rs.close();} catch(Exception e){}
						}
						if(psmt != null){
							try{psmt.close();} catch(Exception e){}
						}
						if(conn != null){
							try{conn.close();} catch(Exception e){}
						}
					}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>