<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.layer_fixed
        {
            height:70px;
            width:100%;
            position:fixed;
            top:0px;
            left:0px;
            background-color:white;
            z-index:10;
        }
#nav_menu ul {
	list-style-type: none;
	/* 좌측 여백 없애기 */
	padding-left: 0px;
	/* 우측 정렬 하기 */
	float: right;
}

#nav_menu ul li {
	display: inline;
	/* border-left: 1px solid #c0c0c0;
	/* 테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */
	padding: 0px 10px 0px 10px;
	/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽; */ */
	margin: 5px 0px 5px 0px;
}

#nav_menu ul li:first-child {
	border-left: none;
}

#nav_menu a {
	text-decoration: none;
	color: #676f7c;
}

/* 링크에 마우스 롤오버시 적용되는 스타일 : 하단에 노란 밑줄이(border-bottom) 생김 */
#nav_menu a:hover {
	color: #cce19c;
	border-bottom: 3px solid #cce19c;
}
.ff{
	font-size:20px;
}

/* Style The Dropdown Button */
.dropbtn {
    border: none;
    cursor: pointer;
    background-color: rgba( 255, 255, 255, 0.5 );
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
    z-index:3;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 100px;
    font-size:15px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index:3;
    right:0;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    z-index:3;
}


/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
    z-index:3;
}

/* Change the background color of the dropdown button when the dropdown content is shown */

</style>
</head>
<body>
	<div id="nav_menu" class="layer_fixed">
		<div style="display:inline-block;float:left">
			<a href="home" style="border-bottom:0px">
				<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PlayStation_4_logo_and_wordmark.svg/503px-PlayStation_4_logo_and_wordmark.svg.png" style="height:68px">
			</a>
		</div>
		
		<div style="display:inline-block;float:left;margin-left:50px">
			<ul class="ff">
				<li><a href="home">HOME</a></li>
				<li><a href="productlist">Product</a></li>
				<li><a href="contactus">Contact Us</a></li>
				<li>
					<div class="dropdown">
						<button class="dropbtn" style="font-size:20px;color: #676f7c;">My Page</button>
						<div class="dropdown-content">
					    	<a href="cartview" style="border-bottom:0px;"> View Cart </a>
					    	<a href="orderview" style="border-bottom:0px;"> View Order </a>
					    	<a href="viewqna" style="border-bottom:0px;"> Q&A </a>
					    	<a href="viewReview" style="border-bottom:0px;"> Review </a>
						</div>
					</div>
				</li>
				<c:if test="${loginuser.authority == 1 }">
					<li>
						<div class="dropdown">
							<button class="dropbtn" style="font-size:20px;color: #676f7c;">Admin Menu</button>
							<div class="dropdown-content">
						    	<a href="change_home" style="border-bottom:0px;"> MainImage Change </a>
						    	<a href="addproduct_form" style="border-bottom:0px;"> Add Product </a>
						    	<a href="membermanage" style="border-bottom:0px;"> Member Management </a>
						    	<a href="move_to_crawl" style="border-bottom:0px;"> Referred Page </a>
						    	<a href="productAllList" style="border-bottom:0px;"> Product All List </a>
						    	<a href="orderManage" style="border-bottom:0px;"> Order All List </a>
						    	<a href="viewAllQna" style="border-bottom:0px;"> View All Q&A </a>
						    	
							</div>
						</div>
					</li>
				</c:if>
			</ul>
		</div>
		
		<div style="display:inline-block;right:0;top:3px;position:fixed" class="dropdown">

			<button class="dropbtn">
				<img src="http://www.freeiconspng.com/uploads/register-secure-security-user-login-icon--7.png" style="height:50px">
			</button>
			<div class="dropdown-content">
			    
			    <c:if test="${loginuser==null }">
			    	<a href="login_form" style="border-bottom:0px;"> Log in </a>
			    	<a href="join_form" style="border-bottom:0px;"> Sign up </a>
			    </c:if>
			    
			    <c:if test="${loginuser!=null }">
			   		<a href="myPage" style="border-bottom:0px;"> Information </a>
			    	<a href="logout" style="border-bottom:0px;" onclick="return logout()"> Log Out </a>
			    </c:if>
			   
			</div>
		</div>
	</div>
	
	<script>
	function logout(){
		if (confirm("로그아웃 하시겠습니까?") == true){
		    return true;
		}else{ 
		    return false;
		}
	}
	</script>
</body>

</html>