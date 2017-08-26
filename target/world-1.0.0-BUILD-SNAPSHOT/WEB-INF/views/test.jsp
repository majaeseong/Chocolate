<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</head>
<body>
	<div>
		<c:forEach var="l" items="${list }">
			<img src="/world/resources/image/${l.image }" style="width:100px;">
			<p>${l.name }</p>
		</c:forEach>
		
		<div id="alist">
		</div>
	</div>
	
	<script>
		var pageNum=1;
		
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
			if($(window).scrollTop() >= $(document).height() - $(window).height()){
				pageNum++;
		    	 var url = "ttest?pageNum="+pageNum;
		    	 
			 $.get(url, function(data,status){
			 	if(status!=='success'){
			 		return;
			 	}
			 	
			 	
			 	data.forEach(function(obj){
			 		var tx= "<div>"
		   			 + "<img src='/world/resources/image/" + obj.image + "' width='100'>"
		   			 + "<p>" + obj.name + "</p>"
		   			 + "</div>";
			 		 $("#alist").append(tx).hide().fadeIn(500);
				});
		     });
			 
			}
		});
		
 </script>
 
</body>
</html>