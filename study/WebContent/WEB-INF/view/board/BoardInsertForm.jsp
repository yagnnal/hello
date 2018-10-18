<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글등록</title>

<c:import url="/inc/lib.jsp"></c:import>

</head>
<body>
	<c:import url="/inc/navbar.jsp"></c:import>

	<div class="container">
		<form action="/board/boardInsertProc.do">
			<table class="table">
				<tbody>
					<tr>
						<td>게시판 종류</td>
						<td>
							<select name="serviceType">
								<option value="NOTICE">공지사항</option>
								<option value="QNA">Q&A</option>
								<option value="FAQ">FAQ</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="40" name="contents"></textarea>
						</td>
					</tr>
					<tr>
						<th><button type="submit">저장</button></th>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>