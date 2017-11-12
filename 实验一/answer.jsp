<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html>
<head></head>

<body>

	<div>
		<%
			int num = 0;
			String c1 = request.getParameter("judge");
			String c2 = request.getParameter("select");
				if (c1 != null && c1.equals("yes")) {
					num ++;
				} 
				if (c2 != null && c2.equals("two")) {
					num ++;
				} 
		%>
		<p>结果为</p>
		<h1><%=num%>分</h1>
		<br/>

	</div>	

</body>

</html>