<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

    <form name="form" method="post" action="login.jsp">
			
		<div>
			<input name="student" class="text"
				type="text" 
				placeholder="输入账号（学生姓名）">
		</div>
						
		<div>
			<input name="pass" class="text" 
				value="" 
				type="password" 
				placeholder="输入密码（学号）">
		</div>
						
		<input type="submit" name="submit" value="登录">
		
	</form>



</body>
</html>