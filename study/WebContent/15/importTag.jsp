<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<br> <br>
		<h3>import / out 태그 예제</h3>
		<%
			out.println("out 기본객체가 <br>출력한 내용");
		%>

		<br>
		<pre>
			<!-- <> 태그를 화면에 출력하고자 할때 escapeXml="true" -->
			escapeXml="false"	:	<c:out value="out 태그가 <br>출력한 내용"
				escapeXml="false" />
			escapeXml="true"	:	<c:out value="out 태그가 <br>출력한 내용" escapeXml="true" />
		</pre>

		<form action="importTag.jsp" method="get">
			<select name="where">
				<option value="nexearch"
					${param.where eq 'nexearch' ? 'selected="selected"' : ''}>통합</option>
				<option value="article"
					${param.where eq 'article' ? 'selected="selected"' : ''}>카페</option>
				<option value="post"
					${param.where eq 'post' ? 'selected="selected"' : ''}>블로그</option>
			</select> <input type="text" size="30" name="query" value="${param.query }">
			<input type="submit" value="검색">
		</form>

		<!-- &lt ;c:import &gt; include와 같음  -->
		<%--  <c:import> include와 같음 --%>
		<hr color="red">
		<p>검색결과가 아래에 표출됩니다.</p>
		<c:if test="${not empty param.query }">
			<c:url var="searchURL"
				value="https://search.naver.com/search.naver?ie=utf-8" />
			<c:import url="${searchURL}" var="result" scope="request"
				charEncoding="utf-8">
				<c:param name="where" value="${param.where }" />
				<c:param name="query" value="${param.query }" />
			</c:import>
		 
			<p>${result }</p>
		</c:if>


	</div>


</body>
</html>