package controller;

import entity.Book;
import dao.BookDao;

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
@WebServlet(name = "UserSearchBookServlet", urlPatterns = "/search")
public class UserSearchBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String content = request.getParameter("content");
        byte[] bytes = content.getBytes("ISO-8859-1");
        content = new String(bytes, "UTF-8");
        String[] contents = content.split("\\s+");
        if (content != null) {
            BookDao dao = new BookDao();
            LinkedList<Book> list = dao.queryBook(null, BookDao.QUERY_BY_TYPE);
            LinkedList<Book> reusltList = new LinkedList<>();
            for (Book item : list) {
                boolean contain = false;
                for (String str : contents) {
                    if (item.getName().contains(str)) {
                        contain = true;
                    }
                }
                if (contain) reusltList.add(item);
            }

            dao.giveBack();
            request.getSession().setAttribute("showBooks", reusltList);
            request.getRequestDispatcher("./index.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
