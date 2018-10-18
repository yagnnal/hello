<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="kr.or.nextit.function.MemberUtil" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String nextit = "변수 test";
	
	List<HashMap<String, Object>> hobbyItems = MemberUtil.getDisplayHobbyList();

	
%>
<%request.setAttribute("nextit", "넥스트 아이티"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/inc/lib.jsp"></jsp:include>

</head>
<body>
    
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
    <div class="container">

      <div class="starter-template">
        <h1>${nextit}</h1>
        <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
      </div>

		<table class="table">
			<tr>
				<td>1</td>
			</tr>
			<tr>
				<td>2</td>
			</tr>
		</table>
		<pre>
		<%
			for(HashMap<String, Object> item : hobbyItems){
				out.println(item);
			}
		%>
		</pre>
		<!-- 변수 넘겨줘야 쓸 수 있음 -->
		============== 동적 ==================
		<jsp:include page="/inc/menu.jsp">
			<jsp:param value="테스트 입니다." name="test" />
		</jsp:include>

		<!-- 이페이지에서 선언한 변수 가져다 쓸 수 있음 -->
		============== 정적 ==================

		<%@ include file="/inc/includeTest.jsp"%>
	</div><!-- /.container -->

</body>
</html> 