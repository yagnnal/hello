<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.nextit.login.service.LoginVo"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
				   "java", 
				   "oracle");

		
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT * FROM TB_MEMBER2 ");
		sql.append(" WHERE	mem_id = ? ");
		sql.append(" AND	mem_PW = ? ");
		
		pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1, request.getParameter("userId"));
		pstmt.setString(2, request.getParameter("userPw"));
		
		rs = pstmt.executeQuery();
		
		if (rs.next()){
			LoginVo loginInfo = new LoginVo();
			loginInfo.setUserId(rs.getString("mem_id"));
			loginInfo.setUserName(rs.getString("mem_name"));
			loginInfo.setUserEmail(rs.getString("mem_email"));
			loginInfo.setResult(true);
			loginInfo.setMessage("정상 로그인 ");
			
			session.setAttribute("loginInfo", loginInfo);
				
			
		} else {
			session.invalidate();
		}
		
	} catch (SQLException ex){
		ex.printStackTrace();
	} finally {
		if (rs != null){ // 널이 아닐 경우에만 close 실행 할께용
			try {  // close 할때 에러를 출력하지 않을깨용
				rs.close();	
			} catch (Exception ex){}
		}
		if (pstmt != null){ // 널이 아닐 경우에만 close 실행 할께용
			try {  // close 할때 에러를 출력하지 않을깨용
				pstmt.close();	
			} catch (Exception ex){}
		}
		if (conn != null){ // 널이 아닐 경우에만 close 실행 할께용
			try {  // close 할때 에러를 출력하지 않을깨용
				conn.close();	
			} catch (Exception ex){}
		}		
		
	}


	CookieBox cookieBox = new CookieBox(request);

	String userRemember = request.getParameter("userRemember");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");

	if ("Y".equals(userRemember)) {
		Cookie cId = CookieBox.createCookie("userId", userId);
		Cookie cRemember = CookieBox.createCookie("userRemember", userRemember);
		response.addCookie(cId);
		response.addCookie(cRemember);
	} else {
		Cookie cId = CookieBox.createCookie("userId", "", "/", 0);
		Cookie cRemember = CookieBox.createCookie("userRemember", "", "/", 0);
		response.addCookie(cId);
		response.addCookie(cRemember);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	요청신 ID : ${param.userId }
	요청신 PW : ${param.userPw }
	아이디 저장 유무 : ${param.userRemember }
<%
	out.println(session.getId());
// 	out.println(session.getCreationTime());
// 	out.println(session.getLastAccessedTime());
	 
	response.sendRedirect(String.format("%s/13/loginForm.jsp", request.getContextPath()));
	
%>
 
</pre>




</body>
</html>