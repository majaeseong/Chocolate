<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
<body>
	<form method="post" action="crawlpage">
		KeyWord-> 
		<input type="text" name="word"> 
		<input type="submit" value="검색">
	</form>
</body>
</html>