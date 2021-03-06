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
            <input type="hidden" value="${cat.id}" name="id">
            <div class="layui-form-item">
                <label for="categoryname" class="layui-form-label">
                    <span style="color: red;">*</span>类别名称</label>
                <div class="layui-input-inline">
                    <input type="text" value="${cat.categoryname}" id="categoryname" name="categoryname" required=""
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">

                <label for="description" class="layui-form-label">
                    描述</label>
                <div class="layui-input-inline">
                    <input type="text" value="${cat.description}" id="description" name="description"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" onclick="upadate()">修改</button>
            </div>


        </form>


    </div>
</div>
<script>
    function upadate() {
        var d = $("#addForm").serialize();
        var categoryName = $("#categoryname").val();


        if (categoryName == "") {
            alert("类别名不能为空")
            return
        }


        $.ajax({
            url: "<%=APP_PATH%>/category/updateCat",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {

                    alert("修改类别成功");
                } else {
                    // alert(obj.msg);
                    alert("修改类别失败");
                }
            }
        })

    }
</script>

</body>

</html>