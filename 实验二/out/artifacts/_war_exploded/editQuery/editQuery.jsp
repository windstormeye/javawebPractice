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

<jsp:useBean id="DBbean" class="pjpjpj.DBbean" scope="page"/>
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
    out.println("<form method=\"post\" action=\" /editQuery \" id=\" saveForm \">");
    out.println("<input type=\"hidden\" name = \"type\" value=\"saveQuery\">");
    for (int i = 0; i < queryList.size(); i ++) {
        ArrayList singleQueryList = (ArrayList) queryList.get(i);
        out.println("<tr>");
        out.println("<td>" + "<input id=\" btn \" name=\"title" + i + "\"" + "type=\"text\" value=\"" + singleQueryList.get(0) + "\" />"+ "</td>");
        out.println("<td>");
        String singleQueryAnswerString = (String) singleQueryList.get(2);
        out.println("<input name= \"content" + i + "\"" + " type=\"text\" value=\"" + singleQueryAnswerString + "\" />");
        out.println("</td>");
        out.println("<td>" + "<input name=\"answer" + i + "\"" + " type=\"text\" value=\"" + singleQueryList.get(1) + "\" />"+ "</td>");
        out.println("<td>");
        out.println("<button type=\"button\" onclick=\" deleteQuery(" + i + " )"+  "\" >删除</button>\n");
        out.println("</td>");
        out.println("</tr>");
    }
    out.println("</form>");
    out.println("<tr>");
    out.println("<td colspan=\"3\">");
    out.println("<button type=\"button\" onclick=\" addQuery() \" >增加</button>\n");
    out.println("<button type=\"submit\" form=\" saveForm \">保存</button>\n");
    out.println("<button type=\"button\" onclick=\" showQuery() \" >预览</button>\n");
    out.println("<button type=\"button\" onclick=\" pushQuery() \">发布</button>\n");
    out.println("</td>");
    out.println("</tr>");
    out.println("</table>");
    out.println("</div>");
%>
</body>
<script>
    function addQuery() {
        window.location = "/editQuery?type=addQuery";
    }
    function saveQuery(title, content, answer) {
        var url = "/editQuery?type=saveQuery&title=" + title + "&content=" + content + "&answer=" + answer;
        window.location = url;
    }
    function deleteQuery(queryindex) {
        var url = "/editQuery?type=deleteQuery&index=" + queryindex;
        window.location = url;
    }
    function showQuery() {
        window.location = "/editQuery?type=showQuery";
    }
    function pushQuery() {
        window.location = "/editQuery?type=pushQuery";
    }

</script>

</html>
