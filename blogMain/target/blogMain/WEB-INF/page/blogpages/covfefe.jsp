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
                <p>网名：Covfefe | 海飞丝实力派<br>职业：程序猿<br>籍贯：江苏省—无锡市<br>电话：183****9653<br>邮箱：<a href="#">zdd1995<em>@mail.ustc.edu.cn</em></a></p>
                <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
                    fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
            </div>
            <div class="sidebar-module">
                <div class="form-group">
                    <input type="text" class="form-control" id="search_input" placeholder="Search">
                </div>
                <button type="button" class="btn btn-default" id="search_button"><span
                        class="glyphicon glyphicon-search"
                        aria-hidden="true"></span> 搜索
                </button>
            </div>
            <div class="sidebar-module">
                <h4>Categories</h4>
                <ol class="list-unstyled" id="category_ol">
                    <%--<li><a href="#">March 2014</a></li>
                    <li><a href="#">February 2014</a></li>
                    <li><a href="#">January 2014</a></li>
                    <li><a href="#">December 2013</a></li>
                    <li><a href="#">November 2013</a></li>
                    <li><a href="#">October 2013</a></li>
                    <li><a href="#">September 2013</a></li>
                    <li><a href="#">August 2013</a></li>
                    <li><a href="#">July 2013</a></li>
                    <li><a href="#">June 2013</a></li>
                    <li><a href="#">May 2013</a></li>
                    <li><a href="#">April 2013</a></li>--%>
                </ol>
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
    <%--分页--%>
    <div class="row">
        <%--分页文字信息--%>
        <%--<div class="col-md-6" id="page_info_area"></div>--%>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
    <nav>
        <ul class="pager">
            <li><a href="#"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span> Back to top</a></li>
        </ul>
    </nav>
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

    var totalRecord, currentPage, currentCategoryId = 0;
    var search_keyword = "";

    //1、页面加载完成以后，直接去发送一个ajax请求，要到分页数据
    $(function () {
        //获取类别
        getCategories("#category_ol");
        to_page(1);
        //console.log($.myTime.DateToUnix('2014-5-15 20:20:20'));
        //console.log($.myTime.UnixToDate(1325347200));
    })

    function to_page(pn) {
        var categoryId = currentCategoryId;
        var ajaxurl = "";
        var encoded_search_keyword = encodeURI(encodeURI(search_keyword));
        if (encoded_search_keyword == "") {
            if (categoryId == 0) {
                ajaxurl = "${APP_PATH}/articles";
            } else {
                ajaxurl = "${APP_PATH}/articlesByCategory/" + categoryId;
            }
        } else {
            if (categoryId == 0) {
                ajaxurl = "${APP_PATH}/searchedArticles/" + search_keyword;
            } else {
                ajaxurl = "${APP_PATH}/searchedArticlesByCategory/" + search_keyword + "/" + categoryId;
            }
        }
        $.ajax({
            url: ajaxurl,
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                //console.log(result);
                //1、解析并显示类别数据
                build_articles_div(result);
                //2、解析并显示分页信息
                build_page_info(result)
                //3、解析显示分页条数据
                build_page_nav(result)
            }
        })
    }

    //获取类别
    //查出所有的类别信息并显示在下拉列表中
    function getCategories(ele) {
        $(ele).empty();
        var originEle = $("<a href='#' onclick='byCategory(0)'></a>").append("---所有分类---"); //初始分类
        $("<li></li>").append(originEle).appendTo(ele);
        $.ajax({
            url: "${APP_PATH}/articleAddOrEditCategories",
            type: "GET",
            success: function (result) {
                //console.log(result)
                //显示文章信息在下拉列表中
                $.each(result.extend.categories, function () {
                    if (this.id != 2 && this.id != 3) {
                        var optionEle = $("<a href='#' onclick='byCategory(" + this.id + ")'></a>").append(this.categoryName);
                        $("<li></li>").append(optionEle).appendTo(ele)
                    }
                });
            }
        });
    }

    //按分类查询
    var byCategory = function (value) {
        currentCategoryId = value;
        to_page(1);
    };

    //搜索按钮事件
    $("#search_button").click(function () {
        search_keyword = $("#search_input").val();
        to_page(1);
    })

    //构建表格
    function build_articles_div(result) {
        //清空table表格
        $("#blog_post_divs").html("");

        var articles = result.extend.pageInfo.list;
        $.each(articles, function (index, item) {
            /*此部分应该由后台实现
            if (item.categoryId == 2 || item.categoryId == 3) {       //是否是草稿或回收站
                return;//实现continue功能
            }*/
            var titleChild = $("<h2 class='blog-post-title'></h2>").append("<a href='content/" + item.id + "'>" + item.title + "</a>");
            var postTimeVal = getMyDate(item.postTime);
            var postTimeValFormat = $.formatDate("hh:mm ee dd,yyyy", postTimeVal);
            var postTimeChild = $("<p class='blog-post-meta'></p>").append(postTimeValFormat + " by ");
            var authorChild = $("<a href=\"#\"></a>").append(item.author);
            var favorNumChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; favor: " + item.favorNum);
            var pageviewNumChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; view: " + item.pageviewNum);
            var categoryNameChild = $("<span></span>").append("&nbsp;&nbsp;&nbsp; category: " + item.category.categoryName);
            var infoChild = postTimeChild.append(authorChild).append(favorNumChild).append(pageviewNumChild).append(categoryNameChild);
            var imgUrlChild = $("<figure></figure>").append(item.imgUrl);
            var briefContent = $("<p></p>").append("<b>brief：</b>" + item.brief).append("<a href='content/" + item.id + "'>&nbsp;&nbsp;more</a>");
            var briefChild;
            if (item.imgUrl == "") {
                briefChild = briefContent;
            } else {
                briefChild = $("<ul></ul>").append(briefContent);
            }
            $("<div class='row blog-post covfefe'></div>").append(titleChild)
                .append(infoChild)
                .append(imgUrlChild)
                .append(briefChild)
                // .append(imgUrlChild)
                .appendTo("#blog_post_divs");     //添加单元格
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
            firstPageLi.addClass("disabled").hide();
            prePageLi.addClass("disabled").hide();
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
            nextPageLi.addClass("disabled").hide();
            lastPageLi.addClass("disabled").hide();
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
     * 添
     */
    //点击新增按钮转到添加页
    $("#article_add_btn").click(function () {
        window.location.href = "${APP_PATH}/articleAddPage"
    });


    /**
     * 改
     */
    //1、我们是按钮创建之前就绑定了click，所以绑不上，（按钮是查询表之后生成的）
    //1）、可以在创建按钮的时候绑定。 2）绑定点击.live()
    //jquery新版本使用on()
    $(document).on("click", ".edit_btn", function () {
        window.location.href = "${APP_PATH}/articleEditPage/" + $(this).attr("edit-id");
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
