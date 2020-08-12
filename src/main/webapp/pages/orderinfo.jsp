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
                    <li ><a href="<%=APP_PATH%>/pages/memberinfo?mid=${memberSession.mid}" class="glyphicon glyphicon-tower"> 我的信息<i class="pull-right">></i></a></li>
                    <li class="active"><a href="<%=APP_PATH%>/pages/orderinfo" class="glyphicon glyphicon-list-alt"> 我的订单<i class="pull-right">></i></a> </li>
                </div>
            </div>
        </div>
        <div class="personal-content pull-right">
            <div class="personal-cont">
                <div class="my-course">
                    <div class="title">
                        <div class="lab-title">我的订单</div>
                    </div>
                    <div class="cont">

                        <c:forEach var="order" items="${orders}">

                            <div class="col-lg-12">
                                <div class="item">
                                    <div class="time">订单编号：${order.id}</div>
                                    <div class="time">乐器名：${order.yueqi.yqname}</div>
                                    <div class="time">收件人：${order.recvname}</div>
                                    <div class="time">总金额：${order.totalmoney}元</div>
                                    <div class="time">手机：${order.phone}</div>
                                    <div class="time">购买数量：${order.buynum}</div>
                                    <div class="time">支付方式： <c:if test="${order.payfs==0}">余额</c:if>
                                        <c:if test="${order.payfs==1}">支付宝</c:if>
                                        <c:if test="${order.payfs==2}">微信</c:if>
                                    </div>
                                    <div class="time">快递：${order.kdname}</div>
                                    <div class="time">快递单号：${order.kdnum}</div>
                                    <div class="time">快递状态：<c:if test="${order.status==0}">未支付</c:if>
                                        <c:if test="${order.status==1}">已支付，待发货</c:if>
                                        <c:if test="${order.status==2}">已发货，代签收</c:if>
                                        <c:if test="${order.status==4}">订单完成</c:if>
                                    </div>
                                    <div class="time">下单时间：<fmt:formatDate value="${order.createtime}" pattern="yyyy-MM-dd hh:mm"/></div>
                                    <%--<c:if test="${order.payfs==0 && order.status==0}"><div class="time">支付密码：<input id="ps" value="" type="password"></div></c:if>--%>
                                    <div class="butItem text-center">
                                        <c:if test="${order.status==0}"><a href="javascript:;" onclick="pay(${order.id},${order.payfs},${order.status})" class="classcom">支付</a></c:if>
                                        <c:if test="${order.status==2}"><a href="javascript:;" onclick="qianshou(${order.id})" class="classcom">签收</a></c:if>
                                        <a href="javascript:;" onclick="order_del(this,'${order.id}')" class="classcom">删除订单</a>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>


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
	    function pay(oid,fs,sta) {

	        //age=prompt("请输入");
            var ps = "null";
            if(fs==0 && sta==0){
                ps=prompt("请求支付密码");
            }

            if(ps==null || ps=="") {

                alert("密码不能为空")
                return
            }



	        console.log(ps)




	        //return
	        var d = {
	            oid:oid,
                paypass:ps
            }

	        $.ajax({
	            url: "<%=APP_PATH%>/order/pay",
	            data: d,
	            method: "post",
	            success: function (r) {
	                if (r.status == 200) {
	                    // alert(obj.msg);
	                    // location.href = "<%=APP_PATH%>/admin/index";
	                    alert(r.msg)
                        location.reload()
	                } else {
	                    // alert(obj.msg);
                        alert(r.msg)
	                }
	            }
	        })
	
	    }

	    function qianshou(oid) {

	        var d = {
	            oid:oid
            }

	        $.ajax({
	            url: "<%=APP_PATH%>/order/qianshou",
	            data: d,
	            method: "post",
	            success: function (r) {
	                if (r.status == 200) {
	                    // alert(obj.msg);
	                    // location.href = "<%=APP_PATH%>/admin/index";
	                    alert(r.msg)
                        location.reload()
	                } else {
	                    // alert(obj.msg);
                        alert(r.msg)
	                }
	            }
	        })

	    }

        /*-删除*/
        function order_del(obj, id) {
            $.ajax({
                url: "<%=APP_PATH%>/order/delById",
                data: "id=" + id,
                method: "post",
                success: function (r) {
                    if (r.status == 200) {
                        // $(obj).parents("tr").remove();
                        alert('已删除!');
                        location.reload()
                    } else {
                        // alert(obj.msg);
                        alert('删除失败,请检订单是否完成!');
                    }
                }
            })
        }


	</script>
</body>