<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J o i n</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	<script>
		$(function(){
			$("#id").on("blur",function(){
				$.ajax({
					url:"/member/idDuplCheck",
					data:{
						id: $("#id").val()
						}
				}).done(function(resp){
					if(resp == "1"){
						$("#checkResult").css("color","pink");
						$("#checkResult").text($("#id").val() + "는 이미 사용중인 id 입니다");
						$("#id").val("");
						$("#id").focus();
					}else{
						$("#checkResult").css("color","dodgerblue");
						$("#checkResult").text("사용 가능한 ID입니다.");
					}
				});
			});
		})
	
	</script>
</head>
<body>
	<div class=container style="width: 750px;">
		<form class="row g-3" action="/member/signup">
			<div class="col-12">
				<label for="inputEmail4" class="form-label">아이디</label>
				<input type="id" class="form-control" id="id" name="id">
				<span id=checkResult></span>
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="pw" name="pw">
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwCheck" >
			</div>
			<div class="col-md-6">
				<label for="inputName" class="form-label">이름</label>
				<input type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-12">
				<label for="inputNumber" class="form-label">전화번호</label>
				<input type="text" class="form-control" id="phone" name="phone"> 
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">우편번호</label>
				<input type="text" class="form-control" id="zipcode" name="zipcode"
					placeholder="주소">
				<input type="button" id="search" value="찾기">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">주소 1</label>
				<input type="text" class="form-control" id="address" name="address1">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">주소 2</label>
				<input type="text" class="form-control" id="address2" name="address2">
			</div>
			<div class="col-12">
				<input type="submit" class="btn btn-primary">
			</div>
		</form>
	</div>

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		document.getElementById("search").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('zipcode').value = data.zonecode;
							document.getElementById("address").value = data.roadAddress;
						}
					}).open();
		}
	</script>


</body>
</html>