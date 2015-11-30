package dao.ioc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by 云航 on 2015/11/28.
 */
public class ConnectionPool{
    private static List<Connection> list = new LinkedList<Connection>();
    private static int COUNT = 10;
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/test?useUnicode=true&amp;characterEncoding=UTF-8";
            for (int i = 0; i < COUNT; i++) {
                Connection connection = DriverManager.getConnection(url, "root", "qazqaz");
                list.add(connection);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public synchronized Connection getConnection() throws SQLException {
        if (list.size() <= 0) {
            throw new RuntimeException("连接池没有连接可用！");
        }
        Connection connection = list.remove(0);
        return connection;
    }

    public void giveBack(Connection connection) {
        list.add(connection);
    }
}
