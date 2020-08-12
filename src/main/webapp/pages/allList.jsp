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
                            <li><a href="<%=APP_PATH%>/pages/list">首页</a></li>
                            <!-- <li><a href="#myNavbar">乐器分类</a></li> -->
                            <li class="active"><a href="./list">全部分类</a></li>
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
                    <div class="starch"><input id="searchBox" type="text" value="${yname}" class="input-search" placeholder="输入查询关键词"><input type="submit" onclick="searchLike()" class="search-buttom"></div>
                </div>
            </nav>
        </div>
    </header>
    <div class="learing-list">
        <div class="list-box">
            <ul>
                <li>分类：</li>
                <li <c:if test="${catId==-1}">class="all"</c:if>><a href="javascript:searchLike(-1)">全部</a></li>
                <ol>
                    <!--<li><a href="">机器学习工程</a></li>-->

                    <c:forEach items="${categories}" var="cat">
                        <li <c:if test="${cat.id==catId}">class="active"</c:if>><a href="javascript:searchLike(${cat.id},${isHot})">${cat.categoryname}</a></li>
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
                            <li <c:if test="${isHot==-1}">class="active"</c:if>><a href="javascript:searchLike(${catId},-1)">全部</a></li>
                            <li <c:if test="${isHot==1}">class="active"</c:if>><a href="javascript:searchLike(${catId},1)">热门</a></li>
                            <li <c:if test="${isHot==0}">class="active"</c:if>><a href="javascript:searchLike(${catId},0)">非热门</a></li>
                            <div class="page navbar-right">
                                <a href="<%=APP_PATH%>/pages/alllist?catId=${catId}&yname=${yname}&isHot=${isHot}&pageNo=${pageBean.currentPage-1>0?pageBean.currentPage-1:1}&pageSize=10" class="prev">
                                    < </a>
                                        <span class="">${pageBean.currentPage}/${pageBean.totalPage}</span>
                                        <a href="<%=APP_PATH%>/pages/alllist?catId=${catId}&yname=${yname}&isHot=${isHot}&pageNo=${pageBean.currentPage+1>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&pageSize=10" class="next"> ></a>
                            </div>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="content-list">
                            <c:if test="${pageBean.totalCount == 0}">
                                <div class="recom-item">
                                    暂无有关乐器，重新试
                                </div>
                            </c:if>
                            <c:forEach items="${pageBean.list}"  var="yq">

                                <div class="recom-item">
                                    <a href="<%=APP_PATH%>/pages/detail?yqid=${yq.id}">

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

<script>
    function searchLike(catid,ishot) {

        var cont = $("#searchBox").val();
        var url="<%=APP_PATH%>/pages/alllist?yname="+cont;
        if(catid != undefined) url = url+"&catId="+catid;
        if(ishot != undefined) url = url+"&isHot="+ishot;

        console.log(url)
        location.href = url;

    }
</script>
</body>