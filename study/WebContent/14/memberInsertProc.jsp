<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
	${param.userId } 
	${param.userPw } 
	${param.userName } 
	${param.userPhone }
	${param.userEmail }
</pre>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = 0;
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "java", "oracle");
			
			StringBuilder sql = new StringBuilder();
			
		sql.append("	INSERT INTO tb_member2 ( ") ;
		sql.append("		    mem_id,          ") ;
		sql.append("		    mem_pw,          ") ;
		sql.append("		    mem_name,        ") ;
		sql.append("		    mem_phone,       ") ;
		sql.append("		    mem_email,        ") ;
		sql.append("		    reg_date        ") ;		
		sql.append("		) VALUES (           ") ;
		sql.append("		    ?,               ") ;
		sql.append("		    ?,               ") ;
		sql.append("		    ?,               ") ;
		sql.append("		    ?,               ") ;
		sql.append("		    ?,               ") ;
		sql.append("		    sysdate          ") ;
		sql.append("		)                    ") ;
		
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, request.getParameter("userId"));
		pstmt.setString(2, request.getParameter("userPw"));
		pstmt.setString(3, request.getParameter("userName"));
		pstmt.setString(4, request.getParameter("userPhone"));
		pstmt.setString(5, request.getParameter("userEmail"));
		
		rs = pstmt.executeUpdate();
		
		out.println(rs);
		out.println(rs);
		out.println(rs);
		out.println(rs);
			
		}catch(Exception ex){
			%>
				회원가입 중 다음과 같은 에러 발생
			<%
			out.print(ex.getMessage());
			ex.printStackTrace();
		}finally{
			if(pstmt != null){
				try{pstmt.close();} catch(Exception ex){}
			}
			if(conn != null){
				try{conn.close();} catch(Exception ex){}
			}
		}
		
		
		
		
		
	%>
</body>
</html>