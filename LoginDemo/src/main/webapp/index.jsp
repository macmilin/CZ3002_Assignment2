<!DOCTYPE html>
<html>
<head>
<title>Login</title>
</head>
<body style="text-align: center;">
	<h3>Login</h3>
	<form action="login" method="post">
		<pre>
<input type="text" name="username" placeholder="Username" required />

<input type="password" name="pass" placeholder="Password" required />

<input type="submit" name="sub" value="Login" />
		</pre>
		<%
			String str = (String) request.getAttribute("msg");
			if (str != null) {
				out.print(str);
			}
		%>
	</form>
</body>
</html>