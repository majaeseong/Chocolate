<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복체크</title>
<style type="text/css">
	body{
		font-family: Verdana;
	}
	#wrap{
		margin: 0 20px;
	}
	h1 {
		font-family: "Times New Roman", Times, serif;
		font-size: 45px;
		color: #CCC;
		font-weight: normal;
	}
	input[type=button], input[type=submit] {
		float: right;
	}
</style>
</head>
<body>
	<div id="wrap">
		<h1>ID 중복확인</h1>
		<form method="post" name="mm" style="margin-right:0" action="id_check" >
			User ID <input type=text name="id" value="">
			<input type=submit value="검색" class="submit"><br>
			<div style="margin-top: 20px">
				<c:if test="${result == -1}">
					<script type="text/javascript">
						document.mm.id.value="";
					</script>
					${id}는 사용 불가능합니다.
				</c:if>
				<c:if test="${result==1}">
					${id}는 사용 가능한 ID입니다.
					<input type="button" value="사용" class="cancel" onclick="idok()">
				</c:if>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		function idok(){
			opener.formm.id.value="${id}";
			self.close();
		}
	</script>
	
</body>
</html>