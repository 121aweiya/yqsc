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
    <title>详情</title>
    <% String APP_PATH = request.getContextPath(); %>
    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css" />
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css" />
    <link rel="stylesheet" href="../css/page-learing-shopping-order.css" />
</head>

<body data-spy="scroll" data-target="#articleNavbar" data-offset="150">
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
                            <li><a href="<%=APP_PATH%>/pages/list">全部分类</a></li>
                            <li><a href="<%=APP_PATH%>/pages/checkFW.jsp">防伪查询</a></li>
                            <li><a class="active" href="<%=APP_PATH%>/news/list1">新闻公告</a></li>
                        </ul>
                    </div>

                </div>
            </nav>
        </div>
    </header>
    <div class="container">
        <div class="learing-shopping-order">

            <div class="cartCont">
                <div class="top">
                    <div class="csAbout">详情:${news.newstitle}</div>
                    <div><span>发布时间：<fmt:formatDate value="${news.deploytime}" pattern="yyyy-MM-dd hh:mm"/> 作者:${news.deployname} </span></div>

                </div>

                <div>
                    <p>${news.newscontent}</p>
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


</body>

</html>