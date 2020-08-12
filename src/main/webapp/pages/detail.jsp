<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../img/asset-favicon.ico">
    <title>乐器详情</title>

    <link rel="stylesheet" href="../plugins/normalize-css/normalize.css"/>
    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="../css/page-learing-article.css"/>
    <% String APP_PATH = request.getContextPath(); %>
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

                <div class="starch"><input id="searchBox" type="text" class="input-search"
                                           placeholder="输入查询乐器的关键词"><input onclick="searchLike()" type="submit"
                                                                           class="search-buttom"></div>

                </div>
            </div>
        </nav>
    </div>
</header>

<div class="article-banner">
    <div class="banner-bg"></div>
    <div class="banner-info">
        <div class="banner-left">
            <p>分类： <span>${detail.category.categoryname}</span></p>
            <p>分类描述： <span>${detail.category.description}</span></p>
            <p class="tit">${detail.yqname}</p>
            <p class="pic"><span class="new-pic">特惠价格￥${detail.newprice}</span> <span
                    class="old-pic">原价￥${detail.oldprice}</span></p>
            <p class="info">
                <a href="javascript:gotoPay(${detail.id});">立即购买</a>
                <span><em>当前库存</em>${detail.stock}</span>
                <span><em>重量KG</em>${detail.weight}</span>
                <span><em>编号</em>${detail.yqnum}</span>
                <span><em>热买</em><c:if test="${detail.ishot==1}">是</c:if><c:if test="${detail.ishot==0}">否</c:if></span>

            </p>
        </div>
        <div class="banner-rit">
            <p><img src="${detail.imgurl}" width="350px" height="200px" alt=""></p>
            <%--<p class="vid-act"><span> <i class="i-heart"></i>收藏 23 </span> <span>分享 <i class="i-weixin"></i><i class="i-qq"></i></span></p>--%>
        </div>
    </div>
</div>
<div class="article-cont">
    <div class="tit-list">
        <a href="javascript:;" id="articleClass" class="active">详情介绍</a>
        <%--
         <a href="javascript:;" id="artcleCod">评价</a>--%>

    </div>
    <div class="article-box">
        <div class="articleClass" style="display: block">
            <div class="rit-title">评价</div>
            <div class="article-cont">
                <div class="article-left-box">
                    <div class="content">
                        <div class="content-com about">
                            ${detail.yqdescription}
                        </div>

                    </div>
                </div>


                <div class="article-right-box">
                    <div class="comment">
                        <!--<div class="tit">评论</div>-->
                        <div class="com-cont">
                            <c:forEach var="cm" items="${comments}">

                                <div class="item">
                                    <div class="top-info">
                                        <div class="info">
                                            <p style="color: red">${cm.member.membername}:</p>
                                        </div>

                                    </div>
                                    <div class="but-info"><span>${cm.contents}</span></div>
                                    <c:if test="${cm.member.mid == memberSession.mid}">
                                         <div><a href="javascript:delComment(${cm.id})">删除评论</a></div>
                                    </c:if>
                                </div>
                            </c:forEach>
                            <div class="go-pingjia">${comments.size()}条评价 <a href="javascript:pj(${detail.id})">评价</a></div>
                        </div>

                    </div>
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
    $('.vid-act').click(function () {
        $(this).find('.i-heart').css('background-position', '4px -55px')
    })


    $(function () {
        //点击下拉
        //用法：HTML 点击事件为more,父级使用overflow：hidden；限定高 more与要展开的内容为同级 要展开内容添加 drop-down的class
        function ckMove(target, ckgar, het, text, incr) {
            var inc = incr ? incr : 0;
            $(target).find(ckgar).on('click', function () {
                var h = $(this).parent().find('.drop-down ul').height();
                if (!$(this).hasClass('act')) {
                    $(this).addClass('act');
                    $(this).parent().find('.drop-down').css({
                        'height': (h + inc) + 'px'
                    });
                    $(this).find('i').removeClass('i-chevron-bot').addClass('i-chevron-top')
                } else {
                    $(this).removeClass('act');
                    $(this).parent().find('.drop-down').css({
                        'height': het + 'px'
                    });
                    $(this).find('i').removeClass('i-chevron-top').addClass('i-chevron-bot')
                }
            })
        }

        ckMove('.article-cont .article-left-box', '.title', 0);

        $('.learing-box .item-list').mouseover(function (e) {
            $(this).css({
                'height': '140px'
            }).addClass('hov').siblings().css({
                'height': '50px'
            })
            $(this).siblings().removeClass('hov')
        })
        $('.learing-box .item-box').mouseout(function () {
            $(this).find('.item-list:first').css({
                'height': '140px'
            }).addClass('hov')
            $(this).find('.item-list:first').siblings().css({
                'height': '50px'
            }).removeClass('hov')
        })
    })


    $(function () {
        $('.learing-box .item-list').mouseover(function (e) {
            $(this).css({
                'height': '140px'
            }).addClass('hov').siblings().css({
                'height': '50px'
            })
            $(this).siblings().removeClass('hov')
        })
        $('.learing-box .item-box').mouseout(function () {
            $(this).find('.item-list:first').css({
                'height': '140px'
            }).addClass('hov')
            $(this).find('.item-list:first').siblings().css({
                'height': '50px'
            }).removeClass('hov')
        })
    })


    $(function () {
        $('.active-box span').click(function () {
            $(this).css({
                'color': '#00a4ff'
            })
            if ($(this).find('i').hasClass('i-laud')) {
                $(this).find('.i-laud').css('background-position', '-80px -19px')
            } else if ($(this).find('i').hasClass('i-coll')) {
                $(this).find('.i-coll').css('background-position', '1px -75px')
            }
        })
        $('.learing-box .item-list').mouseover(function (e) {
            $(this).css({
                'height': '140px'
            }).addClass('hov').siblings().css({
                'height': '50px'
            })
            $(this).siblings().removeClass('hov')
        })
        $('.learing-box .item-box').mouseout(function () {
            $(this).find('.item-list:first').css({
                'height': '140px'
            }).addClass('hov')
            $(this).find('.item-list:first').siblings().css({
                'height': '50px'
            }).removeClass('hov')
        })
    })


    $(function () {
        //评分
        $('.star .score').map(function (n, i) {
            var x = Number($(this).find('i').text());
            var w = 109 * (1 - x / 5);
            $(this).css('width', w + 'px');
        })
        //评论打分
        $('.evaluate .star').mousemove(function (e) {
            var startX = $(this).offset().left;
            var movX = e.clientX - startX + 0.5;
            var w = 145 * (1 - movX / 145);
            $(this).find('.score').css('width', w + 'px');
            $('.star-score i').text((movX / 145 * 5).toFixed(1))
        })
        //星级评分
        $('.grade').map(function (n, i) {
            var pret = $(this).find('.percent-num i').text();
            var wt = $(this).find('.grade-percent').width();
            $(this).find('.grade-percent span').css('width', wt * pret / 100);
        })


    })


    $(function () {
        //点击下拉
        function ckMove(target, het, text, incr) {
            var inc = incr ? incr : 0;
            $(target).find('.on-off').on('click', function () {
                var h = $(this).parent().find('.drop-down p').height();
                if (!$(this).hasClass('act')) {
                    $(this).addClass('act');
                    $(this).parent().find('.drop-down').css({
                        'height': (h + inc) + 'px'
                    });
                    $(this).find('i').removeClass('i-chevron-bot').addClass('i-chevron-top')
                } else {
                    $(this).removeClass('act');
                    $(this).parent().find('.drop-down').css({
                        'height': het + 'px'
                    });
                    $(this).find('i').removeClass('i-chevron-top').addClass('i-chevron-bot')
                }
            })
        }

        ckMove('.cktop', 60);
        ckMove('.cont .item', 0);
        //点击关闭弹窗
        $('.close-popup').click(function () {
            $('.popup-box').hide();
        })
        $('.tit-list a').click(function () {
            $(this).addClass('active').siblings().removeClass('active');
            var clasNod = '.' + $(this)[0].id
            $(clasNod).show().siblings().hide()
        })
        // 资料下载
        $('.down-fill span').click(function () {
            $('.down-fill ul').css({
                display: 'block'
            });
        })
        $('.down-fill ul li').click(function () {
            $('.down-fill ul').css({
                display: 'none'
            });
        })
    })
</script>
<script>

    function pj(yqid) {
        if(yqid == undefined || yqid <=0) alert("错误");
        var cont = prompt("请输入评论内容","");
        if(cont == null) return
        if(cont == "") alert("请重新输入，不能为空")
        var param={
             yqid:yqid,
             cont:cont
        }
        $.get("<%=APP_PATH%>/pages/pj",param,function (r) {
           console.log(r.code)
           console.log(r.msg)
            if(r.code == 200){
                alert(r.msg);
                location.reload()
            }else {
                alert(r.msg);
                location.href="<%=APP_PATH%>/pages/sign.jsp";
            }
        })

    }

    //删除
    function delComment(id) {
        if (id == undefined || id <= 0) alert("错误");

        var param = {
            id: id
        }
        $.get("<%=APP_PATH%>/comments/delById", param, function (r) {

            if (r.status == 200) {
                alert(r.msg);
                location.reload()
            } else {
                alert(r.msg);
            }
        })
    }
</script>
<script>
    function searchLike() {

        var cont = $("#searchBox").val()
        var url = "<%=APP_PATH%>/pages/alllist?yname=" + cont;


        console.log(url)
        location.href = url;

    }
    function gotoPay(yid) {
        console.log(yid);
        var url = "<%=APP_PATH%>/order/gotopay?yid=" + yid;
        location.href= url;

    }
</script>
</body>