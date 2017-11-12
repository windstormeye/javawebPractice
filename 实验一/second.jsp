<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<title>first</title>
</head>
<body>
	<%
		String name=request.getParameter("Sname");  
    %> 

    <h1 class="usename">学生姓名：<%=name%> </h1> 

    <form action="answer.jsp" name="form" method="post">
		<div class="question">

			这是第一题吗？<br/>
			<label><input name="judge" type="radio" value="yes" />是 </label> 
			<label><input name="judge" type="radio" value="no" />否 </label> 
		
			这是第几题？<br/>
			<label><input name="select" type="radio" value="one" />1 </label> 
			<label><input name="select" type="radio" value="two" />2 </label> 
			<label><input name="select" type="radio" value="three" />3 </label>

			<input class="submit" type="submit" name="submit" value="完成">

			</div>

		</div>
	</form>

</body>
</html>