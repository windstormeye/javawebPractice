<%--
  Created by IntelliJ IDEA.
  User: pjpjpj
  Date: 2017/11/19
  Time: 下午1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="DBbean" class="pjhubs.DBbean" scope="page"/>
<%
    String nameStr = request.getParameter("username");
    String pawStr = request.getParameter("passwd");
    String sql = null;
    //调用getConn方法与数据库建立连接
    DBbean.getConn("wpj","root","woaiwoziji123");
    sql = "select * from t_user where username='" + nameStr + "' and passwd='" + pawStr + "'";
    //查询数据库
    ArrayList mapArray = DBbean.executeResult(sql);
    // 先强转
    HashMap map = (HashMap) mapArray.get(0);
    if (map.get("username").equals(nameStr) && map.get("passwd").equals(pawStr)) {
        session.setAttribute("username", nameStr);
        response.sendRedirect("query/query.jsp");
    } else {
        response.sendRedirect("../index.html");
    }
%>
