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
    <link href="${APP_PATH}/static/css/dashboard.css" rel="stylesheet">
    <title>类别列表</title>
</head>
<body>
<%--Modal类别修改--%>
<div class="modal fade" id="categoryUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">类别修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="categoryName_update_input" class="col-sm-2 control-label">categoryName</label>
                        <div class="col-sm-10">
                            <input type="text" name="categoryName" class="form-control" id="categoryName_update_input"
                                   placeholder="categoryName">
                            <span class="help-block"></span>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="category_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>



<%--Modal类别添加--%>
<div class="modal fade" id="categoryAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">类别添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="categoryName_add_input" class="col-sm-2 control-label">categoryName</label>
                        <div class="col-sm-10">
                            <input type="text" name="categoryName" class="form-control" id="categoryName_add_input"
                                   placeholder="categoryName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="category_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"  aria-hidden="true"></span> zdd</a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout</a></li>
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
                <li><a href="${APP_PATH}/articlePage"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> Article</a></li>
                <li class="active"><a href="${APP_PATH}/categoryPage"><span class="glyphicon glyphicon-tags" aria-hidden="true"></span> Category <span class="sr-only">(current)</span></a></li>
                <li><a href="${APP_PATH}/draftPage"><span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span> Draft</a></li>
                <li><a href="${APP_PATH}/recyclePage"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Recycle</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%--4行--%>
            <%--标题--%>
            <h1 class="page-header">CATEGORY</h1>
            <%--按钮--%>
            <div class="row">
                <div class="col-md-4 col-md-offset-7">
                    <button class="btn btn-primary" id="category_add_modal_btn"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增</button>
                    <button class="btn btn-danger" id="category_delete_all_btn"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 批量删除</button>
                </div>
            </div>
            <%--显示表格--%>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover" id="categories_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>id</th>
                            <th>categoryName</th>
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
    })

    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/categories",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                //console.log(result);
                //1、解析并显示类别数据
                build_categories_table(result);
                //2、解析并显示分页信息
                build_page_info(result)
                //3、解析显示分页条数据
                build_page_nav(result)
            }
        })
    }


    //构建表格
    function build_categories_table(result) {
        //清空table表格
        $("#categories_table tbody").empty();

        var categories = result.extend.pageInfo.list;
        $.each(categories, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item' /></td>");
            var categoryIdTd = $("<td></td>").append(item.id);
            var categoryNameTd = $("<td></td>").append(item.categoryName);
            /*  <button class="btn btn-primary btn-sm">
                  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
              编辑
              </button>*/
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //创建编辑按钮时为编辑按添加一个自定义属性，来表示当前类别id
            editBtn.attr("edit-id",item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id",item.id);
            //默认分类不能改
            if (item.id == 1 || item.id == 2 || item.id == 3) {
                editBtn.attr("disabled",true);
                delBtn.attr("disabled",true);
            }
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(categoryIdTd)
                .append(categoryNameTd)
                .append(btnTd)
                .appendTo("#categories_table tbody");     //添加单元格
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

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }


    /**
     * 添
     */
    //点击新增按钮弹出模态框
    $("#category_add_modal_btn").click(function () {
        //清除表单数据（表单完整重置：表单的数据，表单的样式）
        reset_form("#categoryAddModal form");
        //弹出模态框
        $("#categoryAddModal").modal({
            backdrop: "static"
        });
    });

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

    //校验类别名是否可用
    $("#categoryName_add_input").change(function () {

        //发送ajax请求校验类别名是否可用
        var categoryName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkCategory",
            data: "categoryName="+categoryName,
            type: "POST",
            success: function (result) {
                if (result.code==100){
                    show_validate_msg("#categoryName_add_input", "success", "类别可用");
                    $("#category_save_btn").attr("ajax-va","success");
                }else {
                    show_validate_msg("#categoryName_add_input", "error", result.extend.va_msg);
                    $("#category_save_btn").attr("ajax-va","error");
                }
            }
        })
    });

    //点击保存，保存类别
    $("#category_save_btn").click(function () {
        //1、拿到要校验的数据，正则表达式
        if ($("#categoryName_add_input").val() == "") {
            show_validate_msg("#categoryName_add_input", "error", "请输入类别");
            return false;
        }
        //判断之前的ajax用户名校验是否成功，如果成功
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        //2、发送ajax请求保存类别
        $.ajax({
            url: "${APP_PATH}/category",
            type: "POST",
            data: $("#categoryAddModal form").serialize(),
            success: function (result) {
                //alert(result.msg);
                if (result.code == 100) {
                    //类别保存成功：
                    //1、关闭模态框
                    $("#categoryAddModal").modal('hide');
                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    //总记录数当成页码
                    to_page(totalRecord);
                }else{
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的
                    if(undefined != result.extend.errorFields.categoryName){
                        //显示类别名字的错误信息
                        show_validate_msg("#categoryName_add_input", "error", result.extend.errorFields.categoryName);
                    }
                }
            }
        })
    })

    /**
     * 改
     */
    //1、我们是按钮创建之前就绑定了click，所以绑不上，（按钮是查询表之后生成的）
    //1）、可以在创建按钮的时候绑定。 2）绑定点击.live()
    //jquery新版本使用on()
    $(document).on("click",".edit_btn",function () {
        //清除表单数据（表单完整重置：表单的数据，表单的样式）
        reset_form("#categoryUpdateModal form");
        //2、查出类别信息，显示类别信息
        getCategory($(this).attr("edit-id"));
        //3、把类别id传递给模态框的更新按钮
        $("#category_update_btn").attr("edit-id",$(this).attr("edit-id"));

        $("#categoryUpdateModal").modal({
            backdrop: "static"
        });
    })

    function getCategory(id) {
        $.ajax({
            url:"${APP_PATH}/category/"+id,
            type:"GET",
            success:function (result) {
                //console.log(result)
                var categoryData = result.extend.category;
                $("#categoryName_update_input").val(categoryData.categoryName);
            }
        })
    }

    //点击更新，更新类别信息
    $("#category_update_btn").click(function () {
        //校验
        //1、拿到要校验的数据，正则表达式
        if ($("#categoryName_update_input").val() == "") {
            show_validate_msg("#categoryName_update_input", "error", "请输入类别");
            return false;
        }
        //判断之前的ajax用户名校验是否成功，如果成功
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        //发送ajax请求，保存更新的类别数据
        $.ajax({
            url:"${APP_PATH}/category/"+$(this).attr("edit-id"),
            /*type:"POST",
            data:$("#categoryUpdateModal form").serialize()+"&_method=PUT",*/
            type:"PUT",
            data:$("#categoryUpdateModal form").serialize(),
            success:function (result) {
                //alert(result.msg);
                //1、关闭对话框
                $("#categoryUpdateModal").modal("hide");
                //2、回到本页面
                to_page(currentPage);
            }
        })
        return true;
    })

    /**
     * 删
     */
    //单个删除
    $(document).on("click",".delete_btn",function (){
        //1、弹出是否确认对话框
        var categoryName = $(this).parents("tr").find("td:eq(2)").text();
        var id = $(this).attr("del-id");
        if(confirm("确认删除【"+categoryName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_PATH}/category/"+id,
                type:"DELETE",
                success:function (result) {
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
        $(".check_item").prop("checked",$(this).prop("checked"));   //同步
    })
    //check_item
    $(document).on("click",".check_item",function (){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //点击全部删除，就批量删除
    $("#category_delete_all_btn").click(function () {

        var categoryNames="";
        var del_idstr = "";
        $.each($(".check_item:checked"),function () {
            //this
            categoryNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组装类别id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除categoryNames多余,
        categoryNames = categoryNames.substring(0, categoryNames.length-1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if (confirm("确认删除【"+categoryNames+"】吗？")) {
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/category/"+del_idstr,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    //回到当前页面
                    to_page(currentPage);
                }
            })
        }
    });

</script>

</body>
</html>
