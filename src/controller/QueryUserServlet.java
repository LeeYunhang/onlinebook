package controller;

import entity.User;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by 云航 on 2015/11/29.
 */
@WebServlet(name = "QueryUserServlet", urlPatterns = "/queryUser")
public class QueryUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        byte[] bytes = username.getBytes("ISO-8859-1");
        username = new String(bytes, "UTF-8");
        HttpSession session = request.getSession();
        LinkedList<User> list = new LinkedList<>();
        UserDao dao = new UserDao();
        User user = dao.getUser(username);

        if (user != null) {
            list.add(user);
            session.setAttribute("queryUsers", list);           //&#x5c06;&#x67e5;&#x8be2;&#x5230;&#x7684;&#x7528;&#x6237;&#x4fdd;&#x5b58;&#x5230;session&#x91cc;
        }
        session.setAttribute("who", "user");                    //显示用户
        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.giveBack();                                         //将连接的控制权交还给连接池
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao dao = new UserDao();
        LinkedList<User> list = dao.getAllUsers();
        HttpSession session = request.getSession();
        session.setAttribute("queryUsers", list);
        session.setAttribute("who", "user");
        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.giveBack();
    }
}
