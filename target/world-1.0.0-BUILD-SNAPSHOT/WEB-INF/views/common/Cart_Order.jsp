<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.left_fixed
        {
            height:70px;
            width:20%;
            position:fixed;
            top:30%;
            left:0px;
            background-color:white;
            z-index:10;
        }
</style>
</head>
<body>
	<div class="left_fixed">
		<a href="cartview">CartView</a>
		<br>
		<a href="orderview">OrderView</a>
		<br>
		<a href="allorderview">AllOrderView</a>
	</div>
</body>
</html>