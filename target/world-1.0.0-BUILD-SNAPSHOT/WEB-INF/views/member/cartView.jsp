<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
<body onload="checkboxSelectQue(1,'chk[]','chk2[]')">
	<div>
		<%@include file='../common/header.jsp' %>
	</div>
	
	<div>
		<%@include file='../common/Cart_Order.jsp' %>
	</div>
	
	<form method="post" action="order_page">
		<div style="float:left;width:20%">
		　
		</div>
		<div style="float:left;width:70%">
			<table>
				<tr>
					<th>Product Name</th>
					<th>Product Quantity</th>
					<th>Product Price</th>
					<th>Cart Price</th>
					<th>Order</th>
					<th>Delete</th>
				</tr>
				<c:forEach var="l" items="${list }">
					<tr>
						<td>
							<a href="productdetail?id=${l.productid}" target="_blank">
								<img src="/world/resources/image/${l.image }" style="width:135px;height:70px;">
							</a>
							<br>${l.name}
						</td>
						<td><input type="number" name="amount" value="${l.amount }" id="amount${l.id}"
							onchange="changeamount(${l.id})"></td>
						<td>${l.price }</td>
						<td>${l.price*l.amount }</td>
						<td><input type="checkbox" name="chk[]" value="${l.id }" onclick="sumtotal(this,${l.price*l.amount})">
							<input type="hidden" name="chk2[]" value="${l.price*l.amount}">
						</td>
						<td><input type="button" onclick="return del_cart(${l.id})" value="Delete"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align: right">
						<input type="button" value="전체선택" onclick="checkboxSelectQue(1,'chk[]','chk2[]')" />
						<input type="button" value="전체해제" onclick="checkboxSelectQue(2,'chk[]','chk2[]')" />
					</td>
				</tr>
				<tr>
					<th>배송지</th>
					<td colspan="4">
						기본 배송지<input type="radio" name="addr_radio" value="0" checked><br>
						새로운 주소 입력<input type="radio" name="addr_radio" value="1"><input type="text" name="addr" id="addr">
					</td>
					
				</tr>
				<tr>
					<td colspan="5">
						<div id="ttt" style="width:30%;display: inline-block;">0</div>
						<input type="submit" value="선택상품 주문하기" onclick="return check_chk('chk[]')">
						<input type="hidden" id="total" name="total" value="0">　
						<br>*5만원 이하 주문 시 배송비 2500원이 추가됩니다.<br>
					</td>
				</tr>
			</table>
		</div>
			
	</form>
	
	
	<script type="text/javascript">
		function checkboxSelectQue(n,obj,obj2) {
		    var i;
		    var chk = document.getElementsByName(obj);
		    var tot = chk.length;
		    var price = document.getElementsByName(obj2);
		    for (i = 0; i < tot; i++) {
		        if (n == 1){
		        	if(chk[i].checked==false){
		        		chk[i].checked = true;
			        	sumtotal(chk[i],price[i].value);
		        	}
		        	
		        }
		        
		        if (n == 2){
		        	if(chk[i].checked==true){
			        	chk[i].checked = false;
			        	sumtotal(chk[i],price[i].value);
		        	}
		        }
		    }
		}
		
		function changeamount(val){
			var name = "amount"+val;
			var amount = document.getElementById(name);
			location.href="changeamount?id="+val+"&amount="+amount.value;
		}
		
		function sumtotal(chk, val){
			var total = document.getElementById("total");
			
			if(chk.checked==true){
				total.value = parseInt(total.value)+parseInt(val);

			}else{
				total.value = parseInt(total.value)-parseInt(val);
			}
			 var div = document.getElementById("ttt");
			 div.textContent=total.value;
			 
		}
		
		function check_chk(obj) {
			var sum = 0;
			var chk = document.getElementsByName(obj);
			
			var addr_radio = document.getElementsByName('addr_radio');
			
			var tot = chk.length;
			for(var i=0; i < tot; i++ ){
				if( chk[i].checked == true ){
					sum += 1;
				}
			}
			if(sum==0){
				alert("하나 이상의 제품을 선택하세요");
				return false;
			}else{
				
				for(var i=0;i<addr_radio.length;i++){

					if(addr_radio[i].checked == true){ 
						if(addr_radio[i].value==1){
							var addr = document.getElementById('addr');
							if(!addr.value){
								alert("새로운 배송지를 선택하셨습니다. 주소를 입력해주세요");
								return false;
							}
						}
					}
				}
				
				if (confirm("주문 하시겠습니까?") == true){    //확인
					
				    return true;
				}else{   //취소
				    return false;
				}
			}
			
			
		}
		
		function del_cart(val){
			if (confirm("삭제 하시겠습니까?") == true){
				location.href='deleteCart?id='+val;
			    return true;
			}else{   //취소
			    return false;
			}
			
		}
	</script>
</body>
</html>