<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>全部</title>
    <% String APP_PATH = request.getContextPath(); %>
    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css" />
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="../css/page-learing-list.css" />
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
                            <li><a href="#">首页</a></li>
                            <!-- <li><a href="#myNavbar">乐器分类</a></li> -->
                            <li class="active"><a href="./list">全部乐器</a></li>
                            <li><a href="./checkFW.jsp">防伪查询</a></li>
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
                    <div class="starch"><input type="text" class="input-search" placeholder="输入查询关键词"><input type="submit" class="search-buttom"></div>
                </div>
            </nav>
        </div>
    </header>
    <div class="learing-list">
        <div class="list-box">
            <ul>
                <li>分类：</li>
                <li class="all">全部</li>
                <ol>
                    <!--<li><a href="">机器学习工程</a></li>-->
                    <c:forEach items="${categories}" var="cat">
                        <li><a href="#${cat.id}">${cat.categoryname}</a></li>
                    </c:forEach>
                </ol>
            </ul>
         
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-9 list-row-left">
                <div class="list-cont-left">
                    <div class="tit">
                        <ul class="nav nav-tabs ">
                            <li class="active"><a href="#">推荐</a></li>
                            <li><a href="#">最新</a></li>
                            <li><a href="#">热评</a></li>
                            <div class="page navbar-right">
                                <a href="#" class="prev">
                                    < </a>
                                        <span class="">1/28</span>
                                        <a href="#" class="next"> ></a>
                            </div>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="content-list">
                            <c:forEach items="${pageBean.list}"  var="yq">

                                <div class="recom-item">
                                    <a href="#${yq.id}">

                                        <p><img src="${yq.imgurl}" width="214px" height="146px" alt=""><c:if test="${yq.ishot == 1}"><span class="lab">HOT</span></c:if></p>
                                        <ul>
                                            <li><span style="color: #b9151b">名称:</span>${yq.yqname}</li>
                                            <li><span>价格:￥${yq.newprice}元</span>  剩: ${yq.stock}</li>
                                            <br>
                                            <li><span>类别:${yq.category.categoryname}</span></li>
                                        </ul>
                                    </a>
                                </div>

                            </c:forEach>
                            
                            <li class="clearfix"></li>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 页面底部 -->
    <!--底部版权-->
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
        $('.list-box ol li').on('click', function() {
            $(this).addClass('active');
            $(this).siblings().removeClass('active');
        })


        $('.list-cont-left .nav-tabs li').on('click', function() {
            $(this).addClass("active").siblings().removeClass('active');
        })


        $('.contList-item').hover(function() {
            $(this).find('.box').addClass('hov').parent().siblings().find('.box').removeClass('hov')
        }, function() {
            $(this).siblings().first().find('.box').addClass('hov').parent().siblings().find('.box').removeClass('hov')
        })
    </script>
</body>