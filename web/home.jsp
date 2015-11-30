<%@ page import="dao.BookDao" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="entity.Book" %>
<%@ page import="sun.rmi.runtime.Log" %>
<%@ page import="com.sun.org.apache.xpath.internal.SourceTree" %><%--
  Created by IntelliJ IDEA.
  User: 云航
  Date: 2015/11/28
  Time: 0:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title><link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="./css/bootstrap-3.3.5/js/tests/vendor/jquery.min.js"></script>
    <script src="./css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="./home.jsp?type=全部分类" name="type"><button type="button" class="list-group-item">全部分类</button></a>
                <a href="./home.jsp?type=儿童类" name="type"><button type="button" class="list-group-item">儿童类</button></a>
                <a href="./home.jsp?type=科技类" name="type"><button type="button" class="list-group-item">科技类</button></a>
                <a href="./home.jsp?type=军事类" name="type"><button type="button" class="list-group-item">军事类</button></a>
                <a href="./home.jsp?type=小说类" name="type"><button type="button" class="list-group-item">小说类</button></a>
                <a href="./home.jsp?type=计算机类" name="type"><button type="button" class="list-group-item">计算机类</button></a>
                <a href="./home.jsp?type=化工类" name="type"><button type="button" class="list-group-item">化工类</button></a>
                <a href="./home.jsp?type=其它类" name="type"><button type="button" class="list-group-item">其它类</button></a>
            </div>
        </div>
        <div class="col-md-6">
            <div class="my-books">
                <table class="table my-table">
                    <tbody>
                    <%
                        BookDao dao = new BookDao();
                        LinkedList<Book> list = null;
                        String type = request.getParameter("type");

                        if (type != null) {
                            if (type.equals("全部分类"))
                                list = dao.queryBook(null, BookDao.QUERY_BY_TYPE);
                            else if (type.equals("儿童类"))
                                list = dao.queryBook("儿童类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("科技类"))
                                list = dao.queryBook("科技类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("军事类"))
                                list = dao.queryBook("军事类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("小说类"))
                                list = dao.queryBook("小说类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("计算机类"))
                                list = dao.queryBook("计算机类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("化工类"))
                                list = dao.queryBook("化工类", BookDao.QUERY_BY_TYPE);
                            else if (type.equals("其它类"))
                                list = dao.queryBook("其它类", BookDao.QUERY_BY_TYPE);
                        } else {
                            if (request.getSession().getAttribute("showBooks") != null)
                                list = (LinkedList<Book>)request.getSession().getAttribute("showBooks");
                            else
                                list = dao.queryBook(null, BookDao.QUERY_BY_TYPE);
                        }

                        for (int i = 0; i < list.size(); ++i) {
                            out.print("<tr>");
                            for (int j = 0; j < 4 && i < list.size(); ++j, ++i) {
                                out.print("<td><a href=\"/bookInformation?id=" + list.get(i).getId() + "\"><img src=\"" + list.get(i).getPath() + "\" class=\"img-rounded\"></a></td>");
                            }
                            out.print("</tr>");
                        }
                        dao.giveBack();
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>