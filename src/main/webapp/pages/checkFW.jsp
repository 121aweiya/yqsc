<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>防伪</title>
    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css" />
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="../css/page-learing-sign.css" />
    <% String APP_PATH = request.getContextPath(); %>
</head>

<body>
    <!-- 页面 -->
    <div class="register">
        <!--<img src="../../assets/img/logoico.png" alt="logo" width="200">-->
        <a href="./list" class="backIndex">返回首页</a>

            <div class="regItem show">
               <div class="phoneBox">
                    <p>请输入防伪码</p>
                    <p>
                        <input id="fwm" type="text" name="fwm" class="textInput" placeholder="请输入请输入防伪码">
                        <br>
                        <span style="color: red" id="fwResult"></span>
                    </p>
                </div>

                <div class="registerBut" onclick="fwCheck()">查询</div>
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
    // 防伪
    function fwCheck() {


        var fwm = $("#fwm").val();
        var fwResult = $("#fwResult");
        fwResult.html("")
        if (fwm == "" ) {
            fwResult.html("防伪码不能为空")
            return
        }

        if ( fwm.length <30) {
            fwResult.html("防伪码长度过短")
            return
        }

        console.log(param)

        var param = {
            serialNum:fwm
        }


        $.ajax({
            url: "<%=APP_PATH%>/fwcx/check",
            data: param,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    // alert(obj.msg);
                    // location.href = "<%=APP_PATH%>/admin/index";
                    fwResult.html("您购买是正品，名称为:"+r.msg);
                  //  alert("注册成功");
                } else {
                    // alert(obj.msg);
                    fwResult.html("您购买可能不是正品，防伪码已经被查询过或者是非正品！");
                }
            }
        })
    }

</script>

</body>