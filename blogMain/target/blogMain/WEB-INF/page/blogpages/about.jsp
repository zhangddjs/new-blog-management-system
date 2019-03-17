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
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <title>Blog Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${APP_PATH}/static/css/blog.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/covfefe.css" rel="stylesheet">

</head>

<body>

<div class="blog-masthead">
    <div class="container">
        <nav class="blog-nav">
            <a class="blog-nav-item" href="${APP_PATH}/covfefe">Home</a>
            <a class="blog-nav-item" href="${APP_PATH}/contact">Contact</a>
            <a class="blog-nav-item active" href="${APP_PATH}/about">About</a>
        </nav>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="blog-header">
            <h1 class="blog-title"><a href="${APP_PATH}/covfefe">Covfefe</a></h1>
            <p class="lead blog-description">This is the home page of zdd's blog, you can read some tech articles.</p>
        </div>
    </div>

    <div class="row">

        <div class="col-sm-8 blog-main" id="blog_post_divs">
            <div class="row blog-post">
                <h2 class="blog-post-title">Just about me</h2>
                <p class="blog-post-meta">December 20, 2018 by <a href="#">Administrator</a></p>
                <p>姓名：zdd</p>
                <p>性别：男</p>
                <p>出生年月：1995</p>
                <p>学校：铃兰男子高等学校 </p>
                <p>工作：互联网、计算机 </p>
                <p>公司：xxxx </p>
                <p>专业：软件工程 </p>
                <p>爱好：羽毛球 </p>
                <p>地址：合肥 </p>
                <p>家乡：无锡 </p>
                <hr>
                <h2>About my blog</h2>
                <hr>
                <p>域 名：www.zdd.com 创建于2018年12月20日 <a href="http://www.net.cn/domain/" class="blog_link"
                                                        target="_blank">&nbsp;&nbsp;注册域名&nbsp;&nbsp;</a><a class="blog_link"
                                                                                   href="http://koubei.baidu.com"
                                                                                   target="_blank">邀你点评</a></p>
                <p>服务器：阿里云服务器<a
                        href="http://www.aliyun.com/product/ecs/?ali_trackid=2:mm_11085263_4976026_15602229:1389838528_3k2_34164590"
                        class="blog_link" target="_blank">&nbsp;&nbsp;购买空间&nbsp;&nbsp;</a><a href="#"
                                                                     target="_blank" class="blog_link">参考我的空间配置</a></p>
                <p>程 序：SSM 博客CMS7.0</p>
                <p>微信公众号：covfefe</p>
            </div><!-- /.blog-post -->
        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <div class="sidebar-module sidebar-module-inset">
                <h4>About</h4>
                <p>网名：Covfefe | 海飞丝实力派<br>职业：程序猿<br>籍贯：江苏省—无锡市<br>电话：183****9653<br>邮箱：<a href="#">zdd1995<em>@mail.ustc.edu.cn</em></a></p>
                <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
                    fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            </div>
            <div class="sidebar-module">
                <h4>Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="#">GitHub</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Facebook</a></li>
                </ol>
            </div>
        </div><!-- /.blog-sidebar -->

    </div><!-- /.row -->

</div><!-- /.container -->

<footer class="blog-footer">
    <p>Blog for <a href="${APP_PATH}/covfefe">Covfefe</a>, by <a href="#">@zdd</a>.</p>
    <p>版权所有 ©2016 中国科学技术大学</p>
    <p>地址：安徽省合肥市金寨路 96 号，邮政编码：230026 </p>
    <p>联系我们 皖ICP备05002528号</p>
</footer>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<%--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>--%>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<%--时间格式插件--%>
<script type="text/javascript" src="${APP_PATH}/static/js/dateformat.js"></script>


</body>
</html>
