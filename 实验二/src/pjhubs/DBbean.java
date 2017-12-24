package pjhubs;

import java.sql.*;
import java.util.*;
public class DBbean implements java.io.Serializable {

    private Statement stmt = null;
    private ResultSet rs = null;
    private Connection conn = null;
    private String dsn;

    public Statement getStmt() {
        return stmt;
    }

    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public String getDsn() {
        return dsn;
    }

    public void setDsn(String dsn) {
        this.dsn = dsn;
    }

    // 建立连接
    public void getConn(String dbname, String uid, String pwd) {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/" + dbname;
        url = url + "?characterEncoding=utf8&useSSL=true";
        try {
            //classLoader,加载对应动
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(url, uid, pwd);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 执行有返回集的SQL
    public ArrayList executeResult(String sql) {
        ArrayList mapArray = new ArrayList();
        try {
            stmt =conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sql);
            ResultSetMetaData data = rs.getMetaData();
            // 创建保存用户信息的字典，写明类型是为了让编译器在编译期间帮助我们进行类型判断，保证类型安全
            int index = 0;
            while (rs.next()) {
                HashMap map = new HashMap();
                for (int i = 1; i <= data.getColumnCount(); i++) {
                    map.put(data.getColumnName(i), rs.getString(i));
                }   
                mapArray.add(map);
            }
            stmt.close();
            conn.close();
        } catch(SQLException ex) {
            System.err.println("aq.executeQuery:"+ex.getMessage());
        }
        return mapArray;
    }

    //执行无返回集的SQL
    public void executeNoResult(String sql) {
        stmt = null;
        rs=null;
        try {
            stmt =conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            stmt.executeQuery(sql);
            stmt.close();
            conn.close();
        }
        catch(SQLException ex) {
            System.err.println("aq.executeQuery: " + ex.getMessage());
        }
    }

    //关闭对象
    public void closeStmt() {
        try{   stmt.close();   }
        catch(SQLException ex) {
            System.err.println("aq.executeQuery: " + ex.getMessage());
        }
    }

    // 关闭连接
    public void closeConn() {
        try{   conn.close();  }
        catch(SQLException ex) {
            System.err.println("aq.executeQuery: " + ex.getMessage());
        }
    }
}
