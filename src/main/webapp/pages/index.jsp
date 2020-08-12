<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- <link rel="icon" href="../img/asset-favicon.ico"> -->
    <title>乐器商城</title>

    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css"/>
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="../css/page-learing-index.css"/>
    <% String APP_PATH = request.getContextPath(); %>

</head>

<body data-spy="scroll" data-target="#myNavbar" data-offset="150">

<!-- 页面头部 -->

<!--头部导航-->
<header>
    <div class="learingHeader">
        <nav class="navbar">
            <div class="">
                <div class="logo"><img src="../img/asset-logoIco.png" width="100%" alt=""></div>
                <div class="nav-list">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="<%=APP_PATH%>/pages/list">首页</a></li>
                        <!-- <li><a href="#myNavbar">乐器分类</a></li> -->
                        <li><a href="<%=APP_PATH%>/pages/alllist">全部分类</a></li>
                        <li><a href="<%=APP_PATH%>/pages/checkFW.jsp">防伪查询</a></li>
                        <li><a href="<%=APP_PATH%>/news/list1">新闻公告</a></li>
                    </ul>
                </div>

                <div class="sign-in">

                    <c:if test="${memberSession == null}">

                        <!-- 未登录 -->
                        <a href="<%=APP_PATH%>/pages/sign.jsp">登录 </a> <span> | </span> <a
                            href="<%=APP_PATH%>/pages/sign.jsp"> 注册</a>
                    </c:if>
                    <!-- 登录 -->

                    <c:if test="${memberSession != null}">
                        <span>欢迎<span style="color: red;">${memberSession.membername}</span>,</span>
                        <a href="<%=APP_PATH%>/pages/memberinfo?mid=${memberSession.mid}" class="personal">个人中心</a>
                        <a href="<%=APP_PATH%>/member/logout" class="personal">退出</a>
                    </c:if>
                    <!-- <a href="#" class="myInfo"> 杨成成</a> -->

                </div>
                <div class="starch"><input id="searchBox" type="text" class="input-search"
                                           placeholder="输入查询乐器的关键词"><input onclick="searchLike()" type="submit"
                                                                           class="search-buttom"></div>
            </div>
        </nav>
    </div>
</header>


<!--banner区-->
<!--<div class="travel-index-imgroll">-->
<!--<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">-->
<!--<ol class="carousel-indicators">-->
<!--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>-->
<!--<li data-target="#carousel-example-generic" data-slide-to="1"></li>-->
<!--<li data-target="#carousel-example-generic" data-slide-to="2"></li>-->
<!--</ol>-->
<!--<div class="carousel-inner" role="listbox">-->
<!--<div class="item active">-->
<!--<img src="banner3.png" width="100%" alt="AA"> -->
<!--</div>-->
<!--<div class="item">-->
<!--<img src="bannerA.jpg" width="100%" alt="AA">-->
<!--</div>-->
<!--<div class="item">-->
<!--<img src="bannerB.jpg" width="100%" alt=""> -->
<!--</div>-->
<!--</div>-->
<!--</div>-->
<!--</div>-->
<div class="banner-roll">
    <div class="banner-item">
        <div class="item" style="background-image: url(../img/widget-bannerB.jpg); height: 100%"></div>
        <!-- <div class="item" style="background-image: url(../img/widget-bannerA.jpg);"></div>
        <div class="item" style="background-image: url(../img/widget-banner3.png);"></div> -->
    </div>
    <div class="indicators"></div>
</div>
<div class="container">


    <div style="height: 450px;"></div>


    <div class="conten-list">
        <div class="Recommend">
            <div class="title">推荐<a href="<%=APP_PATH%>/pages/alllist">查看全部</a></div>
            <div class="content">


                <c:forEach items="${pageBean.list}" var="yq">

                    <div class="recom-item">
                        <a href="<%=APP_PATH%>/pages/detail?yqid=${yq.id}">

                            <p><img src="${yq.imgurl}" width="214px" height="146px" alt=""><c:if
                                    test="${yq.ishot == 1}"><span class="lab">HOT</span></c:if></p>
                            <ul>
                                <li><span style="color: #b9151b">名称:</span>${yq.yqname}</li>
                                <li><span>价格:￥${yq.newprice}元</span> 剩: ${yq.stock}</li>
                                <br>
                                <li><span>类别:${yq.category.categoryname}</span></li>
                            </ul>
                        </a>
                    </div>

                </c:forEach>
            </div>
        </div>

        <!-- <div class="Recommend">
             <div class="title-class">
                 XXX工程师
                 <a href="#">查看全部</a>
             </div>
             <div class="content">
                 <div class="recom-item">
                     <a href="#">
                         <p><img src="../img/widget-demo1.png" width="100%" alt=""></p>
                         <ul>
                             <li>XXXXXX练 </li>
                             <li><span>高级</span> <em> · </em> xx5人在学习</li>
                         </ul>
                     </a>
                 </div>

         </div>-->


    </div>


    <div class="index-cont-nav">
        <div id="myNavbar" class="collapse navbar-collapse ">
            <div id="myCollapse" class="collapse navbar-collapse">
                <!-- <div class="logo-ico"><img src="../img/asset-logoIco.png" alt=""></div> -->
                <ul class="nav navbar-nav">
                    <!-- <li class="active"><a href="#a">编程入门</a></li> -->
                    <li class="active">乐器分类</li>
                    <c:forEach items="${categories}" var="cat">
                        <li><a href="<%=APP_PATH%>/pages/alllist?catId=${cat.id}">${cat.categoryname}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>

<!-- 页面底部 -->
<div class="gotop">
    <a href="#top"><i class="glyphicon glyphicon-plane"></i><span class="hide">返回顶部</span></a>
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

</body>

<!-- 页面 css js -->

<script type="text/javascript" src="../plugins/jquery/dist/jquery.js"></script>
<script type="text/javascript" src="../plugins/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    var tg = $('.banner-item .item');
    var num = 0;
    for (i = 0; i < tg.length; i++) {
        $('.indicators').append('<span></span>');
        $('.indicators').find('span').eq(num).addClass('active');
    }

    function roll() {
        tg.eq(num).animate({
            'opacity': '1',
            'z-index': num
        }, 1000).siblings().animate({
            'opacity': '0',
            'z-index': 0
        }, 1000);
        $('.indicators').find('span').eq(num).addClass('active').siblings().removeClass('active');
        if (num >= tg.length - 1) {
            num = 0;
        } else {
            num++;
        }
    }

    $('.indicators').find('span').click(function () {
        num = $(this).index();
        roll();
    });
    var timer = setInterval(roll, 3000);
    $('.banner-item').mouseover(function () {
        clearInterval(timer)
    });
    $('.banner-item').mouseout(function () {
        timer = setInterval(roll, 3000)
    });
</script>
<script type="text/javascript" src="../js/widget-travel-index-nav.js"></script>
<script>
    $('.teach-item').hover(function () {
        $(this).find('.teach-info').animate({
            'height': '100%'
        }, 500);
    }, function () {
        $(this).find('.teach-info').animate({
            'height': '112px'
        }, 500);
    })


    $('.gotop a').hover(function () {
        $(this).find('span').removeClass('hide')
    }, function () {
        $(this).find('span').addClass('hide')
    })


    $(function () {
        $('.interest-box .interest-cont li').click(function () {
            if ($(this).hasClass('active')) {
                $(this).removeClass('active');
            } else {
                $(this).addClass('active');
            }
        })
        $('.mask').click(function () {
            $('.interest-box').hide();
        })
        $('.button .pres').click(function () {
            $('.interest-box').hide();
        })
        $('.button .skip').click(function () {
            $('.interest-box').hide();
        })
    })
</script>
<script src="../js/page-learing-index.js"></script>
<script>
    function searchLike() {

        var cont = $("#searchBox").val()
        var url = "<%=APP_PATH%>/pages/alllist?yname=" + cont;


        console.log(url)
        location.href = url;

    }
</script>


</html>