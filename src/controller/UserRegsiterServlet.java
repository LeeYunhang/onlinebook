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

/**
 * Created by 云航 on 2015/11/28.
 */
@WebServlet(name = "UserRegsiterServlet", urlPatterns = "/register")
public class UserRegsiterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = (String) request.getParameter("username");
        String password = (String)request.getParameter("password");
        String phoneNumber = (String)request.getParameter("phone_number");
        String realName = (String)request.getParameter("real_name");
        String postCode = (String)request.getParameter("post_name");
        User user = new User(userName, password, phoneNumber, realName, postCode);
        UserDao dao = new UserDao();
        dao.saveUser(user);
        HttpSession session = request.getSession();
        session.setAttribute("username", userName);
        request.getRequestDispatcher("./home.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
