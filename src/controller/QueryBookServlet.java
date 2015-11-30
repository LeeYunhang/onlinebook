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
@WebServlet(name = "QueryBookServlet", urlPatterns = "/queryBook")
public class QueryBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookname = request.getParameter("bookname");
        byte[] bytes = bookname.getBytes("ISO-8859-1");
        bookname = new String(bytes, "UTF-8");
        HttpSession session = request.getSession();
        BookDao dao = new BookDao();
        LinkedList<Book> list = new LinkedList<>();
        LinkedList<Book> sessionkList = (LinkedList<Book>)session.getAttribute("queryBooks");
        if (sessionkList != null) {
            for (Book book : sessionkList) {
                if (book.getName().contains(bookname)) {
                    list.add(book);
                    break;
                }
            }
        }
        session.setAttribute("queryBooks", list);
        session.setAttribute("who", "book");       //显示书
        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.giveBack();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao dao = new BookDao();
        if (request.getParameter("type") == null || request.getParameter("type").equals("全部类型")) {
            request.getSession().setAttribute("queryBooks", dao.queryBook(null, BookDao.QUERY_BY_TYPE));
        } else {
            LinkedList<Book> list = dao.queryBook(request.getParameter("type"), BookDao.QUERY_BY_TYPE);
            request.getSession().setAttribute("queryBooks", list);
        }
        request.getSession().setAttribute("who", "book");
        request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        dao.giveBack();
    }
}
