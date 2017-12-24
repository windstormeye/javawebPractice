package pjhubs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(
        name = "editQuery",
        urlPatterns = {"/editQuery"}
)
public class editQuery extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBbean dBbean = new DBbean();
        dBbean.getConn(define.DB_NAME, define.DB_USERNAME, define.DB_PASSWORD);
        String sql = "select * from t_query";
        ArrayList mapArray = dBbean.executeResult(sql);
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
        request.setAttribute("queryList", queryArr);
        request.getRequestDispatcher("/editQuery/editQuery.jsp").forward(request, response);
        return;
    }
}
