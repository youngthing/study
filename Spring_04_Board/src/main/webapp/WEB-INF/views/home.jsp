<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<c:choose>
		<c:when test="${loginID != null }">

			<table align=center>
				<tr>
					<th colspan=2>${loginID}님환영합니다.
				</tr>
				<tr aling=center>
					<td>
						<button id="toBoard">게시판</button>
					<td>
						<button id="myPage">마이페이지</button>
					<td>
						<button id="logout">로그아웃</button>
					<td>
						<button id="leave">회원탈퇴</button>
				</tr>
			</table>
			<script>
				$("#logout").on("click", function() {
						location.href = "/member/logout";
				})
				
				$("#leave").on("click", function() {
					if (confirm("정말 탈퇴하시겠습니까?")) {
						location.href = "/member/leave";
					}
				})
			</script>
		</c:when>
		<c:otherwise>
			<form action="/member/login" method="post">
				<table align=center>
					<tr>
						<th align=center>L o g i n
					</tr>
					<tr>
						<td align=center>
							<img src="/images/mi.jpg" style="width: 100px;">
					</tr>
					<tr>
						<td>
							<input type=text placeholder="input your ID" name=id>
					</tr>
					<tr>
						<td>
							<input type=password placeholder="input your PW" name=pw>
					</tr>
					<tr>
						<td align=center>
							<button>Login</button>
							<button type=button id=join>Sign up</button>
					</tr>

				</table>
			</form>

			<script>
				$("#join").on("click", function() {
					location.href = "/member/join";
				})
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>