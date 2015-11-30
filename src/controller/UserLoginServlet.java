package controller;

import entity.User;
import dao.UserDao;
import tools.ResponseHtml;

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
@WebServlet(name = "UserLoginServlet", urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("login_name");
        String password = request.getParameter("login_password");
        UserDao dao = new UserDao();
        User user = dao.getUser(username);
        if (user == null) {               //用户不存在
            ResponseHtml.alert(request, response, "账号不存在");
        } else if (!user.getPassword().equals(password)) {
            ResponseHtml.alert(request, response, "密码错误");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("user", user);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
