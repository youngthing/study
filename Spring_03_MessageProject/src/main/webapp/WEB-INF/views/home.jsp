<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>h o m e I n d e x</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body align=center>
	 W e l c o m e ! Spring practice ! <br><br>
	 <table border=1 align=center>
	 	<tr>
	 		<th colspan=2>
	 		<img src="/images/me.jpg">
	 		<!--  이미지 태그 자체가 request다.
	 		사용자의 의지와는 상관없이 리퀘스트, 보안이슈도 있다. -->
	 	</tr>
	 </table>
	 
	<a href="inputForm"> 메세지 보내기 </a> <br>
	<a href="outputView"> 목 록 </a>
</body>
</html>