<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--<jsp:forward page="/categories"/>--%>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/6
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <%--web路径：
        1.不以/开始的相对路径，找资源以当前的路径为基准，容易错
        2.以/开始的相对路径，（http://localhost:3306）
    --%>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/css/cover.css" rel="stylesheet">
    <title>个人博客管理系统</title>
</head>
<body>

<%--搭建显示页面--%>
<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">BlogMaster</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="#">Welcome</a></li>
                            <%--获取session显示login或zdd--%>
                            <li><a href="#">login</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="inner cover">
                <h1 class="cover-heading">Welcome.</h1>
                <p class="lead">BlogMaster is a management system for you to manage your articles of your blog. Add, edit the article, delete, search... Visitors can read your articles on your own blog page.</p>
                <p class="lead">

                    <%--login or articlepage--%>

                    <a class="btn btn-primary btn-lg" href="${APP_PATH}/articlePage" role="button"> Let's go!</a>
                    <%--<a class="btn btn-primary btn-lg" href="${APP_PATH}/categoryPage" role="button"> Category</a>
                    <a class="btn btn-primary btn-lg" href="${APP_PATH}/draftPage" role="button"> Draft</a>
                    <a class="btn btn-primary btn-lg" href="${APP_PATH}/recyclePage" role="button"> Recycle</a>--%>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Blog for <a href="${APP_PATH}/covfefe">Covfefe</a>, by <a href="mailto:zdd1995@mail.ustc.edu.cn">@zdd</a>.</p>
                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>
