package dao;

import dao.ioc.ConnectionPool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entity.Book;

/**
 * Created by 云航 on 2015/11/28.
 */
public class BookDao {
    private Connection connection;
    public static final int QUERY_BY_NAME = 1;
    public static final int QUERY_BY_TYPE = 2;

    private ConnectionPool pool;

    public enum TYPE {CHILDEN, MILITARY, CHEMICAL, SCIENCE, COMPUTER, NOVEL, OTHER};
    public BookDao() {
        pool = new ConnectionPool();
        try {
            connection = pool.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int saveBook(Book book) {
        try {
            Statement stmt = connection.createStatement();
            String tmp = "INSERT INTO book(name, auther, price, type, publish, description, inventory, number, path) VALUES (" + book.toString() + ")";
            return stmt.executeUpdate(tmp);
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public LinkedList<Book> queryBook (String text, int queryType) {
        try {
            Statement stmt = connection.createStatement();
            String sql = null;
            if (queryType == QUERY_BY_NAME) {
                sql = "SELECT * FROM book WHERE name='" + text + "'";
            } else if (queryType == QUERY_BY_TYPE) {
                if (text == null)  //如果传过来的文本是null 则取出全部book
                    sql = "SELECT * FROM book";
                else
                    sql = "SELECT * FROM book WHERE type='" + text + "'";
            }
            LinkedList<Book> list = new LinkedList<Book>();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Book book = new Book(rs.getInt("number"), rs.getString("name"), rs.getString("auther"), rs.getDouble("price"),
                        rs.getString("type"), rs.getString("publish"), rs.getString("description"), rs.getInt("inventory"));
                book.setPath(rs.getString("path"));
                list.add(book);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void giveBack () {
        pool.giveBack(connection);
    }
}
