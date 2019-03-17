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
    <script src="${APP_PATH}/static/js/bootstrap-wysiwyg.js"></script>
    <link href="${APP_PATH}/static/css/dashboard.css" rel="stylesheet">
    <%--<link href="${APP_PATH}/static/css/fuwenben.css" rel="stylesheet">--%>

    <%--    <link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css"
              rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
              rel="stylesheet">--%>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">

    <%--富文本--%>
    <style type="text/css">
        .w-e-toolbar, .w-e-text-container, .w-e-menu-panel {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .w-e-toolbar *, .w-e-text-container *, .w-e-menu-panel * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .w-e-clear-fix:after {
            content: "";
            display: table;
            clear: both;
        }

        .w-e-toolbar .w-e-droplist {
            position: absolute;
            left: 0;
            top: 0;
            background-color: #fff;
            border: 1px solid #f1f1f1;
            border-right-color: #ccc;
            border-bottom-color: #ccc;
        }

        .w-e-toolbar .w-e-droplist .w-e-dp-title {
            text-align: center;
            color: #999;
            line-height: 2;
            border-bottom: 1px solid #f1f1f1;
            font-size: 13px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list {
            list-style: none;
            line-height: 1;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list li.w-e-item {
            color: #333;
            padding: 5px 0;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-list li.w-e-item:hover {
            background-color: #f1f1f1;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block {
            list-style: none;
            text-align: left;
            padding: 5px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block li.w-e-item {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            padding: 3px 5px;
        }

        .w-e-toolbar .w-e-droplist ul.w-e-block li.w-e-item:hover {
            background-color: #f1f1f1;
        }

        @font-face {
            font-family: 'w-e-icon';
            src: url(data:application/x-font-woff;charset=utf-8;base64,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) format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        [class^="w-e-icon-"], [class*=" w-e-icon-"] { /* use !important to prevent issues with browser extensions that change fonts */
            font-family: 'w-e-icon' !important;
            speak: none;
            font-style: normal;
            font-weight: normal;
            font-variant: normal;
            text-transform: none;
            line-height: 1; /* Better Font Rendering =========== */
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .w-e-icon-close:before {
            content: "\f00d";
        }

        .w-e-icon-upload2:before {
            content: "\e9c6";
        }

        .w-e-icon-trash-o:before {
            content: "\f014";
        }

        .w-e-icon-header:before {
            content: "\f1dc";
        }

        .w-e-icon-pencil2:before {
            content: "\e906";
        }

        .w-e-icon-paint-brush:before {
            content: "\f1fc";
        }

        .w-e-icon-image:before {
            content: "\e90d";
        }

        .w-e-icon-play:before {
            content: "\e912";
        }

        .w-e-icon-location:before {
            content: "\e947";
        }

        .w-e-icon-undo:before {
            content: "\e965";
        }

        .w-e-icon-redo:before {
            content: "\e966";
        }

        .w-e-icon-quotes-left:before {
            content: "\e977";
        }

        .w-e-icon-list-numbered:before {
            content: "\e9b9";
        }

        .w-e-icon-list2:before {
            content: "\e9bb";
        }

        .w-e-icon-link:before {
            content: "\e9cb";
        }

        .w-e-icon-happy:before {
            content: "\e9df";
        }

        .w-e-icon-bold:before {
            content: "\ea62";
        }

        .w-e-icon-underline:before {
            content: "\ea63";
        }

        .w-e-icon-italic:before {
            content: "\ea64";
        }

        .w-e-icon-strikethrough:before {
            content: "\ea65";
        }

        .w-e-icon-table2:before {
            content: "\ea71";
        }

        .w-e-icon-paragraph-left:before {
            content: "\ea77";
        }

        .w-e-icon-paragraph-center:before {
            content: "\ea78";
        }

        .w-e-icon-paragraph-right:before {
            content: "\ea79";
        }

        .w-e-icon-terminal:before {
            content: "\f120";
        }

        .w-e-icon-page-break:before {
            content: "\ea68";
        }

        .w-e-icon-cancel-circle:before {
            content: "\ea0d";
        }

        .w-e-icon-font:before {
            content: "\ea5c";
        }

        .w-e-icon-text-heigh:before {
            content: "\ea5f";
        }

        .w-e-toolbar {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            padding: 0 5px; /* flex-wrap: wrap; */ /* 单个菜单 */
        }

        .w-e-toolbar .w-e-menu {
            position: relative;
            text-align: center;
            padding: 5px 10px;
            cursor: pointer;
        }

        .w-e-toolbar .w-e-menu i {
            color: #999;
        }

        .w-e-toolbar .w-e-menu:hover i {
            color: #333;
        }

        .w-e-toolbar .w-e-active i {
            color: #1e88e5;
        }

        .w-e-toolbar .w-e-active:hover i {
            color: #1e88e5;
        }

        .w-e-text-container .w-e-panel-container {
            position: absolute;
            top: 0;
            left: 50%;
            border: 1px solid #ccc;
            border-top: 0;
            box-shadow: 1px 1px 2px #ccc;
            color: #333;
            background-color: #fff; /* 为 emotion panel 定制的样式 */ /* 上传图片的 panel 定制样式 */
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-close {
            position: absolute;
            right: 0;
            top: 0;
            padding: 5px;
            margin: 2px 5px 0 0;
            cursor: pointer;
            color: #999;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-close:hover {
            color: #333;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-title {
            list-style: none;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            font-size: 14px;
            margin: 2px 10px 0 10px;
            border-bottom: 1px solid #f1f1f1;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-title .w-e-item {
            padding: 3px 5px;
            color: #999;
            cursor: pointer;
            margin: 0 3px;
            position: relative;
            top: 1px;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-title .w-e-active {
            color: #333;
            border-bottom: 1px solid #333;
            cursor: default;
            font-weight: 700;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content {
            padding: 10px 15px 10px 15px;
            font-size: 16px; /* 输入框的样式 */ /* 按钮的样式 */
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content input:focus, .w-e-text-container .w-e-panel-container .w-e-panel-tab-content textarea:focus, .w-e-text-container .w-e-panel-container .w-e-panel-tab-content button:focus {
            outline: none;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content textarea {
            width: 100%;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content textarea:focus {
            border-color: #1e88e5;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content input[type=text] {
            border: none;
            border-bottom: 1px solid #ccc;
            font-size: 14px;
            height: 20px;
            color: #333;
            text-align: left;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content input[type=text].small {
            width: 30px;
            text-align: center;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content input[type=text].block {
            display: block;
            width: 100%;
            margin: 10px 0;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content input[type=text]:focus {
            border-bottom: 2px solid #1e88e5;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button {
            font-size: 14px;
            color: #1e88e5;
            border: none;
            padding: 5px 10px;
            background-color: #fff;
            cursor: pointer;
            border-radius: 3px;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.left {
            float: left;
            margin-right: 10px;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.right {
            float: right;
            margin-left: 10px;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.gray {
            color: #999;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button.red {
            color: #c24f4a;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container button:hover {
            background-color: #f1f1f1;
        }

        .w-e-text-container .w-e-panel-container .w-e-panel-tab-content .w-e-button-container:after {
            content: "";
            display: table;
            clear: both;
        }

        .w-e-text-container .w-e-panel-container .w-e-emoticon-container .w-e-item {
            cursor: pointer;
            font-size: 18px;
            padding: 0 3px;
            display: inline-block;
            *display: inline;
            *zoom: 1;
        }

        .w-e-text-container .w-e-panel-container .w-e-up-img-container {
            text-align: center;
        }

        .w-e-text-container .w-e-panel-container .w-e-up-img-container .w-e-up-btn {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            color: #999;
            cursor: pointer;
            font-size: 60px;
            line-height: 1;
        }

        .w-e-text-container .w-e-panel-container .w-e-up-img-container .w-e-up-btn:hover {
            color: #333;
        }

        .w-e-text-container {
            position: relative;
            background-color: #f1f1f1;
        }

        .w-e-text-container .w-e-progress {
            position: absolute;
            background-color: #1e88e5;
            bottom: 0;
            left: 0;
            height: 1px;
        }

        .w-e-text {
            padding: 0 10px;
            overflow-y: scroll;
            background-color: #f1f1f1;
        }

        .w-e-text p, .w-e-text h1, .w-e-text h2, .w-e-text h3, .w-e-text h4, .w-e-text h5, .w-e-text table, .w-e-text pre {
            margin: 10px 0;
            line-height: 1.5;
        }

        .w-e-text ul, .w-e-text ol {
            margin: 10px 0 10px 20px;
        }

        .w-e-text blockquote {
            display: block;
            border-left: 8px solid #d0e5f2;
            padding: 5px 10px;
            margin: 10px 0;
            line-height: 1.4;
            font-size: 100%;
            background-color: #f1f1f1;
        }

        .w-e-text code {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            background-color: #f1f1f1;
            border-radius: 3px;
            padding: 3px 5px;
            margin: 0 3px;
        }

        .w-e-text pre code {
            display: block;
        }

        .w-e-text table {
            border-top: 1px solid #ccc;
            border-left: 1px solid #ccc;
        }

        .w-e-text table td, .w-e-text table th {
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
            padding: 3px 5px;
        }

        .w-e-text table th {
            border-bottom: 2px solid #ccc;
            text-align: center;
        }

        .w-e-text:focus {
            outline: none;
        }

        .w-e-text img {
            cursor: pointer;
        }

        .w-e-text img:hover {
            box-shadow: 0 0 5px #333;
        }</style>
    <%--<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/wangEditor/common.css">--%>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/wangEditor/index.css">
    <link rel="shortcut icon" href="http://www.wangeditor.com/favicon.ico">
    <script type="text/javascript" src="${APP_PATH}/static/wangEditor/wangEditor.min.js"></script>
    <%--<script type="text/javascript" src="${APP_PATH}/static/wangEditor/index.js"></script>--%>

    <title>文章列表</title>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${APP_PATH}">BLOGMASTER</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> zdd</a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<%--搭建显示页面--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="${APP_PATH}/articlePage"><span class="glyphicon glyphicon-book"
                                                                           aria-hidden="true"></span> Article</a></li>
                <li><a href="${APP_PATH}/categoryPage"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
                    Category <span class="sr-only">(current)</span></a></li>
                <li><a href="${APP_PATH}/draftPage"><span class="glyphicon glyphicon-duplicate"
                                                          aria-hidden="true"></span> Draft</a></li>
                <li><a href="${APP_PATH}/recyclePage"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    Recycle</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%--4行--%>
            <%--标题--%>
            <h1 class="page-header">ARTICLE-EDIT</h1>
            <%--按钮--%>
            <form id="article_update_form">
                <div class="form-group">
                    <label for="title_update_input"><b>标题</b></label>
                    <input type="text" name="title" class="form-control" id="title_update_input" placeholder="title">
                    <span class="help-block"></span>
                </div>
                <div class="form-group">
                    <label for="author_update_input"><b>作者</b></label>
                    <input type="text" name="author" class="form-control" id="author_update_input" placeholder="author">
                    <span class="help-block"></span>
                </div>
                <%--<div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">Example block-level help text here.</p>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>--%>
                <%--富文本--%>
                <div class="form-group">
                    <label><b>内容</b></label>
                    <div style="text-align:left;" id="article_content_div_father">
                        <div id="divDemo">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="brief_update_text"><b>摘要</b></label>
                    <textarea class="form-control" name="brief" id="brief_update_text" placeholder="brief" rows="4"
                              cols="20"></textarea>
                </div>
                <div class="form-group">
                    <label><b>分类</b></label>
                    <%--部门提交部门id即可--%>
                    <select class="form-control" name="categoryId" id="category_update_select"
                            style="width: 200px;"></select>
                </div>
                <div class="form-group">
                    <label for="img_update_input"><b><a href="#"
                                                      onclick="return insertDescImg()">插入摘要右侧图片</a></b></label>
                    <input type="text" name="imgUrl" class="form-control" id="img_update_input" placeholder="img">
                    <span class="help-block"></span>
                </div>
                <button type="button" class="btn btn-primary" id="article_update_btn" style="DISPLAY:none">发布</button>
                <button type="button" class="btn btn-primary" id="article_recover_btn" style="DISPLAY:none">还原</button>
                <button type="button" class="btn btn-primary" id="article_updateDraft_btn" style="DISPLAY:none">更新草稿</button>
                <button type="button" class="btn btn-danger" id="edit_cancel_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/articlePage'" style="DISPLAY:none">取消</button>
                <button type="button" class="btn btn-danger" id="edit_draft_cancel_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/draftPage'" style="DISPLAY:none">取消</button>
                <button type="button" class="btn btn-danger" id="edit_recycle_cancel_btn" onclick="javascrtpt:window.location.href='${APP_PATH}/recyclePage'" style="DISPLAY:none">取消</button>

            </form>
        </div>
    </div>
</div>

<script type="text/javascript">

    var curPageviewNum, curFavorNum, curPostTime;

    //1、页面加载完成以后，获取文章信息
    $(function () {
        //获取类别
        getCategories("#category_update_select");
        //根据id获取文章
        getArticleById(${editId});
    })

    //获取类别
    //查出所有的类别信息并显示在下拉列表中
    function getCategories(ele) {
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/articleAddOrEditCategories",
            type: "GET",
            success: function (result) {
                //console.log(result)
                //显示文章信息在下拉列表中
                $.each(result.extend.categories, function () {
                    if (this.id != 2 && this.id != 3) {     //2草稿、3回收站
                        var optionEle = $("<option></option>").append(this.categoryName).attr("value", this.id);
                        optionEle.appendTo(ele)
                    }else {
                        var optionEle = $("<option></option>").append(this.categoryName).attr("value", this.id);
                        optionEle.appendTo(ele).hide();
                    }
                });
            }
        });
    }

    //根据id获取文章并动态创建富文本编辑框
    function getArticleById(id) {
        var E = window.wangEditor
        var editor = new E('#divDemo')
        editor.customConfig.uploadImgShowBase64 = true
        $.ajax({
            url: "${APP_PATH}/article/" + id,
            type: "GET",
            success: function (result) {
                //console.log(result)
                var articleData = result.extend.article;

                $("#title_update_input").val(articleData.title);
                $("#author_update_input").val(articleData.author);
                $("#brief_update_text").val(articleData.brief);
                editor.create()
                editor.txt.clear()
                editor.txt.html(articleData.content)
                if (articleData.categoryId == 2) {
                    $("#category_update_select").val(1);
                    $("#article_update_btn").show();
                    $("#article_updateDraft_btn").show();
                    $("#edit_draft_cancel_btn").show();
                }else if(articleData.categoryId == 3){
                    $("#category_update_select").val(1);
                    $("#article_recover_btn").show();
                    $("#edit_recycle_cancel_btn").show();
                }else {
                    $("#category_update_select").val(articleData.categoryId);
                    $("#article_update_btn").show();
                    $("#edit_cancel_btn").show();
                }
                $("#img_update_input").val(articleData.imgUrl);

                curPageviewNum = articleData.pageviewNum;
                curFavorNum = articleData.favorNum;
                curPostTime = articleData.postTime;
            }
        })
    }

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        //清除当前元素校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //校验文章标题是否填写
    $("#title_update_input").change(function () {
        var title = this.value;
        if (title == "") {
            show_validate_msg("#title_update_input", "error", "请输入标题");
            $("#article_update_btn").attr("ajax-va", "error");
            return false;
        }
        else {
            show_validate_msg("#title_update_input", "success", "");
            $("#category_save_btn").attr("ajax-va", "success");
        }
    });

    //点击提交，保存文章
    updateArticle = function (){
        //1、拿到要校验的数据，正则表达式
        if ($("#title_update_input").val() == "") {
            show_validate_msg("#title_update_input", "error", "请输入标题");
            return false;
        }
        //判断之前的ajax文章标题校验是否成功，如果成功
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }

        if (new Date(curPostTime).getTime() == new Date(0).getTime())
        {
            curPostTime = new Date();
        }
        //2、发送ajax请求保存文章
        $.ajax({
            url: "${APP_PATH}/article/" +${editId},
            type: "PUT",
            data: $("#article_update_form").serialize()
                + '&' + $.param({
                    content: $("#divDemo .w-e-text").html(),
                    postTime: new Date(curPostTime),
                    pageviewNum: curPageviewNum,
                    favorNum: curFavorNum
                }),

            success: function (result) {
                //alert(result.msg);
                //文章保存成功：
                //1、关闭模态框
                alert("修改成功");
                $(window).unbind('beforeunload');
                //2、来到最后一页，显示刚才保存的数据
                //发送ajax请求显示最后一页数据即可
                //总记录数当成页码
                window.location.href = "${APP_PATH}/articlePage"
            }
        })
    }
    $("#article_update_btn").click(updateArticle);
    $("#article_recover_btn").click(updateArticle);

    //更新草稿
    $("#article_updateDraft_btn").click(function () {
        //1、拿到要校验的数据，正则表达式
        if ($("#title_update_input").val() == "") {
            $("#title_update_input").focus();
            show_validate_msg("#title_add_input", "error", "请输入标题");
            return false;
        }
        //判断之前的ajax文章标题校验是否成功，如果成功
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        $("#category_update_select").val(2);   //类别设置为草稿，其实可以用isDraft的tag来设置为草稿。。
        //2、发送ajax请求保存文章
        $.ajax({
            url: "${APP_PATH}/article/" +${editId},
            type: "PUT",
            data: $("#article_update_form").serialize()
                + '&' + $.param({
                    content: $("#divDemo .w-e-text").html(),
                    postTime: new Date(0),
                    pageviewNum: curPageviewNum,
                    favorNum: curFavorNum
                }),

            success: function (result) {
                //alert(result.msg);
                if (result.code == 100) {
                    //文章保存成功：
                    //1、关闭模态框
                    alert("保存草稿成功");
                    //解绑
                    $(window).unbind('beforeunload');
                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    //总记录数当成页码
                    window.location.href = "${APP_PATH}/draftPage"
                } else {
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的
                    if (undefined != result.extend.errorFields.title) {
                        //显示文章名字的错误信息
                        show_validate_msg("#title_add_input", "error", result.extend.errorFields.title);
                    }
                }
            }
        })
    })


    //添加图片url
    function insertDescImg() {
        var imgSrc = prompt('请输入图片网址', 'http://');
        if (!imgSrc) {
            return false;
        }
        var strImg = "<img src=\"" + imgSrc + "\" class=\"desc_img\"/>";
        document.getElementById("img_update_input").value = strImg + document.getElementById("img_update_input").value;
        document.getElementById("img_update_input").focus();
        return false;
    }

    $(window).bind('beforeunload',function(){return '您输入的内容尚未保存，确定离开此页面吗？';});

    /*获取到Url里面的参数*/
    /*    (function ($) {
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
        })(jQuery);*/
</script>

</body>
</html>
