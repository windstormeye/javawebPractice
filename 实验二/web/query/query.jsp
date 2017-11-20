<%--
  Created by IntelliJ IDEA.
  User: pjpjpj
  Date: 2017/11/19
  Time: 下午2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="DBbean" class="pjhubs.DBbean" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="query.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>请答题</title>
</head>
<body bgcolor="black" background="http://api.dujin.org/bing/1920.php" style="background-size:cover;">
<%--<body bgcolor="black" style="background-size:cover;">--%>
<%
    String nameStr = request.getParameter("username");
    String pawStr = request.getParameter("passwd");
    String sql = null;
    //调用getConn方法与数据库建立连接
    DBbean.getConn("wpj","root","woaiwoziji123");
    sql = "select * from t_query";
    //查询数据库
    ArrayList mapArray = DBbean.executeResult(sql);
%>
    <%--<div class="bgDiv"></div>--%>
    <%--<div class="backDiv">--%>
        <%--<div class="userDiv">--%>
            <%--<p style="color: white">欢迎你:<%=(String)session.getAttribute("username")%></p>--%>
        <%--</div>--%>
        <%--<h1 style="text-align: center; color: white">答题吧，孩子！</h1>--%>
    <%--</div>--%>
</body>
    <%
     ArrayList queryArr = new ArrayList();
     for (int i = 0; i < mapArray.size(); i++) {
         HashMap map = (HashMap) mapArray.get(i);
         ArrayList tempArr = new ArrayList();
         String q_titile = (String)map.get("t_title");
         tempArr.add(q_titile);
         String q_answer = (String)map.get("t_answer");
         tempArr.add(q_answer);
         String q_content = (String)map.get("t_content");
         String[] splitString = q_content.split("\\|");
         tempArr.add(splitString);
         queryArr.add(tempArr);
     }
     out.println("<form action=\"../answer/answer.jsp\" methon=\"post\">");
     out.println("<ul>");
     for (int i = 0; i < queryArr.size(); i ++) {
         ArrayList tempArr = (ArrayList) queryArr.get(i);
         out.println("<div class=\"creatediv\">");
         out.println("<li>");
         for (int j = 0; j < tempArr.size(); j++) {
             if (j == 0) {
                 out.println("<p class=\"queryP\">"+ tempArr.get(j) +"</p>");
             }
             if (j == 2) {
                 String[] temp = (String[]) tempArr.get(2);
                 for (int k = 0; k < temp.length; k++) {
                     out.println("<label class=\"labelP\"><input name=\"" + i + "\" type=\"radio\" value=\"" + temp[k] + "\" />"+ temp[k] +"</label>");
                 }
             } else {
                 System.out.println(tempArr.get(j));
             }
         }
         out.println("</li>");
         out.println("</div>");
     }
     out.println("</ul>");
     out.println("<input class=\"summitInput\" style=\"color: black\" type=\"submit\" name=\"submit\" value=\"提交答案\">");
     out.println("</form>");
    %>
</html>
