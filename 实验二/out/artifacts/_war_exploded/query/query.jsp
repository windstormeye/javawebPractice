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
<%
    String nameStr = (String) session.getAttribute("username");
    String typeStr = (String) session.getAttribute("type");
    if (nameStr == null) {
        response.sendRedirect("../index.html");
        return;
    }
    String sql = null;
    //调用getConn方法与数据库建立连接
    DBbean.getConn("wpj","root","woaiwoziji123");
    sql = "select * from t_query";
    //查询数据库
    ArrayList mapArray = DBbean.executeResult(sql);
%>
<div class="bgDiv"></div>

<%
    ArrayList answerArr = new ArrayList();
    ArrayList queryArr = new ArrayList();
    for (int i = 0; i < mapArray.size(); i++) {
        HashMap map = (HashMap) mapArray.get(i);
        ArrayList tempArr = new ArrayList();
        String q_titile = (String)map.get("title");
        tempArr.add(q_titile);
        String q_answer = (String)map.get("answer");
        tempArr.add(q_answer);
        String q_content = (String)map.get("content");
        String[] splitString = q_content.split("\\|");
        tempArr.add(splitString);
        queryArr.add(tempArr);
    }
    out.println("<div class=\"queryDiv\">");
    if (typeStr.equals("root")) {
        out.println("<h2>管理员:" + nameStr + "你好" +"</h2>");
        out.println("<input type=\"button\" onclick=\"window.location.href='../editQuery/editQuery.jsp'\" value=\"编辑试卷\">");
    } else {
        out.println("<h2>同学:" + nameStr + "你好" +"</h2>");
    }
    out.println("<form name=\" form \" methon=\"post\" action=\"/answer\" >");
    out.println("<ul style=\"list-style-type:none\">");
    for (int i = 0; i < queryArr.size(); i ++) {
        ArrayList tempArr = (ArrayList) queryArr.get(i);
        out.println("<div class=\"creatediv\">");
        out.println("<li>");
        for (int j = 0; j < tempArr.size(); j++) {
            if (j == 0) {
                out.println("<p class=\"queryP\">"+ i + "、" + tempArr.get(j) +"</p>");
            }
            if (j == 2) {
                String[] temp = (String[]) tempArr.get(2);
                for (int k = 0; k < temp.length; k++) {
                    out.println("<label class=\"labelP\"><input name=\"" + i + "\" type=\"radio\" value=\""  + temp[k] + "\" />"+ temp[k] +"</label>");
                }
            }
            if (j == 1){
                answerArr.add(tempArr.get(1));
            }
        }
        out.println("</li>");
        out.println("</div>");
    }
    out.println("</ul>");
    out.println("<div style=\"text-align:center; bottom: 0;\">");
    out.println("<button style=\"color: white; width:60%; height:30px; background-color: deepskyblue;\" type=\"submit\">登录</button>\n");
    out.println("</div>");
    out.println("</form>");
    out.println("</div>");
%>
</body>
</html>
