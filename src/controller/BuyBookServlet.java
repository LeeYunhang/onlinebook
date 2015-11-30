package controller;

import entity.Book;
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
 * Created by 云航 on 2015/11/29.
 */
@WebServlet(name = "BuyBookServlet", urlPatterns = "/buyBook")
public class BuyBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String count = request.getParameter("count");
        HttpSession session = request.getSession();
        UserDao dao = new UserDao();
        if (count != null) {
            Book book = (Book) session.getAttribute("book");
            User user = (User) session.getAttribute("user");

            if (user.getBalance() < Integer.parseInt(count) * book.getPrice()) {
                session.setAttribute("buyResult", "余额不足!");
            } else {
                user.setBalance(user.getBalance() - Integer.parseInt(count) * (int)book.getPrice());
                dao.updateUserBalance(user);
                session.setAttribute("buyResult", "购买成功!");
            }
        } else {
            session.setAttribute("buyResult", "请先登录!");
        }
        request.getRequestDispatcher("/information.jsp").forward(request, response);
        dao.giveBack();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
