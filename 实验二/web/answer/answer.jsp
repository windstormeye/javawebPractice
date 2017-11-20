<%--
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
    String c1 = request.getParameter("0");
    String c2 = request.getParameter("1");
    String c3 = request.getParameter("2");
    int sum = 0;
    if (c1.equals("翁培钧")) {
        sum += 10;
    }
    if (c2.equals("男")) {
        sum += 10;
    }
    if (c3.equals("20")) {
        sum += 10;
    }
    out.println(sum);
%>
</body>
</html>
