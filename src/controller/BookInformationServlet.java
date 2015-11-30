package controller;

import entity.Book;
import dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;

/**
 * Created by 云航 on 2015/11/29.
 */
@WebServlet(name = "BookInformationServlet", urlPatterns = "/bookInformation")
public class BookInformationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookNumber = request.getParameter("id");
        if (bookNumber != null) {
            BookDao dao = new BookDao();
            LinkedList<Book> list = dao.queryBook(null, BookDao.QUERY_BY_TYPE);
            for (Book book : list) {
                if (book.getId() == Integer.parseInt(bookNumber)) {
                    request.getSession().setAttribute("book", book);
                    break;
                }
            }

            request.getRequestDispatcher("/information.jsp").forward(request, response);
            dao.giveBack();
        }
    }
}
