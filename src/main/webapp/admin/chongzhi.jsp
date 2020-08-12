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
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <% String APP_PATH = request.getContextPath(); %>
    <![endif]--></head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form" id="chongzhiForm" onsubmit="return false">

            <input value="${member.mid}" name="mid" type="text">


            <div class="layui-form-item">
                <label class="layui-form-label">
                    <div>会员名：${member.membername}</div>
                    <div>账户金额：${member.money}</div>
                </label>


            </div>


            <div class="layui-form-item">
                <label for="money" class="layui-form-label">
                    <span class="x-red">*</span>充值金额</label>
                <div class="layui-input-inline">
                    <input type="text" value="0" id="money" name="money" required="" lay-verify="required"
                           autocomplete="off" class="layui-input"></div>
            </div>


            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="save" onclick="chongzhi()">充值</button>
            </div>
        </form>
    </div>
</div>
<script>


    function chongzhi() {
        var d = $("#chongzhiForm").serialize();
        console.log(d)
        var money = $("#money").val();

        console.log(money)

        if (isNaN(money)) {
            alert("金钱不对，请重新输入");
            return
        }

        $.ajax({
            url: "<%=APP_PATH%>/member/chongzhi",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == "200") {

                    layer.msg('充值成功!', {icon: 5, time: 1000});
                } else {
                    // alert(obj.msg);
                    layer.msg('充值失败!', {icon: 1, time: 1000});
                }
            }
        })
    }


</script>

</body>

</html>