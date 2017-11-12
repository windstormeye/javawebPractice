	<%
	String nameStr = request.getParameter("student");
	String pawStr = request.getParameter("pass");
	if (nameStr.equals("翁培钧") && pawStr.equals("2015011206")) {
		response.sendRedirect("second.jsp?Sname=" + nameStr);		
	} 
	%>