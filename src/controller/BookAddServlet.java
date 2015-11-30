package controller;

import entity.Book;
import tools.Encode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Created by 云航 on 2015/11/30.
 */
@WebServlet(name = "BookAddServlet", urlPatterns = "/bookAdd")
public class BookAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String savePath = request.getServletContext().getRealPath("/img");
        Collection<Part> parts = request.getParts();
        if (parts.size() == 1) {
            Part part = request.getPart("file");
            String hedaer = part.getHeader("content-disposition");

        }

        String bookname = Encode.ISO8859ToUtf8(request.getParameter("bookname"));
        String number = request.getParameter("number");
        String auther = Encode.ISO8859ToUtf8(request.getParameter("auther"));
        String price = request.getParameter("price");
        String type = Encode.ISO8859ToUtf8(request.getParameter("type"));
        String publish = Encode.ISO8859ToUtf8(request.getParameter("publish"));
        String description = Encode.ISO8859ToUtf8(request.getParameter("description"));
        String inventory = Encode.ISO8859ToUtf8(request.getParameter("inventory"));
        String data = request.getParameter("file");
        byte[] buffer = request.getParameter("file").getBytes("ISO-8859-1");
        String path = "/img/" + type + "/" + bookname + ".png";

        Book book = new Book(Integer.parseInt(number), bookname, auther, Double.parseDouble(price),
                type, publish, description, Integer.parseInt(inventory));
        book.setPath(path);
        //File file = new File(path);
        PrintWriter writer = new PrintWriter(path);
        writer.print(buffer);
        writer.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
