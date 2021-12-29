<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<div class=container>
	<form class="row g-3">
		<div class="col-12">
			<label for="inputEmail4" class="form-label">아이디</label> <input
				type="email" class="form-control" id="inputEmail4">
		</div>
		<div class="col-md-6">
			<label for="inputPassword4" class="form-label">Password</label> <input
				type="password" class="form-control" id="inputPassword4">
		</div>
		<div class="col-md-6">
			<label for="inputPassword4" class="form-label">Password2</label> <input
				type="password" class="form-control" id="inputPassword4">
		</div>
		<div class="col-12">
			<label for="inputAddress" class="form-label">Address</label> <input
				type="text" class="form-control" id="inputAddress"
				placeholder="1234 Main St">
		</div>
		<div class="col-12">
			<label for="inputAddress2" class="form-label">Address 2</label> <input
				type="text" class="form-control" id="inputAddress2"
				placeholder="Apartment, studio, or floor">
		</div>
		<div class="col-md-6">
			<label for="inputCity" class="form-label">City</label> <input
				type="text" class="form-control" id="inputCity">
		</div>
		<div class="col-md-4">
			<label for="inputState" class="form-label">State</label> <select
				id="inputState" class="form-select">
				<option selected>Choose...</option>
				<option>...</option>
			</select>
		</div>
		<div class="col-md-2">
			<label for="inputZip" class="form-label">Zip</label> <input
				type="text" class="form-control" id="inputZip">
		</div>
		<div class="col-12">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="gridCheck">
				<label class="form-check-label" for="gridCheck"> Check me
					out </label>
			</div>
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary">Sign in</button>
		</div>
	</form>
	</div>



</body>
</html>