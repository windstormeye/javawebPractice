<%--
  Created by IntelliJ IDEA.
  User: pjpjpj
  Date: 2017/12/2
  Time: 下午8:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="DBbean" class="pjhubs.DBbean" scope="page"/>
<html>
<head>

</head>
<body>
<%
    String nameStr = (String) session.getAttribute("username");
    String pawStr = (String) session.getAttribute("passwd");
    String typeStr = (String) session.getAttribute("type");
    if (nameStr.isEmpty() || pawStr.isEmpty()) {
        response.sendRedirect("../index.html");
    }
    String sql = null;
    //调用getConn方法与数据库建立连接
    DBbean.getConn("wpj","root","woaiwoziji123");
    sql = "select * from t_query";
    //查询数据库
    ArrayList mapArray = DBbean.executeResult(sql);
%>
</body>
</html>
