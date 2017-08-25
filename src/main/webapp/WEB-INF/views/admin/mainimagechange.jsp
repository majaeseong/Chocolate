<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Image Change Page</title>
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
	
	<c:forEach var="i" items="${image}">
		<h3>${i.no}번</h3>
		<img src="/world/resources/image/${i.image}" style="width:100%;height:300px;z-index:1;">
	</c:forEach>
	
		<br>

	<form name="frm" action="change" method="post"	enctype="multipart/form-data">
		<table>
			<tr>
				<th>변경할 사진 번호</th>
				<td>
					<select name="no">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>변경할 사진 선택</th>
				<td>
					<input type="file" name="image"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="변경">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>