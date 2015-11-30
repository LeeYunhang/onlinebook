package controller;

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
@WebServlet(name = "DeleteUserServlet", urlPatterns = "/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        UserDao dao = new UserDao();
        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.deleteUser(name);
        dao.giveBack();
    }
}
