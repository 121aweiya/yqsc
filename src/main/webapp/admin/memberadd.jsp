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
    <c:import url="/header.jsp"/>
    <% String APP_PATH = request.getContextPath(); %>
    <![endif]-->
</head>
<body>


<div class="layui-fluid">
    <div class="layui-row">
        <form id="addForm" onsubmit="return false">
            <div class="layui-form-item">
                <label for="membername" class="layui-form-label">
                    <span style="color: red;">*</span>会员名</label>
                <div class="layui-input-inline">
                    <input type="membername" id="membername" name="membername" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">

                <label for="password" class="layui-form-label">
                    <span style="color: red;">*</span> 密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">

                <label for="paypassword" class="layui-form-label">
                    <span style="color: red;">*</span> 支付密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="paypassword" name="paypassword" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label for="nickname" class="layui-form-label">
                    昵称</label>
                <div class="layui-input-inline">
                    <input type="text" id="nickname" name="nickname" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label for="email" class="layui-form-label">
                    邮箱</label>
                <div class="layui-input-inline">
                    <input type="email" id="email" name="email" lay-verify="repass"
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
                <label for="mobile" class="layui-form-label">
                    手机</label>
                <div class="layui-input-inline">
                    <input type="text" id="mobile" name="mobile" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label for="money" class="layui-form-label">
                    账户金额(元)</label>
                <div class="layui-input-inline">
                    <input type="text" value="0" id="money" name="money" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" onclick="addMember()">增加</button>
            </div>


        </form>


    </div>
</div>
<script>
    function addMember() {
        var d = $("#addForm").serialize();
        var membername = $("#membername").val();
        var password = $("#password").val();
        var paypassword = $("#paypassword").val();
        var money = $("#money").val();
        // console.log(d)
        // console.log(membername)
        // console.log(password)
        // console.log(paypassword)


        if (membername == "" || password == "" || paypassword == "") {
            alert("带*号必填")
            return
        }

        if (isNaN(money)) {
            alert("金币非法")
            return
        }

        $.ajax({
            url: "<%=APP_PATH%>/member/insertMember",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    // alert(obj.msg);
                    // location.href = "<%=APP_PATH%>/admin/index";

                    alert("添加会员成功");
                } else {
                    // alert(obj.msg);
                    alert("添加会员失败");
                }
            }
        })

    }
</script>

</body>

</html>