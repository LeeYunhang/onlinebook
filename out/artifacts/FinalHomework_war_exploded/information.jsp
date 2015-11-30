<%@ page import="entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: 云航
  Date: 2015/11/29
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>图书信息</title>
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="./css/bootstrap-3.3.5/js/tests/vendor/jquery.min.js"></script>
    <script src="./css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
    <script src="./script/main.js"></script>
</head>
<body>
<%
    Book book = (Book) session.getAttribute("book");
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <%
                            out.print("<img src=\"");
                            out.print(book.getPath());
                            out.print("\" class=\"img-rounded\">");
                        %>
                    </div>
                    <div class="col-md-9 text-primary"><h2 name="book_name"><%out.print(book.getName());%></h2></div>
                    <div class="col-md-9 text-danger"><h3 name="book_price">$<%out.print(book.getPrice());%></h3></div>
                    <div class="col-md-9">

                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-7">
                                    <form class="form-horizontal" role="form" method="post" action="/buyBook">
                                        <div class="form-group">

                                            <label class="col-sm-6 control-label">请输入购买数量(<%out.print(book.getInventory());%>)</label>
                                            <div class="col-sm-6"><input type="number" class="form-control" name="count"></div>
                                            <div class="col-sm-12"><label>&nbsp</label></div>
                                            <div class="col-sm-7">
                                                <button type="submit" class="btn btn-success form-control">立即购买</button>
                                            </div>
                                            <div class="col-sm-5">
                                                <span class="text-danger">
                                                    <%
                                                        if (session.getAttribute("buyResult") != null) {
                                                            out.print((String)session.getAttribute("buyResult"));
                                                        }
                                                    %>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="panel col-md-4">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item">图书信息简介</li>
                                <li class="list-group-item">
                                    <span>编号:</span>
                                    <span name="book_id"><%out.print(book.getId());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>书名:</span>
                                    <span name="book_name"><%out.print(book.getName());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>作者:</span>
                                    <span name="book_name"><%out.print(book.getAuther());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>价格:</span>
                                    <span name="book_prime">$<%out.print(book.getPrice());%></span>
                                </li>


                            </ul>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="panel col-md-4">
                        <div class="panel-body">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <span>类型:</span>
                                    <span name="book_prime"><%out.print(book.getType());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>库存:</span>
                                    <span name="book_prime"><%out.print(book.getInventory());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>出版社:</span>
                                    <span name="book_prime"><%out.print(book.getPublish());%></span>
                                </li>
                                <li class="list-group-item">
                                    <span>描述:</span>
                                    <span name="book_prime"><%out.print(book.getDescription());%></span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
</body>
</html>
