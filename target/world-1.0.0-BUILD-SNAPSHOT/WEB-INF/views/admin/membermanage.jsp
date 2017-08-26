<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Management</title>
<style>
body{
margin-top:80px;
}
</style>
</head>
<body>
	
	<form method="post" action="change_member_useyn">
	<center>
		<input type="hidden" id="sortby2" value="${pdto.sortby }">
		<input type="hidden" id="keyword2" value="${pdto.keyword }">
		<div>
			<%@include file='../common/header.jsp' %>
		</div>
	
		<select id="viewwith" onchange="fn_viewwith()">
			<option value="3"
				<c:if test="${pdto.offset==3 }">selected</c:if>
			>3개씩 보기</option>
			<option value="5"
				<c:if test="${pdto.offset==5 }">selected</c:if>
			>5개씩 보기</option>
			<option value="10"
				<c:if test="${pdto.offset==10 }">selected</c:if>
			>10개씩 보기</option>
		</select>
		
		<table style="text-align: center;">
			<tr>
				<th>UserID</th>
				<th>UserName</th>
				<th>UserState</th>
				<th>Check</th>
			</tr>
			
			<c:forEach var="l" items="${list }">
				<tr>
					 <td>${l.id }</td>
					 <td>${l.name }</td>
					 <td>
					 	<c:if test="${l.useyn==0 }">사용 중</c:if>
					 	<c:if test="${l.useyn==1 }">블락</c:if>
					 </td>
					 <td>
					 	<input type="checkbox" name="chk[]" value="${l.id }" />
					 </td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="3">
					<c:forEach var="l" begin="1" end="${count}">
						<a href="membermanage?offset=${pdto.offset}&sortby=${pdto.sortby}&keyword=${pdto.keyword}&pageNum=${l}">${l }</a>　　
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					
				</td>
				<td>
					<input type="submit" value="change_useyn" onclick="return useyn_change()">
				</td>
			</tr>
		</table>
	</center>
	</form>
	<hr>
	<form method="post" action="membermanage">
				<center>
					<select name="sortby">
						<option value="1">ID</option>
						<option value="2">NAME</option>
						<option value="3">ID+NAME</option>
					</select>
					<input type="text" name="keyword"><input type="submit" value="검색"><input type="button" value="전체보기" onclick="location.href='membermanage'">
				</center>
			</form>
	<script type="text/javascript">
		function checkboxSelectQue(n,obj) {
		    var i;
		    var chk = document.getElementsByName(obj);
		    var tot = chk.length;
		    for (i = 0; i < tot; i++) {
		        if (n == 1) chk[i].checked = true;
		        if (n == 2) chk[i].checked = false;
		    }
		}
		
		function fn_viewwith(){ 
			var sort = document.getElementById('sortby2');
			var keyword = document.getElementById('keyword2');
			var ele = document.getElementById('viewwith');
			location.href="membermanage?offset="+ele.value+"&sortby="+sort.value+"&keyword="+keyword.value;

		} 
		
		function useyn_change(){
			if (confirm("잘 선택하셨나요?") == true){
			    return true;
			}else{ 
			    return false;
			}
		}
	    </script>
</body>
</html>