package dao;

import dao.ioc.ConnectionPool;
import entity.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

/**
 * Created by 云航 on 2015/11/28.
 */
public class UserDao {
    private Connection connection;
    private ConnectionPool pool;
    public UserDao () {
        pool = new ConnectionPool();
        try {
            connection = pool.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int saveUser (User user) {
        try {
            Statement stmt = connection.createStatement();
            String tmp = "INSERT INTO user_data(userName, password, phoneNumber, realName, postCode, balance) VALUES (" + user.toString() + ")";

            return stmt.executeUpdate(tmp);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void deleteUser (String name) {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            String sql = "DELETE FROM user_data WHERE username='" + name + "'";
            stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    /**
     * 更新用户的余额信息
     * */
    public void updateUserBalance (User user) {
        try {
            Statement stmt = connection.createStatement();
            String sql = "UPDATE user_data SET balance='" + (user.getBalance() + "' WHERE userName='" + user.getUserName() + "'");
            stmt.execute(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获得所有的用户User
     * */
    public LinkedList<User> getAllUsers () {
        try {
            Statement stmt = connection.createStatement();
            LinkedList<User> list = new LinkedList<>();
            String sql = "SELECT * FROM user_data";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                User user = new User(rs.getString("userName"), rs.getString("password"), rs.getString("phoneNumber"), rs.getString("realName"),
                        rs.getString("postCode"));
                user.setBalance(Integer.parseInt(rs.getString("balance")));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 查询用户 根据用户名 这个方法干啥？ 我自己也不知道。、。。
     * */
    public LinkedList<User> queryUser(String username) {
        try {
            Statement stmt = connection.createStatement();
            String sql = "SELECT * FROM user_data WHERE userName='"+ username +"'";
            ResultSet rs = stmt.executeQuery(sql);
            LinkedList<User> list = new LinkedList<User>();
            while(rs.next()) {
                User user = new User(rs.getString("userName"), rs.getString("password"), rs.getString("phoneNumber"), rs.getString("realName"),
                        rs.getString("postCode"));
                user.setBalance(Integer.parseInt(rs.getString("balance")));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 获取指定的用户 失败返回null
     * */
    public User getUser (String username) {
        LinkedList<User> list = queryUser(username);
        for (int i = 0; list != null && i < list.size(); ++i) {
            if (list.get(i).getUserName().equals(username))
                return list.get(i);
        }
        return null;
    }

    public void giveBack () {
        pool.giveBack(connection);
    }
}
