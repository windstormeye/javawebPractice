package pjpjpj;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet(
        name = "editQuery",
        urlPatterns = {"/editQuery"}
)
public class editQuery extends HttpServlet {

    private ArrayList queryArr;
    private ArrayList mapArray;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        int index = 0;
        int tempIndex = 0;
        HashMap tempMap = (HashMap) mapArray.get(index);
        while (paramNames.hasMoreElements()) {
            if (tempIndex == 3) {
                mapArray.set(index, tempMap);
                tempIndex = 0;
                index ++;
                tempMap = (HashMap) mapArray.get(index);
            }
            System.out.println(tempIndex + "...");
            String paramName = (String) paramNames.nextElement();
            String[] paramValues = request.getParameterValues(paramName);
            paramValues[0] = new String(paramValues[0].getBytes("ISO-8859-1"), "UTF-8");
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() != 0) {
                    if (paramName.equals("type")) {
                        tempIndex = 0;
                        continue;
                    }
                    map.put(paramName, paramValue);
                    System.out.println(paramName + ":" + paramValue);
                    switch (tempIndex) {
                        case 0:
                            tempMap.put("title", paramValue); break;
                        case 1:
                            tempMap.put("content", paramValue); break;
                        case 2:
                            tempMap.put("answer", paramValue); break;
                    }
                }
            }
            tempIndex ++;
            System.out.println(tempIndex);
        }
        System.out.println(mapArray.size());
        System.out.println(mapArray.size());
        updateData();
        jumpToEditQuery(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        switch (type) {
            case "getQuery" :
                getQuery(request, response); break;
            case "deleteQuery" :
                deleteQuery(request, response); break;
            case "addQuery" :
                addQuery(request, response); break;
            case "showQuery" :
                showQuery(request, response); break;
            case "pushQuery" :
                try {
                    pushQuery(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void getQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBbean dBbean = new DBbean();
        dBbean.getConn(define.DB_NAME, define.DB_USERNAME, define.DB_PASSWORD);
        String sql = "select * from t_query";
        mapArray = dBbean.executeResult(sql);
        // 更新数据
        updateData();
        String jumpto = request.getParameter("jumpto");
        if (jumpto != null && jumpto.equals("editQuery")) {
           jumpToEditQuery(request, response);
           return;
        }
        jumpToQuery(request, response);
    }

    private void deleteQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String queryIndex = request.getParameter("index");
        queryArr.remove(queryArr.get(Integer.parseInt(queryIndex)));
        mapArray.remove(mapArray.get(Integer.parseInt(queryIndex)));
        request.setAttribute("queryList", queryArr);
        request.getRequestDispatcher("/editQuery/editQuery.jsp").forward(request, response);
        return;
    }

    private void addQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList tempArr = new ArrayList();
        String q_titile = "";
        tempArr.add(q_titile);
        String q_answer = "";
        tempArr.add(q_answer);
        String q_content = "";
        tempArr.add(q_content);
        queryArr.add(tempArr);
        int index = queryArr.size() - 1;
        HashMap map = new HashMap();
        ArrayList tempQueryArr = (ArrayList) queryArr.get(index);
        map.put("title", tempQueryArr.get(0));
        map.put("answer", tempQueryArr.get(1));
        map.put("content", tempQueryArr.get(2));
        mapArray.add(index, map);
        request.setAttribute("queryList", queryArr);
        request.getRequestDispatcher("/editQuery/editQuery.jsp").forward(request, response);
        return;
    }

    private void showQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("queryList", queryArr);
        // remove掉空白题目
        Iterator<ArrayList> it = queryArr.iterator();
        while(it.hasNext()){
            ArrayList tempArr = it.next();
            if(tempArr.get(0).equals("")){
                it.remove();
            }
        }
        // 把修改完的内容重新添加会mapArr中
        for (int i = 0; i < mapArray.size(); i++) {
            HashMap map = (HashMap) mapArray.get(i);
            ArrayList tempArr = (ArrayList) queryArr.get(i);
            map.put("title", tempArr.get(0));
            map.put("answer", tempArr.get(1));
            map.put("content", tempArr.get(2));
            mapArray.set(i, map);
        }
        jumpToQuery(request, response);
    }

    private void pushQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        DBbean dBbean = new DBbean();
        dBbean.getConn(define.DB_NAME, define.DB_USERNAME, define.DB_PASSWORD);
        for (int i = 0; i < mapArray.size(); i++) {
            HashMap map = (HashMap) mapArray.get(i);
            String q_titile = (String)map.get("title");
            String q_answer = (String)map.get("answer");
            String q_content = (String)map.get("content");
            int id = i + 1;
            String sql = "update t_query set title=" + "\"" + q_titile + "\"" + ", content=" + "\"" + q_content + "\"" + ", answer=" + "\"" + q_answer + "\"" + " where id=" + id;
            System.out.println(sql);
            dBbean.executeUpdate(sql);
        }
        getQuery(request, response);
    }

    private void jumpToQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mapArray", mapArray);
        request.getRequestDispatcher("query/query.jsp").forward(request, response);
        return;
    }

    private void jumpToEditQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("queryList", queryArr);
        request.getRequestDispatcher("/editQuery/editQuery.jsp").forward(request, response);
        return;
    }

    private void updateData() {
        queryArr = new ArrayList();
        for (int i = 0; i < mapArray.size(); i++) {
            HashMap map = (HashMap) mapArray.get(i);
            ArrayList tempArr = new ArrayList();
            String q_titile = (String)map.get("title");
            tempArr.add(q_titile);
            String q_answer = (String)map.get("answer");
            tempArr.add(q_answer);
            String q_content = (String)map.get("content");
            tempArr.add(q_content);
            queryArr.add(tempArr);
        }
    }
}

