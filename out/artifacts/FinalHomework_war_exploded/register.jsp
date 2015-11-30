<%--
  Created by IntelliJ IDEA.
  User: 云航
  Date: 2015/11/28
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="Zh-cn">
<head>
    <title>用户注册</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/bootstrap-3.3.5/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <script src="./css/bootstrap-3.3.5/js/tests/vendor/jquery.min.js"></script>
    <script src="./css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
    <script src="./script/main.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-3">
            <form role="form" method="post" action="register">
                <div class="form-group">
                    <span class="help-block">欢迎您注册，请您填写以下信息。</span>
                    <label>
                        用户名
                    </label>
                    <input type="text" class="form-control" name="username" />
                </div>
                <div class="form-group">

                    <label>
                        用户密码
                    </label>
                    <input type="password" class="form-control" name="password" />
                </div>
                <div class="form-group">
                    <label>电话号码</label>
                    <input type="number" class="form-control" name="phone_number">
                </div>
                <div class="form-group">
                    <label>真实姓名</label>
                    <input type="text" class="form-control" name="real_name">
                </div>
                <div class="form-group">
                    <label>邮政编码</label>
                    <input type="number" class="form-control" name="post_name">
                </div>
                <button type="submit" class="btn btn-info">
                    注册
                </button>
                <input type="button" class="btn btn-default" value="取消" onclick="returnHome();" >
            </form>
        </div>
        <div class="col-md-5">
        </div>
    </div>
</div>
</body>
</html>
