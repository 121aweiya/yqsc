<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>购买-1</title>
    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css"/>
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="../css/page-learing-sign.css"/>
    <% String APP_PATH = request.getContextPath(); %>
</head>

<body>
<!-- 页面 -->
<div class="register">
    <!--<img src="../../assets/img/logoico.png" alt="logo" width="200">-->
    <a href="<%=APP_PATH%>/pages/list" class="backIndex">返回首页</a>

    <div class="regItem show">
        <div class="phoneBox">
            购买名称:<p style="color: red">${payYueqi.yqname}</p>
            当前库存:<p style="color: red">${payYueqi.stock}</p>
            单价:<p style="color: red">${payYueqi.newprice}元</p>
        </div>
        <form id="payform">
            <input name="yid" value="${payYueqi.id}" type="hidden">
            <div class="phoneBox">
                <p>收件人:</p>
                <p>
                    <input id="recvname" type="text" name="recvname" class="textInput">
                    <br>

                </p>
            </div>

            <div class="phoneBox">
                <p>电话：</p>
                <p>
                    <input id="phone" type="text" name="phone" class="textInput">
                    <br>
                </p>
            </div>

            <div class="phoneBox">
                <p>购买数量：</p>
                <p>
                    <input id="buynum" value="1" type="text" name="buynum" onblur="checkNum()"
                           class="textInput">
                    <br>
                </p>
            </div>

            <div class="phoneBox">
                <p>详细地址：</p>
                <p>

                    <input id="addr" type="text" name="addr" class="textInput">
                    <br>
                </p>
            </div>

            <div class="phoneBox">
                <p>备注：</p>
                <p>
                    <input id="remark" type="text" name="remark" class="textInput">
                    <br>
                </p>
            </div>

            <div class="phoneBox">
                <p>支付方式：<label><input name="payfs" type="radio" value="0" checked="checked"/>余额</label>
                    <label><input name="payfs" type="radio" value="1"/>支付宝</label>
                    <label><input name="payfs" type="radio" value="2"/>微信</label></p>

            </div>
        </form>

        <div>
            <span style="color: red" id="sp_txMsg"></span><br>
            数量：<span id="sp_payNum" style="color: red" id="数量">1</span>
            共：<span id="sp_totalMoney" style="color: red" id="总价">${payYueqi.newprice}</span>元

        </div>

        <div class="btn btn-sm btn-info" onclick="Pay1()">购买</div>
        <div class="btn btn-sm btn-info" onclick="goback()">返回</div>
    </div>
</div>
<!--底部版权-->
<footer>
    <div class="container">
        <div class="row">
            <div align="center">
                <div>
                    <h1 style="display: inline-block">乐器商城系统</h1>
                    <!-- <img src="../img/asset-logoIco.png" alt=""></div> -->


                </div>

            </div>
        </div>
</footer>
</div>
<!-- 页面 css js -->
<script type="text/javascript" src="../plugins/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="../plugins/bootstrap/dist/js/bootstrap.js"></script>

<script>
    // 购买
    function Pay1() {
        var txmsg = $("#sp_txMsg");
        txmsg.html("")
        var recvname = $("#recvname");
        var phone = $("#phone");
        var buynum = $("#buynum");
        var addr = $("#addr");
        var remark = $("#remark");
        if (recvname.val() == "") {
            alert("收件人不能为空")
            return
        }
        if (phone.val() == "" || phone.val().length != 11) {
            alert("手机不能为空或格式不对(11位)")
            return
        }

        if (buynum.val() <= 0 || buynum.val() > ${payYueqi.stock}) {
            txmsg.html("购买数量不能小于1且大于库存")
            return
        }

        if (addr.val() == "") {
            alert("地址不能为空")
            return
        }


        var parm = $("#payform").serialize()


        $.ajax({
            url: "<%=APP_PATH%>/order/createOrder",
            data: parm,
            method: "post",
            success: function (map) {

                if (map.code == 200) {
                    alert(map.msg)
                } else {
                    alert(map.msg)
                    if (map.code == -1) {
                        //未登录
                        location.href = "<%=APP_PATH%>/pages/sign.jsp"
                    }
                }
            }
        })
    }

    //返回
    function goback() {
        window.history.go(-1)
    }

    //检查数量合法。计算总价
    function checkNum() {
        console.log("check.....")
        var txmsg = $("#sp_txMsg")
        txmsg.html("")
        var st =${payYueqi.stock};
        var dj =${payYueqi.newprice};

        var sp_payNum = $("#sp_payNum")
        var sp_totalMoney = $("#sp_totalMoney")
        var num = $("#buynum").val()
        var by_input = $("#buynum");
        if (isNaN(num)) {
            txmsg.html("请输入数字")
            return
        }
        if (num <= 0 || num > st) {
            txmsg.html("购买数量不能小于1且大于库存")
            by_input.val(1)
            checkNum()
            return
        }

        sp_payNum.html(num)
        sp_totalMoney.html(num * dj)
    }

</script>

</body>