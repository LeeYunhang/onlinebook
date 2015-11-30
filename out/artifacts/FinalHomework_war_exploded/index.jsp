<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.mysql.*" %>
<%@ page import="com.mysql.jdbc.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>在线图书商城</title>
  <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="./css/main.css">
  <script src="./css/bootstrap-3.3.5/js/tests/vendor/jquery.min.js"></script>
  <script src="./css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
  <script src="./script/main.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header ">
      <a class="navbar-brand" href="/index.jsp">图书馆在线商城</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left" name="search" role="search" method="post" action="./search">
        <div class="form-group">
          <input type="text" class="form-control" name="content" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <a class="navbar-text" style="cursor:pointer;"><%
        if (session.getAttribute("username") != null) {
          out.print(session.getAttribute("username"));
        } else {
          out.print("未登录");
        }
      %></a>
      <div class="container-fluid navbar-right">
        <div class="col-md-6">
          <button type="button" class="btn btn-success navbar-btn" data-target="#myModal" data-toggle="modal">登录</button>
        </div>
        <div class="col-md-6">
          <button type="button" class="btn btn-default navbar-btn navbar-right" onclick="document.getElementById('inner_page').src='register.jsp';">注册</button>
        </div>
      </div>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10" style="background:#FFF; height:60%">
      <iframe id="inner_page" src="./home.jsp" frameborder="0" height="520px" width="100%">
      </iframe>
    </div>
    <div class="col-md-1"></div>
  </div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-6">
        <p class="navbar-text navbar-right">Copyright.</p>
      </div>
    </div>
  </div>
</nav>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"
                data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel">
          欢迎您登陆
        </h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="post" action="/login" role="form">
          <div class="form-group">
            <label class="control-label col-sm-3">请输入名字:</label>
            <div class="col-sm-6"><input type="text" class="form-control" name="login_name"></div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-3">请输入密码:</label>
            <div class="col-sm-6"><input type="password" class="form-control" name="login_password"></div>
          </div>
          <div class="form-group">
            <div class="col-sm-3"></div>
            <button type="submit" class="btn btn-primary">登陆</button>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-success" data-target="#manager_login" data-toggle="modal">
          管理员登陆
        </button>

      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal -->
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="manager_login" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"
                data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <h4 class="modal-title" id="myModalLabel1">
          欢迎管理员
        </h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" method="post" action="/adminLogin">
          <div class="form-group">
            <label class="control-label col-sm-3">请输入名字:</label>
            <div class="col-sm-6"><input type="text" class="form-control" name="admin_name"></div>
          </div>
          <div class="form-group">
            <label class="control-label col-sm-3">请输入密码:</label>
            <div class="col-sm-6"><input type="password" class="form-control" name="admin_password"></div>
          </div>
          <div class="form-group">
            <div class="col-sm-3"></div>
            <button type="submit" class="btn btn-primary" onclick="enterBackStage();">登陆</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
