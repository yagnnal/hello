<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Read</title>

<jsp:include page="/inc/lib.jsp"></jsp:include>

</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	<div class="container">
	<pre>
		<%

			String path = application.getRealPath(""); // 서버의 위치정보
			out.println(path);
			path = application.getRealPath("/06/README.txt");
			out.println(path);

			char[] buff = new char[1024];
			int len = -1;

			try (InputStreamReader br = new InputStreamReader(application.getResourceAsStream("/06/README.txt"),"utf-8")) {
				
				out.println(br.toString());
				
				while ((len = br.read(buff)) != -1) {
					out.print(new String(buff, 0, len));
					log(new String(buff, 0, len));
					//out.print("<br>");
				}
			} catch (IOException ex) {
				out.println("예외 발생 : " + ex.getMessage());
			}
		%>
		</pre>
	</div>
</body>
</html>