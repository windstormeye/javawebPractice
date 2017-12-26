package pjpjpj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.ArrayList;


@WebServlet(
        name = "userlogin",
        urlPatterns = {"/userlogin"}
        )
public class userlogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameStr = request.getParameter("username");
        String pawStr = request.getParameter("passwd");
        DBbean dBbean = new DBbean();
        dBbean.getConn(define.DB_NAME, define.DB_USERNAME, define.DB_PASSWORD);
        String sql = "select * from t_user where username='" + nameStr + "' and passwd='" + pawStr + "'";
        ArrayList mapArray = dBbean.executeResult(sql);
        HashMap map = (HashMap) mapArray.get(0);
        if (map.get("username").equals(nameStr) && map.get("passwd").equals(pawStr)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("username", nameStr);
            session.setAttribute("type", map.get("type"));
            response.sendRedirect("/editQuery?type=getQuery&jumpto=query");
        } else {
            response.sendRedirect("../index.html");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
