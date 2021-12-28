<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>texting !</title>
</head>
<body>

	<form action="inputProc" method="post">
		<table border=1 align=center>
			<tr colspan=2>
				<th>write text to my friend S2
			</tr>

			<tr colspan=2>
				<td><textarea name=message value= "* texting ! *"> </textarea>
			</tr>
			<tr>
				<td><input type=text placeholder=writer name=writer>
					<input type=submit>
			</tr>
		</table>
	</form>

</body>
</html>