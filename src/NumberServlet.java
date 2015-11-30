import tools.ResponseHtml;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 云航 on 2015/11/30.
 */
@WebServlet(name = "NumberServlet", urlPatterns = "/num")
public class NumberServlet extends HttpServlet {
    private static int realNumber = 10;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int number = Integer.parseInt(request.getParameter("number"));
        if (realNumber == number) {
            realNumber = (int)(Math.random() * 100);
            ResponseHtml.alert(request, response, "猜对了！");
        } else {
            ResponseHtml.alert(request, response, "猜错了！");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
