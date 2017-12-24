package pjhubs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
@WebServlet(
        name = "answer",
        urlPatterns = {"/answer"}
)
public class answer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBbean dBbean = new DBbean();
        dBbean.getConn(define.DB_NAME, define.DB_USERNAME, define.DB_PASSWORD);
        String sql = "select * from t_query";
        ArrayList mapArray = dBbean.executeResult(sql);
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
        int answerSum = 0;
        int tempIndex = 0;
        Map requestMap = new HashMap();
        requestMap = showParams(request);
        Set<Map.Entry<String, String>> set = requestMap.entrySet();
        for (Map.Entry entry : set) {
            ArrayList tempArr = (ArrayList) queryArr.get(tempIndex);
//            System.out.println(entry.getKey() + ":" + entry.getValue());
            String answerString = (String) tempArr.get(1);
            String userAnswerString = (String) entry.getValue();
            if (userAnswerString.equals(answerString)) {
                answerSum += 10;
            }
            tempIndex ++;
        }
        String urlStirng = "/answer/answer.jsp?score=" + answerSum;
        request.getRequestDispatcher(urlStirng).forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 表单提交了POST却调了GET，待查看
        doPost(request, response);
    }

    private Map showParams(HttpServletRequest request) {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    map.put(paramName, paramValue);
                }
            }
        }
        return map;
    }
}
