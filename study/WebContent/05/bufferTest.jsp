<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- outoFlush : true(dafault)면 그 페이지에 필요한 만큼 버퍼크기 늘어남 -->
<%@ page buffer="4kb" autoFlush="false"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buffer Test</title>
	<jsp:include page="/inc/lib.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<pre>
		out.isAutoFlush() : <%=out.isAutoFlush() %>
		<%
			out.flush();	//	버퍼의 내용 보냄 화면에 보여주기
			out.clearBuffer();	// buffer clear
			out.println(String.format("버퍼사이즈 %d",out.getRemaining()));
			out.flush();
			out.clearBuffer();
		%>
		<%
			for (int i = 1; i <= 9; i++) {
				for (int j = 1; j <= 9; j++) {
					out.println(String.format(" %d * %d = %d", i, j, (i * j)));
					if (i != 5) {
						out.flush();
					}else{
						out.clearBuffer();
					}
				}
			}

			for (int i = 0; i < 1000; i++) {
				out.println(out.getRemaining());
				out.println(i + " 오늘은 월요일, ");

				if ((i % 5) == 0) {
					out.clearBuffer();
				} else {
					out.flush();
					//	out.clearBuffer();
				}
			}
		%>
		여기 부분에 내용 작성
	</pre>
	</div>
</body>
</html>
