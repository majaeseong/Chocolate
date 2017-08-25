<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact Us</title>
<style>
body{
margin-top:80px;
}
.img2{
width:42px;
height:42px;
margin-right:12px;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
	</div>
	
	<center>
		<h3>오시는 길</h3>
		<div id="map" style="width:770px;height:470px"></div>
		
		<br>
		
		<div style="float:left;width:30%;">　</div>

		<div style="float:left;width:39%;">
			<h3>교통편 안내</h3>
			<table>
				<tr>
					<th><img src="https://image.flaticon.com/icons/svg/263/263072.svg" class="img2"></th>
					<td>경산시 대동</td>
					
					<th><img src="http://www.kbri.re.kr/new/images/intro/ico_traffic01.jpg"></th>
					<td>영남대 건너:309,649,909,609</td>
				</tr>
				<tr>
					<th><img src="https://image.flaticon.com/icons/svg/263/263137.svg" class="img2"></th>
					<td>010-507-4444</td>
				
					<th><img src="http://www.kbri.re.kr/new/images/intro/ico_traffic02.jpg"></th>
					<td>지하철 2호선 : 영남대역</td>
				</tr>
				<tr>
					<th><img src="https://image.flaticon.com/icons/svg/263/263093.svg" class="img2"></th>
					<td>cpintna@naver.com</td>
					
					<th><img src="http://www.kbri.re.kr/new/images/intro/ico_traffic03.jpg"></th>
					<td>영남대역 네비게이션 하차 후 전화주세요</td>
				</tr>
			</table>
		</div>
		<div style="float:left;width:30%;">　</div>
	</center>

	<script>		
		function initMap() {
			  var myLatLng = {lat: 35.8342797, lng: 128.7427578};
	
			  var map = new google.maps.Map(document.getElementById('map'), {
			    zoom: 16,
			    center: myLatLng
			  });
	
			  var marker = new google.maps.Marker({
			    position: myLatLng,
			    map: map,
			    title: '회사 이름'
			  });
			}
	</script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0G-3KRuCi58ENbMWqZk_Xfr0eFi70sBQ&callback=initMap"
		async defer></script>
</body>
</html>