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
            <a class="blog-nav-item active" href="${APP_PATH}/covfefe">Home</a>
            <a class="blog-nav-item" href="${APP_PATH}/contact">Contact</a>
            <a class="blog-nav-item" href="${APP_PATH}/about">About</a>
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

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
            <div class="sidebar-module sidebar-module-inset">
                <h4>About</h4>
                <p>网名：Covfefe | 海飞丝实力派<br>职业：程序猿<br>籍贯：江苏省—无锡市<br>电话：183****9653<br>邮箱：<a href="mailto:zdd1995@mail.ustc.edu.cn">zdd1995<em>@mail.ustc.edu.cn</em></a>
                </p>
                <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
                    fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            </div>
            <div class="sidebar-module">
                <h4>Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="https://github.com/zhangddjs">GitHub</a></li>
                    <li><a href="https://twitter.com/covfefe_zdd">Twitter</a></li>
                    <li><a href="https://www.facebook.com/zhangddjs">Facebook</a></li>
                </ol>
            </div>
        </div><!-- /.blog-sidebar -->

    </div><!-- /.row -->
    <%--按钮--%>
    <nav>
        <ul class="pager">
            <li><a href="#"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span> Back to top</a></li>
            <li><a href="#" onclick="articleLike(${articleId})"><span class="glyphicon glyphicon-thumbs-up"
                                                                      aria-hidden="true"></span> Like</a></li>
        </ul>
    </nav>

    <div class="row">
        <div class="row col-sm-8">
            <h4><b>Comments</b></h4>
        </div>
    </div>

    <div class="col-sm-8 row blog-post" id="comments_divs">
    </div>


    <div class="row">
        <div class="col-sm-8 row blog-post">
            <div class="form-group">
                <label for="comment_text"><b>Write Your Comment here</b></label>
                <textarea class="form-control" name="comment" id="comment_text" placeholder="comment" rows="4"
                          cols="20"></textarea>
            </div>
            <div class="form-group">
                <label for="comment_visitor_input"><b>Write Your Name Or Email here</b></label>
                <input class="form-control" name="visitor_name" id="comment_visitor_input" placeholder="name"></input>
            </div>
            <button type="button" class="btn btn-default" id="comment_button"> Submit
            </button>
        </div>
    </div>


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

<script type="text/javascript">

    var search_keyword = "";

    //1、页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        //获取类别
        getCategories("#category_article_select");
        getArticleById(${articleId});
        getComments(${articleId});
    })

    //获取类别
    //查出所有的类别信息并显示在下拉列表中
    function getCategories(ele) {
        $(ele).empty();
        var originEle = $("<option></option>").append("---分类---").attr("value", 0); //初始分类
        originEle.appendTo(ele);
        $.ajax({
            url: "${APP_PATH}/articleAddOrEditCategories",
            type: "GET",
            success: function (result) {
                //console.log(result)
                //显示文章信息在下拉列表中
                $.each(result.extend.categories, function () {
                    if (this.id != 2 && this.id != 3) {
                        var optionEle = $("<option></option>").append(this.categoryName).attr("value", this.id);
                        optionEle.appendTo(ele)
                    }
                });
            }
        });
    }

    //获取文章类别
    function getCategory(id) {
        var categoryName = "";
        $.ajax({
            url: "${APP_PATH}/category/" + id,
            type: "GET",
            async: false,//将同步标志改为false，代表执行完后续代码才返回结果   会有警告
            success: function (result) {
                categoryName = result.extend.category.categoryName;
            }
        })
        return categoryName;
    }

    //生成文章信息
    var gen_article = function (articleData) {
        var titleChild = $("<h2></h2>").append("<a id='cb_post_title_url' href='${APP_PATH}/content/" + articleData.id + "'>" + articleData.title + "</a>");
        var postTimeVal = getMyDate(articleData.postTime);
        var postTimeValFormat = $.formatDate("hh:mm ee dd,yyyy", postTimeVal);
        var postTimeChild = $("<p class='blog-post-meta'></p>").append(postTimeValFormat + " by ");
        var authorChild = $("<a href=\"#\"></a>").append(articleData.author);
        var favorNumChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; favor: " + articleData.favorNum);
        var pageviewNumChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; view: " + articleData.pageviewNum);
        var categoryNameChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; category: " + getCategory(articleData.categoryId));
        var infoChild = postTimeChild.append(authorChild).append(favorNumChild).append(pageviewNumChild).append(categoryNameChild);
        $("<div class='row blog-post covfefe'></div>").append(titleChild)
            .append(infoChild)
            .append(articleData.content)
            // .append(imgUrlChild)
            .appendTo("#blog_post_divs");     //添加单元格
    }



    //获取文章信息
    function getArticleById(id) {
        $.ajax({
            url: "${APP_PATH}/article/" + id,
            type: "GET",
            success: function (result) {
                //清空table表格
                $("#blog_post_divs").html("");
                var articleData = result.extend.article;
                articleData.pageviewNum++;
                //更新文章的浏览量
                $.ajax({
                    url: "${APP_PATH}/articleViewed/" + id,
                    type: "PUT",
                    data: $.param({
                        title: articleData.title,
                        author: articleData.author,
                        brief: articleData.brief,
                        categoryId: articleData.categoryId,
                        postTime: new Date(articleData.postTime),
                        pageviewNum: articleData.pageviewNum,
                        favorNum: articleData.favorNum,
                        imgUrl: articleData.imgUrl
                    }),
                    success: function () {
                        gen_article(articleData);
                    }
                });
            }
        })
    }

    //获取评论
    //查出所有的评论信息并显示在下拉列表中
    function getComments(id) {
        $("#comments_divs").empty();
        $.ajax({
            url: "${APP_PATH}/comments/" + id,
            type: "GET",
            success: function (result) {
                //显示评论信息在下拉列表中
                var commentData = result.extend.comments;
                gen_comment(commentData)
            }
        });
    }

    //生成评论
    var gen_comment = function (commentData) {
        $.each(commentData, function () {
            var contentChild = $("<p></p>").append(this.content);
            var postTimeVal = getMyDate(this.postTime);
            var postTimeValFormat = $.formatDate("hh:mm ee dd,yyyy", postTimeVal);
            var postTimeChild = $("<p class='blog-post-meta'></p>").append(postTimeValFormat + " by ");
            var visitorNameChild = $("<b></b>").append(this.visitorName);
            var infoChild = postTimeChild.append(visitorNameChild);
            $("<div class='row'></div>").append("<hr>")
                .append(postTimeChild)
                .append(infoChild)
                .append(contentChild)
                // .append(imgUrlChild)
                .appendTo("#comments_divs");     //添加单元格
        });
    }

    //喜欢事件
    var articleLike = function (id) {

        $.ajax({
            url: "${APP_PATH}/article/" + id,
            type: "GET",
            success: function (result) {
                //清空table表格
                var articleData = result.extend.article;
                articleData.favorNum++;
                //更新文章的浏览量
                $.ajax({
                    url: "${APP_PATH}/articleViewed/" + id,
                    type: "PUT",
                    data: $.param({
                        title: articleData.title,
                        author: articleData.author,
                        brief: articleData.brief,
                        categoryId: articleData.categoryId,
                        postTime: new Date(articleData.postTime),
                        pageviewNum: articleData.pageviewNum,
                        favorNum: articleData.favorNum,
                        imgUrl: articleData.imgUrl
                    }),
                    success: function () {
                        alert("点赞成功");
                        $("#blog_post_divs").html("");
                        gen_article(articleData);
                    }
                });
            }
        })
    }

    //搜索按钮事件
    $("#search_button").click(function () {
        search_keyword = $("#search_input").val();
        to_page(1);
    })

    //评论按钮事件
    $("#comment_button").click(function () {
        var commentContent = $("#comment_text").val();
        var d, s = ""; //Declare variables.
        d = new Date(); //Create Date object.
        s += (d.getMonth() + 1) + "/"; //Get month
        s += d.getDate() + "/"; //Get day
        s += d.getYear()+" ";
        s += d.getHours()+":";
        s += d.getMinutes()+":";
        s += d.getSeconds();
        console.log(getMyDate(new Date()));
        $.ajax({
            url: "${APP_PATH}/comment",
            type: "POST",
            data: $.param({
                content: commentContent,    //包括<div id=...>自身
                visitorName: $("#comment_visitor_input").val(),        //需要修改
                postTime: new Date(getMyDate(new Date())),
                articleId: ${articleId},
            }),
            success: function (result) {
                //alert(result.msg);
                if (result.code == 100) {
                    getArticleById(${articleId});
                    getComments(${articleId});
                } else {
                    if (undefined != result.extend.errorFields.categoryName) {
                        show_validate_msg("#categoryName_add_input", "error", result.extend.errorFields.categoryName);
                    }
                }
            }
        })
    })


    //jquery 时间戳与日期转换
    function getMyDate(str) {
        var oDate = new Date(str),
            oYear = oDate.getFullYear(),
            oMonth = oDate.getMonth() + 1,
            oDay = oDate.getDate(),
            oHour = oDate.getHours(),
            oMin = oDate.getMinutes(),
            oSen = oDate.getSeconds(),
            oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
        return oTime;
    };

    function getzf(num) {        //补0操作
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }
</script>
</body>
</html>
