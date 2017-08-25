<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
margin-top:80px;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
	
	<center>
		<table style="width:50%;text-align: center">
			<tr>
				<th>No.</th>
				<th>작성자</th>
				<th>제목</th>
				<th>답변 여부</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="l" items="${qnaList}">
				<tr>
					<td>${l.id }</td>
					<td>${l.memid }</td>
					<td>
						<a href="qna_detail?id=${l.id }">
							${l.title }
						</a>	
					</td>
					<td>
						<c:if test="${l.repyn==0 }">미답변</c:if>
						<c:if test="${l.repyn==1 }">답변 완료</c:if>
					</td>
					<td>${l.regtime }</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>