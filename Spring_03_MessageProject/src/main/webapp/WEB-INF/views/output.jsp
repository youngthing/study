<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 align=center>

		<tr>
			<th colspan=3>Message List
		</tr>
		<tr>
			<th>
			<th>Writer
			<th>Messgae
		</tr>
		<c:forEach var="i" items="${list }">
			<tr>
				<td>${i.seq}
				<td>${i.writer}
				<td>${i.message }
			</tr>
		</c:forEach>
		<tr>
			<td colspan=3>
				<form action="deleteProc" method="get">
					<input type=text placeholder="Target Number to delete" name=delTarget>
					<button>Delete</button>
				</form>
		</tr>
		<tr>
			<td colspan=3>
				<form action="updateProc" method="post">
					<input type=text placeholder="Target Seq to update" name="seq"><br>
					<input type=text placeholder="Target Writer to update" name="writer">
					<br> <input type=text placeholder="Target Messate to update"
						name="message">
					<button>Update</button>
				</form>
		</tr>
		<tr>
			<td colspan=3 align=center><a href="/">back</a>
		</tr>

	</table>
</body>
</html>