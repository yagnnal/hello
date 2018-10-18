<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
	request.setCharacterEncoding("UTF-8"); 
    request.setAttribute("name", "오선균");
    request.setAttribute("name1", 3);
    request.setAttribute("name2", 0.356);
    
    HashMap<String, Object> item = new HashMap();
    item.put("test","문자열");
    item.put("Integer",44);
    
    request.setAttribute("item", item);
%>

<!-- body 안에 들어갈 내용만 있어야함  -->

<pre>
<%-- 
<%=nextit %>--%>
${nextit}
메뉴를 구성해주셈
<%=request.getParameter("test") %>

el tag : ${param.test}
request.setAttribute el tag : ${name}
request.setAttribute el tag : ${name1}
request.setAttribute el tag : ${name2}

request.setAttribute Map : ${item}
request.setAttribute Map : ${item.test}
request.setAttribute Map : ${item.Integer}

</pre>