package controller;

import tools.ResponseHtml;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 云航 on 2015/11/29.
 */
@WebServlet(name = "AdminLoginServlet", urlPatterns = "/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("admin_name");
        String password= request.getParameter("admin_password");

        byte[] bytes = null;
        bytes = name.getBytes("ISO-8859-1");
        name = new String(bytes, "UTF-8");
        bytes = password.getBytes("ISO-8859-1");
        password = new String(bytes, "UTF-8");

        if (name == null || name == null || !name.equals("admin") || !password.equals("admin")) {
            ResponseHtml.alert(request, response, "管理员账号或密码出错！");
        } else{
            request.getRequestDispatcher("/back_stage.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
