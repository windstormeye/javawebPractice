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
    <link rel="stylesheet" type="text/css" href="query/query.css"/>
</head>
<body>
<%
    ArrayList queryList = (ArrayList)request.getAttribute("queryList");
    out.println("<div class=\"queryDiv\">");
    out.println("<table border=\"1\" align=\"center\"> \n");
    out.println("<caption>试卷编辑</caption>\n");
    out.println(
            "<tr>\n" +
                "<th>题目</th>\n" +
                "<th>选项</th>\n" +
                "<th>答案</th>\n" +
                "<th>功能</th>\n" +
            "</tr>"
    );
    for (int i = 0; i < queryList.size(); i ++) {
        ArrayList singleQueryList = (ArrayList) queryList.get(i);
        out.println("<tr>");
        out.println("<td>" + singleQueryList.get(0) + "</td>");
        out.println("<td>");
        String[] singleQueryAnswerString = (String[]) singleQueryList.get(2);
        for (int j = 0; j < singleQueryAnswerString.length; j++) {
            out.println("<label><input name=\"" + i + "\" type=\"radio\" value=\""  + singleQueryAnswerString[j] + "\" />"+ singleQueryAnswerString[j] +"</label>");
        }
        out.println("</td>");
        out.println("<td>" + singleQueryList.get(1) + "</td>");
        out.println("<td>");
        out.println("<button type=\"button\">修改</button>\n");
        out.println("<button type=\"button\">删除</button>\n");
        out.println("</td>");
        out.println("</tr>");
    }
    out.println("</table>");
    out.println("</div>");
%>

</body>
</html>
