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
                <label class="layui-form-label">
                    <span style="color: red;">*</span>选择你要生成的乐器</label>
                <div class="layui-inline layui-show-xs-block">
                    <select id="select_yq">
                        <option name="yqname" selected="selected" value="NOSELECT">请先择</option>

                        <c:forEach var="yq" items="${yqlist}">
                            <option name="yqname" value="${yq.yqname}">${yq.yqname}</option>
                        </c:forEach>

                    </select>
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" onclick="add()">生成防伪码</button>
            </div>


        </form>


    </div>
</div>
<script>
    function add() {

       var s =  $("#select_yq").find("option:selected").val();

        var d = {
            yqname:s
        }

        console.log(d);

        //生成
        $.ajax({
            url: "<%=APP_PATH%>/fwcx/scfw",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {

                    alert("添加成功");
                } else {
                    // alert(obj.msg);
                    alert("添加失败");
                }
            }
        })

    }
</script>

</body>

</html>