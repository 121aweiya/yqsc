<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>注册</title>
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
        <div class="register-body container text-center">
            <div class="signIco"><img src="../img/asset-logoIco.png" alt="logo" width="180"></div>
            <div class="signTit cl"><span class="sign">登录</span><span class="reg activ">注册</span></div>
            <div class="signItem">
                <div>
                    <p>账户名</p>
                    <p>
                        <input type="text" name="username" class="textInput">
                        <span class="proof cl-orange"></span>
                    </p>
                </div>
                <div>
                    <p>登录密码</p>
                    <p>
                        <input type="text" name="password" class="textInput">
                        <span class="proof cl-orange"></span>
                    </p>
                </div>
                <div class="setSing">
                </div>
                <div class="submitBut">登录</div>
            </div>

            <div class="regItem show">
               <%-- <div class="phoneBox">
                    <p>手机号码</p>
                    <p>
                        <input type="text" name="phone" class="textInput" placeholder="请输入11位手机号码">
                        <span class="proof cl-orange"></span>
                    </p>
                </div>--%>

                <%--pppp--%>
                <form id="addForm" onsubmit="return false">
                    <div class="layui-form-item">
                        <label for="membername" class="layui-form-label">
                            <span style="color: red;">*</span>会员名</label>
                        <p>
                            <input type="membername"  id="membername" name="membername" required="" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入会员名">
                        </p>

                    </div>

                    <div class="layui-form-item">

                        <label for="password" class="layui-form-label">
                            <span style="color: red;">*</span> 密码</label>
                        <p>
                            <input type="password" id="password" name="password" required="" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入密码">
                        </p>
                    </div>

                    <div class="layui-form-item">

                        <label for="paypassword" class="layui-form-label">
                            <span style="color: red;">*</span> 支付密码</label>
                        <p >
                            <input type="password" id="paypassword" name="paypassword" required="" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入支付密码">
                        </p>
                    </div>

                    <div class="layui-form-item">
                        <label for="nickname" class="layui-form-label">
                            昵称</label>
                        <p >
                            <input type="text" id="nickname" name="nickname" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入昵称">
                        </p>

                    </div>

                    <div class="layui-form-item">
                        <label for="email" class="layui-form-label">
                            邮箱</label>
                        <p >
                            <input type="email" id="email" name="email" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入邮箱">
                        </p>

                    </div>

                    <div class="layui-form-item">
                        <label for="mobile" class="layui-form-label">
                            手机</label>
                        <p >
                            <input type="text" id="mobile" name="mobile" lay-verify="repass"
                                   autocomplete="off" class="textInput" placeholder="请输入手机">
                        </p>

                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            性别</label>

                        <p>
                            <input type="radio" name="sex" value="0" checked="checked">男
                            <input type="radio" name="sex" value="1">女

                        </p>


                    </div>





                  <%--  <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" onclick="addMember()">增加</button>
                    </div>--%>
                    <%--ddd--%>

                <div class="registerBut" onclick="register()">注册</div>
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
                            <div>毕业设计</div>
                            <div>©mryang 哈尔滨师范大学 2020</div>
                        </div>

                    </div>
                </div>
        </footer>
    </div>
    <!-- 页面 css js -->
    <script type="text/javascript" src="../plugins/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="../plugins/bootstrap/dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="../js/page-learing-sign.js"></script>

<script>
    // 注册
    function register() {
      var param =  $("#addForm").serialize();
      console.log(param)
        var membername = $("#membername").val();
        var password = $("#password").val();
        var paypassword = $("#paypassword").val();


        if (membername == "" || password == "" || paypassword == "") {
            alert("带*号必填")
            return
        }



        $.ajax({
            url: "<%=APP_PATH%>/member/insertMember",
            data: param,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    // alert(obj.msg);
                    // location.href = "<%=APP_PATH%>/admin/index";

                    alert("注册成功");
                } else {
                    // alert(obj.msg);
                    alert("注册失败");
                }
            }
        })
    }

    /* 登录 */
    $('.submitBut').click(function(){
        var username = $('[name=username]');
        var password = $('[name=password]');
        if(username.val() == ""){
            username.siblings('.proof').show().text('登录名不能为空');;
            return
        }else{
            username.siblings('.proof').hide();
        }
        if(password.val() == ""){
            password.siblings('.proof').show().text('密码不能为空');;
            return
        }else{
            password.siblings('.proof').hide();
        }

        var param = {
            membername:username.val(),
            password:password.val()
        }

        $.ajax({
            url: "<%=APP_PATH%>/member/login",
            data: param,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    // alert(obj.msg);
                    location.href = "<%=APP_PATH%>/pages/list";

                } else {
                    // alert(obj.msg);
                    alert("登录失败，请重试");
                }
            }
        })




    })

</script>

</body>