package controller;

import entity.User;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 云航 on 2015/11/30.
 */
@WebServlet(name = "UserAddServlet", urlPatterns = "/userAdd")
public class UserAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String realname = request.getParameter("realname");
        UserDao dao = new UserDao();
        byte[] bytes = username.getBytes("ISO-8859-1");

        username = new String(bytes, "UTF-8");
        bytes = realname.getBytes("ISO-8859-1");
        realname = new String(bytes, "UTF-8");

        User user = new User(username, request.getParameter("password"), request.getParameter("number"),
                realname, request.getParameter("postcode"));
        user.setBalance(Integer.parseInt(request.getParameter("balance")));
        dao.saveUser(user);

        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.giveBack();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
