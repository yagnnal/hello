<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>
	
	<div class="container">

		<table class="table">
			<tr>
				<td>고유키</td>
				<td>${boardView.seqNo }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${boardView.title }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${boardView.viewCount }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${boardView.contents }</pre></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${boardView.regDate }</td>
			</tr>
			<tr>
				<td>등록자</td>
				<td>${boardView.regUser }</td>           
			</tr>
			<tr>
				<td>수정일</td>
				<td>${boardView.upDate }</td>           
			</tr>
			<tr>
				<td>수정자</td>
				<td>${boardView.upUser }</td>           
			</tr>
			
			<tr>
				<td colspan="2">
					<a href="<c:url value="/board/boardList.do"/>">목록</a>
					
					<c:url var="updatePage" value="/board/boardUpdateForm.do">
						<c:param name="seqNo" value="${boardView.seqNo }"/>
					</c:url>
					<a href="${updatePage }">수정</a>
					
					<c:url var="deleteProc" value="/board/boardDeleteProc.do">
						<c:param name="seqNo" value="${boardView.seqNo }"/>
					</c:url>
					<a href="${deleteProc }">삭제</a>
				</td>
				
			</tr>
		
		</table>
	</div>
	
</body>
</html>