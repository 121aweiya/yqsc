<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../admin/css/font.css">
    <link rel="stylesheet" href="../admin/css/xadmin.css">
    <script type="text/javascript" src="../admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <% String APP_PATH = request.getContextPath(); %>
    <![endif]-->
</head>
<body>


<div class="layui-fluid">
    <div class="layui-row">
        <form id="addForm" onsubmit="return false">
            <input name="aid" value="${updateUser.aid}" type="hidden" />
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    用户名</label>
                <div class="layui-input-inline">
                    <input type="username" id="username" name="username" required="" lay-verify="repass" value="${updateUser.username}"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <label for="name" class="layui-form-label">
                    姓名</label>
                <div class="layui-input-inline">
                    <input type="name" id="name" name="name" required="" lay-verify="repass" value="${updateUser.name}"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label for="email" class="layui-form-label">
                    邮箱</label>
                <div class="layui-input-inline">
                    <input type="email" id="email" name="email" required="" lay-verify="repass" value="${updateUser.email}"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">
                    性别</label>

                <div>
                    <input type="radio" name="sex" value="0" checked="checked">男
                    <input type="radio" name="sex" value="1">女

                </div>


            </div>

            <div class="layui-form-item">
                <label for="age" class="layui-form-label">
                    年龄</label>
                <div class="layui-input-inline">
                    <input type="age" id="age" name="age" required="" lay-verify="repass" value="${updateUser.age}"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label for="tel" class="layui-form-label">
                    电话</label>
                <div class="layui-input-inline">
                    <input type="tel" id="tel" name="tel" required="" lay-verify="repass" value="${updateUser.tel}"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" onclick="updteAdmin()">修改</button>
            </div>


        </form>


    </div>
</div>
<script>
    function updteAdmin() {
        var d = $("#addForm").serialize();
        var uname = $("#username").val();
        var password = $("#password").val();
        console.log(d)
        console.log(uname)
        console.log(password)

        if (uname == "" || password == "") return

        $.ajax({
            url: "<%=APP_PATH%>/admin/updateAdmin",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    // alert(obj.msg);
                    // location.href = "<%=APP_PATH%>/admin/index";

                    alert("成功")
                } else {
                    // alert(obj.msg);
                    alert("失败")
                }
            }
        })

    }
</script>

</body>

</html>