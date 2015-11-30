package tools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 云航 on 2015/11/29.
 */
public class ResponseHtml {
    public static void alert (HttpServletRequest request, HttpServletResponse response, String text) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>结果</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<script>alert(\""+ text +"\");</script>");
        out.println("</body>");
        out.println("</html>");
    }
}