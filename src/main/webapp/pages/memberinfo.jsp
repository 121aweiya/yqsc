<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>个人中心</title>
    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css" />
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="../css/page-learing-personal.css" />
    <% String APP_PATH = request.getContextPath(); %>
</head>

<body>
    <!-- 页面头部 -->
    <!--头部导航-->
    <header>
           <div class="learingHeader">
               <nav class="navbar">
                   <div class="">
                       <div class="logo"><img src="../img/asset-logoIco.png" width="100%" alt=""></div>
                       <div class="nav-list">
                           <ul class="nav navbar-nav">
                               <li ><a href="<%=APP_PATH%>/pages/list">首页</a></li>
                               <!-- <li><a href="#myNavbar">乐器分类</a></li> -->
                               <li><a href="<%=APP_PATH%>/pages/alllist">全部分类</a></li>
                               <li><a href="<%=APP_PATH%>/pages/checkFW.jsp">防伪查询</a></li>
                               <li><a href="<%=APP_PATH%>/news/list1">新闻公告</a></li>
                           </ul>
                       </div>
                       <div class="sign-in">
   
                           <c:if test="${memberSession == null}">
   
                               <!-- 未登录 -->
                               <a href="<%=APP_PATH%>/pages/sign.jsp">登录 </a> <span> | </span> <a href="<%=APP_PATH%>/pages/sign.jsp"> 注册</a>
                           </c:if>
                           <!-- 登录 -->
   
                           <c:if test="${memberSession != null}">
                               <span>欢迎<span style="color: red;">${memberSession.membername}</span>,</span>
                               <a href="<%=APP_PATH%>/pages/memberinfo?mid=${memberSession.mid}" class="personal">个人中心</a>
                               <a href="<%=APP_PATH%>/member/logout" class="personal">退出</a>
                           </c:if>
                           <!-- <a href="#" class="myInfo"> 杨成成</a> -->
   
                       </div>
   
                   </div>
               </nav>
           </div>
       </header>
    <div class="personal-header" style="background-image: url(../img/asset-banner.png);">
        <!--<div class="personal-info">-->
        <!--<p><h1>吴雪</h1></p>-->
        <!--<p>Web前端工程师 学习时长 48小时35分</p>-->
        <!--</div>-->
        <!--<div class="container">-->
        <!--<div class="col-lg-2"><img src="../img/logoIco.png" alt=""></div>-->
        <!--<div class="col-lg-4 title text-left">学习中心</div>-->
        <!--<div class="col-lg-6 text-right"><input type="text" class="input-search" placeholder="输入查询关键词"><input type="submit" class="search-buttom"></div>-->
        <!--</div>-->
    </div>
    <!-- 页面 -->
    <div class="container">
        <div class="personal-nav pull-left">
            <div class="nav nav-stacked text-left">
                <div class="title">个人中心</div>
               <!-- <div class="my-ico">
                    <img src="../img/asset-myimg.jpg" alt="">
                    <p>梦醒时分</p>
                </div> -->
                <div class="item">
                    <li class="active"><a href="<%=APP_PATH%>/pages/memberinfo?mid=${memberSession.mid}" class="glyphicon glyphicon-tower"> 我的信息<i class="pull-right">></i></a></li>
                    <li><a href="<%=APP_PATH%>/pages/orderinfo" class="glyphicon glyphicon-list-alt"> 我的订单<i class="pull-right">></i></a> </li>
                </div>
            </div>
        </div>
        <div class="personal-content pull-right">
            <div class="personal-cont">
                <div class="my-course">
                    <div class="title">
                        <div class="lab-title">我的个人信息</div>
                    </div>
                    <div class="cont">
                        <div class="">
                            <div class="item">
                              <form id="addForm" onsubmit="return false">
                                          <input type="hidden" name="mid" value="${member.mid}"/>
                                          <div class="layui-form-item">
                                              <label  class="layui-form-label">
                                                  会员名:</label>${member.membername}
                                          </div>

                                          <div class="layui-form-item">
                                              <label for="nickname" class="layui-form-label">
                                                  昵称</label>
                                              <div class="layui-input-inline">
                                                  <input value="${member.nickname}" type="text" id="nickname" name="nickname" lay-verify="repass"
                                                         autocomplete="off" class="layui-input">
                                              </div>
                              
                                          </div>
                              
                                          <div class="layui-form-item">
                                              <label for="email" class="layui-form-label">
                                                  邮箱</label>
                                              <div class="layui-input-inline">
                                                  <input value="${member.email}" type="email" id="email" name="email" lay-verify="repass"
                                                         autocomplete="off" class="layui-input">
                                              </div>
                              
                                          </div>
                              
                              
                                          <div class="layui-form-item">
                                              <label class="layui-form-label">
                                                  性别</label>
                              
                                              <div>

                                                  <input type="radio" name="sex" value="0" <c:if test="${member.sex==0}">checked="checked"</c:if>>男
                                                  <input type="radio" name="sex" value="1" <c:if test="${member.sex==1}">checked="checked"</c:if>>女
                              
                                              </div>
                              
                              
                                          </div>
                              
                              
                                          <div class="layui-form-item">
                                              <label for="mobile" class="layui-form-label">
                                                  手机</label>
                                              <div class="layui-input-inline">
                                                  <input value="${member.mobile}" type="text" id="mobile" name="mobile" lay-verify="repass"
                                                         autocomplete="off" class="layui-input">
                                              </div>
                              
                                          </div>
                              
                                          <div class="layui-form-item">
                                              <label  class="layui-form-label">
                                                  账户金额(元)：</label>${member.money}
                                              
                              
                                          </div>
                              
                              
                                          <div class="layui-form-item">
                                              <label class="layui-form-label"></label>
                                              <button class="layui-btn" lay-filter="add" onclick="updateMember()">修改</button>
                                          </div>
                              
                              
                                      </form>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
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

    <!-- 页面 css js -->
    <script type="text/javascript" src="../plugins/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="../plugins/bootstrap/dist/js/bootstrap.js"></script>
    <script>
        $(function() {
            $('.aft').hover(function() {
                if (!$(this).hasClass('ac')) {
                    $(this).find('ul').html($('#listcont').html())
                    $(this).addClass('ac')
                } else {
                    $(this).find('ul').text('')
                    $(this).removeClass('ac')
                }
            })
        })


        $(function() {
            $(window).scroll(function() {
                console.log($(this)[0].scrollY)
                if ($(this)[0].scrollY > 235) {
                    $('.personal-nav').css({
                        'position': 'fixed',
                        'top': 10
                    });
                } else if ($(this)[0].scrollY <= 155) {
                    $('.personal-nav').css({
                        'position': 'relative',
                        'top': -70
                    });
                };
            })
        })
    </script>
	<script>
	    function updateMember() {
	        var d = $("#addForm").serialize();
	        // var membername = $("#membername").val();
	        // var password = $("#password").val();
	        // var paypassword = $("#paypassword").val();
	       var email = $("#email").val();
	         console.log(d)
	        // console.log(membername)
	        // console.log(password)
	        // console.log(paypassword)

			
			
			//return

	        $.ajax({
	            url: "<%=APP_PATH%>/member/updateMember",
	            data: d,
	            method: "post",
	            success: function (r) {
	                if (r.status == 200) {
	                    // alert(obj.msg);
	                    // location.href = "<%=APP_PATH%>/admin/index";
	
	                    alert("修改成功")
                        location.reload()
	                } else {
	                    // alert(obj.msg);
	                    alert("修改失败")
	                }
	            }
	        })
	
	    }
	</script>
</body>