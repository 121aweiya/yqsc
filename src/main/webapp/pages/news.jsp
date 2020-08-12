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
    <title>新闻公告</title>
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
                            <li><a href="<%=APP_PATH%>/pages/alllist">全部分类</a></li>
                            <li><a href="<%=APP_PATH%>/pages/checkFW.jsp">防伪查询</a></li>
                            <li><a class="active" href="<%=APP_PATH%>/news/list1">新闻公告</a></li>
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
    <div class="container">
        <div class="learing-shopping-order">

            <div class="cartCont">
                <div class="top">
                    <div class="csAbout">新闻公告</div>
                    <div class="layui-card-body ">
                        <form class="layui-form layui-col-space5" onsubmit="return false">

                            <div class="layui-inline layui-show-xs-block">
                                <input id="searchID" type="text" value="${newstitile}" placeholder="请输入名字"
                                       autocomplete="off"
                                       class="layui-input">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <button class="btn btn-info" onclick="searchFun()"><i
                                        class="layui-icon"></i>搜索</button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:forEach var="n" items="${pageBean.list}">
                    <div>
                        <p class="tit">&nbsp;<span style="color: red">${n.id}</span>&nbsp;
                            <a href="<%=APP_PATH%>/news/showContent1?id=${n.id}">${n.newstitle}</a> <span>发布时间：<fmt:formatDate value="${n.deploytime}" pattern="yyyy-MM-dd hh:mm"/> 作者:${n.deployname} </span></p>
                    </div>
                </c:forEach>





                <div class="bot">

                    <%--分页开始--%>

                    <div align="left">
                        <span>当前${pageBean.currentPage} 页，共${pageBean.totalPage} 页,共${pageBean.totalCount}条</span>
                        <div class="page">
                            <div>

                                <a class="btn btn-info"
                                   href="<%=APP_PATH%>/news/list1?newstitile=${newstitile}&pageNo=${pageBean.currentPage-1>0?pageBean.currentPage-1:1}&pageSize=10">上一页</a>
                                <%--<a class="num" href="">1</a>--%>
                                <c:forEach var="p" begin="${pageBean.pageStartNo}" end="${pageBean.pageEndNo}">

                                    <c:if test="${p == pageBean.currentPage}">
                                        <%--<a class="num" class="current"
                                               href="<%=APP_PATH%>/member/list?pageNo=${p}&pageSize=1">${p}</a>--%>
                                        <span class="btn btn-danger">${p}</span>
                                    </c:if>
                                    <c:if test="${p != pageBean.currentPage}">
                                        <a class="btn btn-info"
                                           href="<%=APP_PATH%>/news/list1?newstitile=${newstitile}&pageNo=${p}&pageSize=10">${p}</a>
                                    </c:if>

                                </c:forEach>


                                <a class="btn btn-info"
                                   href="<%=APP_PATH%>/news/list1?newstitile=${newstitile}&pageNo=${pageBean.currentPage+1>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&pageSize=10">下一页</a>
                            </div>
                        </div>
                    </div>

                    <%--分页结束--%>
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
        var num = 0
        // 全选价格计算
        function selectAll() {
            var isCheck = $("#sel_1").is(':checked');
            num = 0
            $('.cont').find("input[type='checkbox']").each(function() {
                this.checked = isCheck;
                if (isCheck) {
                    var st = $(this).parent().parent().find('.sumMon span').text()
                    num += Number(st)
                }
            });
            $('.bot .sumMon span i').text(num)
        }
        // 单选价格计算
        function sumMon(obj) {
            if (obj.is(':checked')) {
                var st = obj.parent().parent().find('.sumMon span').text()
                num += Number(st)
            } else {
                var st = obj.parent().parent().find('.sumMon span').text()
                num -= Number(st)
            }
            $('.bot .sumMon span i').text(num)
        }
        // 提交订单
        $('.subBut').click(function() {

        })
    </script>

<script>
    function searchFun() {
        var searchName = $("#searchID").val();
        // alert(searchName)
        location.href = "<%=APP_PATH%>/news/list1?newstitile=" + searchName + "&pageNo=1&pageSize=10";
    }
</script>
</body>

</html>