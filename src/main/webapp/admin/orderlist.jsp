<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../admin/css/font.css">
    <link rel="stylesheet" href="../admin/css/xadmin.css">
    <script src="../admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../admin/js/xadmin.js"></script>
    <% String APP_PATH = request.getContextPath(); %>
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">订单管理</a>
                <a>
                    <cite>订单列表</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" onsubmit="return false">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" value="${start}" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" value="${end}" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select id="select_zffs">
                                <option name="zffs" value="-1" <c:if test="${zffs==-1}">selected="selected"</c:if>>支付方式</option>
                                <option name="zffs" value="0" <c:if test="${zffs==0}">selected="selected"</c:if>>余额</option>
                                <option name="zffs" value="1" <c:if test="${zffs==1}">selected="selected"</c:if>>支付宝</option>
                                <option name="zffs" value="2" <c:if test="${zffs==2}">selected="selected"</c:if>>微信</option>
                            </select>
                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select id="select_status">
                                <option name="ostatus" value="-1" <c:if test="${ostatus==-1}">selected="selected"</c:if>>订单状态</option>
                                <option name="ostatus" value="0" <c:if test="${ostatus==0}">selected="selected"</c:if>>未支付</option>
                                <option name="ostatus" value="1" <c:if test="${ostatus==1}">selected="selected"</c:if>>已支付</option>
                                <option name="ostatus" value="2" <c:if test="${ostatus==2}">selected="selected"</c:if>>待签收</option>
                                <option name="ostatus" value="4" <c:if test="${ostatus==4}">selected="selected"</c:if>>已完成</option>
                            </select>
                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <c:if test="${oid != -1}">
                                <input type="text" id="oid" value="${oid}" name="oid" placeholder="请输入订单号" autocomplete="off"
                                       class="layui-input">
                            </c:if>
                            <c:if test="${oid == -1}">
                                <input type="text" id="oid" value="" name="oid" placeholder="请输入订单号" autocomplete="off"
                                       class="layui-input">
                            </c:if>

                        </div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <button class="layui-btn"  onclick="searchOrder()" lay-filter="sreach">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>


                </div>
                <%--<div class="layui-card-header">

                    <button class="layui-btn" onclick="xadmin.open('添加用户','./order-add.html',800,600)">
                        <i class="layui-icon"></i>添加
                    </button>
                </div>--%>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>

                            <th>订单编号</th>
                            <th>乐器名</th>
                            <th>收件人</th>
                            <th>总金额</th>
                            <th>手机</th>
                            <th>购买数量</th>
                            <th>支付方式</th>
                            <th>订单状态</th>
                            <th>快递</th>
                            <th>快递单号</th>
                            <th>下单时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="myorder" items="${pageBean.list}">
                             <tr>

                                 <td>${myorder.id}</td>
                                 <td>${myorder.yueqi.yqname}</td>
                                 <td>${myorder.recvname}</td>
                                 <td>${myorder.totalmoney}</td>
                                 <td>${myorder.phone}</td>
                                 <td>${myorder.buynum}</td>
                                 <td>
                                     <c:if test="${myorder.payfs==0}">余额</c:if>
                                     <c:if test="${myorder.payfs==1}">支付宝</c:if>
                                     <c:if test="${myorder.payfs==2}">微信</c:if>
                                 </td>
                                 <td>
                                     <c:if test="${myorder.status==0}">未支付</c:if>
                                     <c:if test="${myorder.status==1}">已支付</c:if>
                                     <c:if test="${myorder.status==2}">待签收</c:if>
                                     <c:if test="${myorder.status==4}">完成</c:if>
                                 </td>
                                 <td>${myorder.kdname}</td>
                                 <td>${myorder.kdnum}</td>
                                 <td>
                                     <fmt:formatDate value="${myorder.createtime}" pattern="yyyy-MM-dd hh:mm"/>
                                 </td>
                                 <td class="td-manage">
                                     <a title="发货" onclick="xadmin.open('发货','<%=APP_PATH%>/order/toFahuo?oid=${myorder.id}',300,300)" href="javascript:;">
                                         <i class="layui-icon">【发货】</i></a>
                                     <a title="删除" onclick="order_del(this,'${myorder.id}')" href="javascript:;">
                                         <i class="layui-icon">&#xe640;</i></a>
                                 </td>
                             </tr>
                         </c:forEach>

                        </tbody>
                    </table>
                </div>
                <%--分页开始--%>

                <div class="layui-card-body ">
                    <span>当前${pageBean.currentPage} 页，共${pageBean.totalPage} 页,共${pageBean.totalCount}条</span>
                    <div class="page">
                        <div>

                            <a class="prev"
                               href="<%=APP_PATH%>/order/list1?start=${start}&pageNo=${pageBean.currentPage-1>0?pageBean.currentPage-1:1}&pageSize=10&end=${end}&zffs=${zffs} &ostatus=${ostatus}&oid=${oid}">上一页</a>
                            <%--<a class="num" href="">1</a>--%>

                            <c:forEach var="p" begin="${pageBean.pageStartNo}" end="${pageBean.pageEndNo}">

                                <c:if test="${p == pageBean.currentPage}">
                                    <%--<a class="num" class="current" href="<%=APP_PATH%>/member/list?pageNo=${p}&pageSize=1">${p}</a>--%>
                                    <span class="current">${p}</span>
                                </c:if>
                                <c:if test="${p != pageBean.currentPage}">
                                    <a class="num"
                                       href="<%=APP_PATH%>/order/list1?start=${start}&pageNo=${p}&pageSize=10&end=${end}&zffs=${zffs} &ostatus=${ostatus}&oid=${oid}">${p}</a>
                                </c:if>

                            </c:forEach>

                            <a class="next"
                               href="<%=APP_PATH%>/order/list1?start=${start}&pageNo=${pageBean.currentPage+1>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&pageSize=10&end=${end}&zffs=${zffs} &ostatus=${ostatus}&oid=${oid}">下一页</a>
                        </div>
                    </div>
                </div>

                <%--分页结束--%>
            </div>
        </div>
    </div>
</div>
</body>
<script>layui.use(['laydate', 'form'],
    function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

/*搜索*/
function searchOrder() {
    var start = $("#start").val();
    var end = $("#end").val();
    var zffs = $("#select_zffs option:selected").val();
    var ostatus = $("#select_status option:selected").val();
    var oid = $("#oid").val();

    location.href = "<%=APP_PATH%>/order/list1?start=" +
        start + "&pageNo=1&pageSize=10&end=" + end + "&zffs=" + zffs + "&ostatus=" + ostatus + "&oid=" + oid;
}

/*-删除*/
function order_del(obj, id) {
    layer.confirm('确认要删除吗？', function (index) {
        //发异步删除数据

        console.log(id);

        $.ajax({
            url: "<%=APP_PATH%>/order/delById",
            data: "id=" + id,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                } else {
                    // alert(obj.msg);
                    layer.msg('删除失败,请检订单是否完成!', {icon: 1, time: 1000});
                }
            }
        })

        //$(obj).parents("tr").remove();
        //  layer.msg('已删除!', {icon: 1, time: 1000});
    });
}

</script>

