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
            <input id="oid" type="hidden" value="${oid}" name="oid">
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span style="color: red;">*</span>快递：</label>
                <div class="layui-input-inline">
                    <select id="select_kdname">
                        <option name="kdname" value="中通快递" selected="selected">中通快递</option>
                        <option name="kdname" value="韵达快递">韵达快递</option>
                        <option name="kdname" value="顺丰快递">顺丰快递</option>
                        <option name="kdname" value="EMS">EMS</option>
                        <option name="kdname" value="百世快递">百世快递</option>
                        <option name="kdname" value="圆通快递">圆通快递</option>
                        <option name="kdname" value="其他">其他</option>
                    </select>
                </div>

            </div>

            <div class="layui-form-item">
                <label for="kdnum" class="layui-form-label">
                    <span style="color: red;">*</span>快递号：</label>
                <div class="layui-input-inline">
                    <input type="text" id="kdnum" name="kdnum" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" onclick="fh()">发货</button>
            </div>


        </form>


    </div>
</div>
<script>
    //发货
    function fh() {
        var oid = $("#oid").val();
        var kdnum = $("#kdnum").val();
        var kdname = $("#select_kdname option[name='kdname']:selected").val();


        if (kdname == "" || kdnum=="") {
            alert("不能为空");
            return
        }

        var d = {
            oid:oid,
            kdnum:kdnum,
            kdname:kdname
        }




        $.ajax({
            url: "<%=APP_PATH%>/order/fahuo",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {

                    alert("发货成功");
                } else {
                    // alert(obj.msg);
                    alert("发货失败,请检查订单状态");
                }
            }
        })

    }
</script>

</body>

</html>