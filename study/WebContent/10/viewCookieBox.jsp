<%@page import="java.net.URLDecoder"%>
<%@page import="kr.or.nextit.common.util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
<%
	try {
		CookieBox cookieBox = new CookieBox(request);

		Cookie userCookie = cookieBox.getCookie("userCookie");
%>

	쿠키명 : <%=userCookie.getName()%>
	쿠키값 : <%=URLDecoder.decode(userCookie.getValue(), "UTF-8")%>
	userCookie.getVersion() : <%=userCookie.getVersion()%>
	
	쿠키값("userCookie") : <%=cookieBox.getValue("userCookie")%>
	쿠키값("userCookie2") : <%=cookieBox.getValue("userCookie2")%>
	쿠키값("userCookie3") : <%
								if (cookieBox.exists("userCookie3")) {
									cookieBox.getValue("userCookie3");
								} else {
									out.print("쿠키없음");
								}
							%>
</pre>
	<%
		} catch (Exception ex) {
			out.println(ex.getMessage());
		}
	%>
	
</body>
</html>