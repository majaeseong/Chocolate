<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Join</title>
<style>
body{
margin-top:80px;
}
.container {
  width: 70%;
  height: 70%;
  margin: 40px auto;
}
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}
.centered {
  position: relative;
  display: inline-block;
 
  width: 50%;
  padding: 1em;
}
</style>
</head>
<body>
	<form name="formm" method="post" action="join" onsubmit="return checkValue()">
		
		<div>
			<%@include file='../common/header.jsp' %>
		</div>
		
		<br><br><br>

		<div class="container">
		  <div class="outer">
		    <div class="inner">
		      <div class="centered">
		        <fieldset>
					<legend>Sign up</legend>
				        <table>
						<tr>
							<td>User Id</td>
							<td><input type="text" name="id" id="id"></td>
							<td>
								<input type="button" value="중복체크" onclick="openIdChk()">
							</td>
						</tr>
						
						<tr>
							<td>Password</td>
							<td><input type="password" name="pwd"></td>
							<td></td>
						</tr>
						
						<tr>
							<td>Check Psw</td>
							<td><input type="password" name="pwdCheck"></td>
							<td></td>
						</tr>
						
						<tr>
							<td>Name</td>
							<td><input type="text" name="name"></td>
							<td></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" name="addr"></td>
							<td></td>
						</tr>
						
						<tr>
							<td colspan="3">
								<input type="submit" value="회원가입">　
							</td>
						</tr>
					</table>
				</fieldset>
		      </div>
		    </div>
		  </div>
		</div>

		
	</form>
	
	<script>
		function checkValue(){
			var form = document.formm;
			if(!form.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
			
			if(!form.pwd.value){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			if(form.pwd.value != form.pwdCheck.value){
				alert("비밀번호를 동일하게 입력하세요");
				return false;
			}
			if(!form.name.value){
				alert("이름을 입력하세요");
				return false;
			}
		}
		
		function openIdChk(){
			
			var form = document.formm;
			if(!form.id.value){
				alert("아이디를 입력하세요");
				return false;
			}
			
	       	var id = document.getElementById('id');
            window.open("id_check?id="+id.value,
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }
	</script>
</body>
</html>