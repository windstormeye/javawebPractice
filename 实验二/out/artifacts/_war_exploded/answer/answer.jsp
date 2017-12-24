<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: pjpjpj
  Date: 2017/11/19
  Time: 下午9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String c1 = request.getParameter("score");
    out.println("<div style=\"text-align:center;\">");
    out.println("<h1>你的分数为：" + c1 + "</h1>");
    out.println("</div>");
%>
</body>
</html>
