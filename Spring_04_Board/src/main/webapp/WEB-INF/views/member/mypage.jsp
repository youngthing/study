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
</head>
<body>
<div class=container style="width: 750px;">
		<form class="row g-3" action="modify">
			<div class="col-12">
				<label for="inputEmail4" class="form-label">아이디</label>
				<input type="id" class="form-control" id="id" name="id" value="${dto.id } " readonly="readonly"> 가입일 : ${dto.signup_date}
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
				<input type="text" class="form-control" id="name" name="name" value="${dto.name }">
			</div>
			<div class="col-12">
				<label for="inputNumber" class="form-label">전화번호</label>
			<input type="text" class="form-control" id="phone" name="phone" value="${dto.phone }">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">우편번호</label>
				<input type="text" class="form-control" id="zipcode" name="zipcode"
					placeholder="주소" value="${dto.zipcode }">
				<input type="button" id="search" value="찾기">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">주소 1</label>
				<input type="text" class="form-control" id="address" name="address1" value="${dto.address1 }">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">주소 2</label>
				<input type="text" class="form-control" id="address2" name="address2" value="${dto.address2 }">
			</div>
			<div class="col-12">
				<input type="submit" class="btn btn-primary" value="수정">
			</div>
		</form>
	</div>

</body>
</html>