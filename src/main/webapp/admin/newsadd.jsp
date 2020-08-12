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
                <label for="newstitle" class="layui-form-label">
                    <span style="color: red;">*</span>标题:</label>
                <div class="layui-input-inline">
                    <input type="text" id="newstitle" name="newstitle" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">

                    内容请编辑页添加

            </div>

        </form>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <button class="layui-btn" lay-filter="add" onclick="add()">增加</button>
        </div>


    </div>
</div>
<script>
    function add() {
        var d = $("#addForm").serialize();
        var newstitle = $("#newstitle").val();

        if (newstitle == "") {
            layer.msg("请输入标题", {icon: 2, time: 1000});
            return
        }


        $.ajax({
            url: "<%=APP_PATH%>/news/add",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    layer.msg(r.msg, {icon: 1, time: 1000});
                    //alert("添加乐器成功");
                } else {
                    layer.msg(r.msg, {icon: 2, time: 1000});
                    //alert("添加乐器失败");
                }
            }
        })

    }


</script>

</body>

</html>