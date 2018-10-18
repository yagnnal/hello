<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단</title>
</head>
<body>

	<%
		for (int j = 0; j <= 9; j++) {
			out.print(j+"단<br>");
			for (int i = 0; i <= 9; i++) {
				out.print(j + " * " + i + " = " + (i * j) + "<br>");
			}
		}
	%>

</body>
</html>