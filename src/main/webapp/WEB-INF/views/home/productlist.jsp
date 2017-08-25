<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Product</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
body {
	margin-top: 80px;
}

@import
	url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css)
	;

@import url(https://fonts.googleapis.com/css?family=Raleway:400,300,800)
	;

figure.snip1141 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	float: left;
	overflow: hidden;
	margin: 10px 1%;
	min-width: 220px;
	max-width: 310px;
	max-height: 310px;
	width: 100%;
	background: #000000;
	color: #ffffff;
	text-align: left;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

figure.snip1141 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
}

figure.snip1141 img {
	max-width: 100%;
	position: relative;
	opacity: 0.9;
}

figure.snip1141 .circle {
	position: relative;
	height: 55px;
	width: 55px;
	top: 0%;
	left: 0%;
	background-color: rgba(0, 0, 0, 0.4);
	border-radius: 50%;
	text-align: center;
}

figure.snip1141 .circle:before, figure.snip1141 .circle:after {
	border: 2px solid white;
	border-right-color: transparent;
	position: absolute;
	content: '';
	height: 100%;
	width: 100%;
	top: 0;
	left: 0;
	border-radius: 50%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	-webkit-transition-delay: 0.3s;
	transition-delay: 0.3s;
}

figure.snip1141 .circle:before {
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}

figure.snip1141 .circle:after {
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

figure.snip1141 figcaption {
	position: absolute;
	top: 20px;
	left: 20px;
	display: block;
	width: 100%;
	overflow: hidden;
}

figure.snip1141 h2 {
	position: absolute;
	margin: 0;
	text-transform: uppercase;
	font-weight: 300;
	letter-spacing: -1px;
	line-height: 55px;
	top: 0%;
	left: 0%;
	width: 100%;
	padding: 0 20px;
	opacity: 0;
	-webkit-transform: translateX(-10%);
	transform: translateX(-10%);
}

figure.snip1141 .icon {
	overflow: hidden;
	width: 100%;
	position: absolute;
}

figure.snip1141 i {
	color: white;
	font-size: 48px;
	line-height: 55px;
	-webkit-transition-delay: 0.3s;
	transition-delay: 0.3s;
}

figure.snip1141 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

figure.snip1141:hover .circle, figure.snip1141.hover .circle {
	background-color: rgba(0, 0, 0, 0);
}

figure.snip1141:hover .circle:before, figure.snip1141.hover .circle:before,
	figure.snip1141:hover .circle:after, figure.snip1141.hover .circle:after
	{
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg);
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
}

figure.snip1141:hover h2, figure.snip1141.hover h2 {
	opacity: 1;
	-webkit-transition-delay: 0.3s;
	transition-delay: 0.3s;
	-webkit-transform: translateX(0);
	transform: translateX(0);
}

figure.snip1141:hover img, figure.snip1141.hover img {
	opacity: 0.35;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

figure.snip1141:hover i, figure.snip1141.hover i {
	opacity: 0;
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
	
	<form method="post" action="productlist">
		<input type="hidden" id="keyword2" value="${pdto.keyword}">
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>

	<center>
		<%
			int count = 0;
		%>
		<div style="display: inline-block;">
			<table style="width: 100%">
				<tr>
					<c:forEach var="l" items="${list }">
						<td><figure class="snip1141"> <img
								src="/world/resources/image/${l.image }"
								style="width: 315px; height: 230px"> <figcaption>
							<div class="circle">
								<i class="ion-ios-plus-empty"></i> </i>
							</div>
							<h2>${l.name }</h2>
							</figcaption> <a href="productdetail?id=${l.id }"></a> </figure></td>
						<%
							count++;
								if (count == 3) {
						%>
					
				</tr>
				<tr>
					<%
						count = 0;
							}
					%>
					</c:forEach>
				</tr>
				
			</table>
			<div id="alist">
			
			</div>
		</div>
	</center>
<script>
		var pageNum=1;
		var keyword=document.getElementById('keyword2');
		
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면
			if($(window).scrollTop() >= $(document).height() - $(window).height()){
				pageNum++;
		    	 var url = "scroll_page?pageNum="+pageNum+"&keyword="+keyword.value;
		    	 
			 $.get(url, function(data,status){
			 	if(status!=='success'){
			 		return;
			 	}
			 	
			 	var count=0;
			 	var tx="<table><tr>";
			 	data.forEach(function(obj){
			 		count++;
			 		 		
			 		tx += "<td> <figure class='snip1141'>"
		   			 + "<img src='/world/resources/image/" + obj.image + "' style='width: 315px; height: 230px'> <figcaption>"
		   			 + "<div class='circle'>" + "<i class='ion-ios-plus-empty'></i> </i>" + "</div>"
		   			 + "<h2>"+obj.name+"</h2>"
		   			 + "</figcaption>"+ "<a href='productdetail?id="+obj.id+ "'></a> </figure> </td>";
			 		
		   			if(count%3==0){
			 			tx+= "</tr> <tr>";
			 			count=0;
			 		}
				});
			 	tx+="</table>";
			 	$('#alist').append(tx);
		     });
			 
			}
		});
		
 </script>
</body>
</html>