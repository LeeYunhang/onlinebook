<%@ page import="java.util.LinkedList" %>
<%@ page import="entity.User" %>
<%@ page import="entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: 云航
  Date: 2015/11/29
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>后台管理页面</title>
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="./css/bootstrap-3.3.5/js/tests/vendor/jquery.min.js"></script>
    <script src="./css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
    <script src="./script/main.js"></script>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">图书馆商城后台管理界面</a>
    </div>
    <p class="navbar-text"><span name="manager_name">管理员</span><span>,欢迎您</span></p>
    <div class="container-fluid navbar-right">
        <div class="row">
            <!--<div class="col-md-2"></div>-->
            <div class="col-md-5">
                <button type="button" class="btn btn-default navbar-btn" onclick="returnHome();">
                    首页
                </button>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-warning navbar-btn" onclick="closeWindow();">
                    退出
                </button>
            </div>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">管理菜单</h3>
                </div>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="/queryUser">查看用户</a></li>
                    <li><a href="/queryBook">查看商品</a></li>
                    <br><br><br><br><br><br><br><br>
                    <br><br><br><br><br><br><br><br>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12" id="lookUser" <%
                        Object who = session.getAttribute("who");
                        if (who != null && !who.equals("user")) {
                            out.print("hidden");
                        }
                    %>>
                        <form class="form-inline" role="form" method="post" action="/queryUser">
                            <div class="form-group">
                                <label class="sr-only" for="name">用户名称</label>
                                <input type="text" class="form-control" placeholder="请输入名称" name="username">
                            </div>
                            <button type="submit" class="btn btn-primary">搜索</button>
                            <button type="button" class="btn btn-success" data-target="#userModalAdd" data-toggle="modal">添加</button>
                        </form>
                    </div>
                    <div class="col-md-12" id="lookUserTable" <%
                        if (who != null && !who.equals("user")) {
                            out.print("hidden");
                        }
                    %>>
                        <table class="table table-striped">
                            <caption>用户信息如下</caption>
                            <thead>
                            <tr>
                                <th>用户名</th>
                                <th>用户密码</th>
                                <th>电话号码</th>
                                <th>真实姓名</th>
                                <th>邮政编码</th>
                                <th>余额</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                LinkedList<User> list = (LinkedList<User>)session.getAttribute("queryUsers");
                                if (list != null) {
                                    for (User user : list) {
                                        out.println("<tr>");
                                        out.println("<td>" + user.getUserName() + "</td>");
                                        out.println("<td>" + user.getPassword() + "</td>");
                                        out.println("<td>" + user.getPhoneNumber() + "</td>");
                                        out.println("<td>" + user.getRealName() + "</td>");
                                        out.println("<td>" + user.getPostCode() + "</td>");
                                        out.println("<td>" + user.getBalance() + "</td>");
                                        out.println("<td> <a class=\"text-primary\" href=\"/deleteUser?name=" + user.getUserName() + "\", data-target=\"#userModal\" data-toggle=\"modal\">编辑</a>");
                                        out.println("<a class=\"text-danger\" href=\"/deleteUser?name=" + user.getUserName() + "\">删除</a>");
                                        out.println("</tr>");
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12" id="lookBook"
                            <%
                                if (who == null || !who.equals("book")) {
                                    out.print("hidden");
                                }
                            %>
                    >
                        <form class="form-inline" role="form" method="post" action="/queryBook">
                            <div class="form-group">
                                <label class="sr-only" for="name">图书名称</label>
                                <input type="text" class="form-control" id="name" name="bookname" placeholder="请输入名称">
                            </div>
                            <div class="form-group">
                                <div class="dropdown">
                                    <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
                                            data-toggle="dropdown">
                                        选择图书类型
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=全部类型">全部类型</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=儿童类">儿童类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=化工类">化工类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=计算机类">计算机类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=军事类">军事类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=科技类">科技类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=小说类">小说类</a>
                                        </li>
                                        <li role="presentation">
                                            <a role="menuitem" tabindex="-1" href="/queryBook?type=其他类">其他类</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">搜索</button>
                            <button type="button" class="btn btn-success" data-target="#bookModalAdd" data-toggle="modal">添加</button>
                        </form>
                    </div>
                    <div class="col-md-12" id="lookBookTable" <%
                        if (who == null || !who.equals("book")) {
                            out.print("hidden");
                        }
                    %>>
                        <table class="table table-striped">
                            <caption>商品信息如下</caption>
                            <thead>
                            <tr>
                                <th>图书编号</th>
                                <th>书名</th>
                                <th>作者</th>
                                <th>价格</th>
                                <th>类型</th>
                                <th>出版社</th>
                                <th>描述</th>
                                <th>库存</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                LinkedList<Book> list1 = (LinkedList<Book>)session.getAttribute("queryBooks");
                                if (list1 != null) {
                                    for (Book book : list1) {
                                        out.println("<tr>");
                                        out.println("<td>" + book.getId() + "</td>");
                                        out.println("<td>" + book.getName() + "</td>");
                                        out.println("<td>" + book.getAuther() + "</td>");
                                        out.println("<td>" + book.getPrice() + "</td>");
                                        out.println("<td>" + book.getType() + "</td>");
                                        out.println("<td>" + book.getPublish() + "</td>");
                                        out.println("<td>" + book.getDescription() + "</td>");
                                        out.println("<td>" + book.getInventory() + "</td>");
                                        out.println("<td> <a class=\"text-primary\" href=\"#\", data-target=\"#bookModal\" data-toggle=\"modal\">编辑</a>");
                                        out.println("<a class=\"text-danger\" href=\"#\">删除</a>");
                                        out.println("</tr>");
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="bookModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑图书信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-3">书名:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">作者:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">价格:</label>
                        <div class="col-sm-6"><input type="number" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">图书类型:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">出版社:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">描述:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">库存:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="bookModalAdd" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabelAdd">
                    新增图书
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" ID="book_add" role="form" method="post" action="/bookAdd" enctype="multipart/form-data">
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">书名:</label>--%>
                        <%--<div class="col-sm-6"><input type="text" class="form-control" name="bookname"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">编号:</label>--%>
                        <%--<div class="col-sm-6"><input type="number" class="form-control" name="number"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">作者:</label>--%>
                        <%--<div class="col-sm-6"><input type="text" class="form-control" name="auther"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">价格:</label>--%>
                        <%--<div class="col-sm-6"><input type="number" class="form-control" name="price"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">图书类型:</label>--%>
                        <%--<div class="col-sm-6"><input type="text" class="form-control" name="type"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">出版社:</label>--%>
                        <%--<div class="col-sm-6"><input type="text" class="form-control" name="publish"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">描述:</label>--%>
                        <%--<div class="col-sm-6"><input type="text" class="form-control" name="description"></div>--%>
                    <%--</div>--%>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label col-sm-3">库存:</label>--%>
                        <%--<div class="col-sm-6"><input type="number" class="form-control" name="inventory"></div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <div class="col-sm-6"><input type="file" id="exampleInputFile" name="file" /></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="document.getElementById('book_add').submit();">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="userModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    编辑用户信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-3">用户名:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">用户密码:</label>
                        <div class="col-sm-6"><input type="password" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">真实姓名:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">邮政编码:</label>
                        <div class="col-sm-6"><input type="password" class="form-control"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">账户余额:</label>
                        <div class="col-sm-6"><input type="text" class="form-control"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="userModalAdd" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1add">
                    请填写用户信息
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="add_user" method="post" action="/userAdd">
                    <div class="form-group">
                        <label class="control-label col-sm-3">用户名:</label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="username"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">用户密码:</label>
                        <div class="col-sm-6"><input type="password" class="form-control" name="password"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">真实姓名:</label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="realname"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">手机号码:</label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="number"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">邮政编码:</label>
                        <div class="col-sm-6"><input type="password" class="form-control" name="postcode"></div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3">账户余额:</label>
                        <div class="col-sm-6"><input type="text" class="form-control" name="balance"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="document.getElementById('add_user').submit();">
                    确认
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
