<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<pre>
<%=nextit %>
${nextit }
정적

		<%
			for(HashMap<String, Object> item : hobbyItems){
				out.println(item);
			}
		%>

</pre>