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
<body>
	<div>
		<%@include file='../common/header.jsp' %>
	</div>
	
	<center>
		<div style="width:100%">
			<form method="post" action="qna_write" enctype="multipart/form-data">
				<table style="width:80%">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" style="width:100%"></td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td>
							<textarea name="content" style="width:100%; height:100px"></textarea>
						</td>
					</tr>

					<tr>
						<td colspan="2" style="text-align: center">
							<input type="submit" value="작성 완료">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>