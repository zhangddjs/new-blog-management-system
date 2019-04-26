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
    <title>评论管理</title>
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
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" id="search_input" placeholder="Search">
                </div>
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-search"
                                                                    aria-hidden="true"></span> 搜索
                </button>
            </form>
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
                <li><a href="${APP_PATH}/articlePage"><span class="glyphicon glyphicon-book"
                                                                           aria-hidden="true"></span> Article</a></li>
                <li><a href="${APP_PATH}/categoryPage"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
                    Category <span class="sr-only">(current)</span></a></li>
                <li><a href="${APP_PATH}/draftPage"><span class="glyphicon glyphicon-duplicate"
                                                          aria-hidden="true"></span> Draft</a></li>
                <li><a href="${APP_PATH}/recyclePage"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    Recycle</a></li>
                <li class="active"><a href="${APP_PATH}/commentPage"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
                    COMMENT</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%--4行--%>
            <%--标题--%>
            <h1 class="page-header">COMMENT</h1>
            <%--按钮--%>
            <div class="row">
                <div class="col-md-4 col-md-offset-7">
                    <button class="btn btn-danger" id="comment_delete_all_btn"><span class="glyphicon glyphicon-trash"
                                                                                     aria-hidden="true"></span> 批量删除
                    </button>
                </div>

            </div>
            <%--显示表格--%>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="comments_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>id</th>
                            <th>title</th>
                            <th>user</th>
                            <%--<th>content</th>--%>
                            <%--<th>favor_num</th>--%>
                            <%--<th>pageview_num</th>--%>
                            <%--<th>post_time</th>--%>
                            <%--<th>category_id</th>--%>
                            <th>post_time</th>
                            <th>content</th>
                            <%--<th>img_url</th>--%>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <%--显示分页信息--%>
            <div class="row">
                <%--分页文字信息--%>
                <div class="col-md-6" id="page_info_area"></div>
                <%--分页条--%>
                <div class="col-md-6" id="page_nav_area"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var totalRecord, currentPage;

    //1、页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        //去首页
        to_page(1);
        //console.log($.myTime.DateToUnix('2014-5-15 20:20:20'));
        //console.log($.myTime.UnixToDate(1325347200));
    })

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/comments",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                //console.log(result);
                //1、解析并显示类别数据
                build_comments_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result)
            }
        })

    }

    //构建表格
    function build_comments_table(result) {
        //清空table表格
        $("#comments_table tbody").empty();

        var comments = result.extend.pageInfo.list;
        $.each(comments, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item' /></td>");
            var commentIdTd = $("<td></td>").append(item.id);
            var titleTd = $("<td></td>").append("Re:" + item.article.title);    //item.article.title
            var authorTd = $("<td></td>").append(item.visitorName);
            var postTimeTd = $("<td></td>").append(getMyDate(item.postTime));
            var contentTd = $("<td></td>").append(item.content);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(commentIdTd)
                .append(titleTd)
                .append(authorTd)
                // .append(contentTd)
                // .append(favorNumTd)
                // .append(pageviewNumTd)
                // .append(postTimeTd)
                // .append(categoryIdTd)
                .append(postTimeTd)
                .append(contentTd)
                // .append(imgUrlTd)
                .append(btnTd)
                .appendTo("#comments_table tbody");     //添加单元格
        })
    }

    //分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    //分页条
    function build_page_nav(result) {
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }

        //添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2..3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        })
        //添加下一页和末页的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    /**
     * 改
     */
    //1、我们是按钮创建之前就绑定了click，所以绑不上，（按钮是查询表之后生成的）
    //1）、可以在创建按钮的时候绑定。 2）绑定点击.live()
    //jquery新版本使用on()
    $(document).on("click", ".edit_btn", function () {
        window.location.href = "${APP_PATH}/articleEditPage/" + $(this).attr("edit-id");
    })

    /**
     * 删
     */
    //单个删除
    $(document).on("click", ".delete_btn", function () {
        //1、弹出是否确认对话框
        var title = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("del-id");
        if (confirm("确认删除【" + title + "】吗？")) {
            //确认，发送ajax请求删除即可
            $.ajax({
                url: "${APP_PATH}/comment/" + id,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    })


    //全选/全不选功能
    $("#check_all").click(function () {
        //attr获取checked是undefined
        //我们这些dom原生的属性，attr获取自定义属性的值
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked", $(this).prop("checked"));   //同步
    })
    //check_item
    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //点击全部删除，就批量删除
    $("#comment_delete_all_btn").click(function () {

        var titles = "";
        var del_idstr = "";
        $.each($(".check_item:checked"), function () {
            //this
            titles += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装类别id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除titles多余,
        titles = titles.substring(0, titles.length - 1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("确认删除【" + titles + "】吗？")) {
            //发送ajax请求
            $.ajax({
                url: "${APP_PATH}/comment/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到当前页面
                    to_page(currentPage);
                }
            })
        }
    });

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
