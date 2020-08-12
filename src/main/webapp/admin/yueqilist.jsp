<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="x-admin-sm">
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
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <% String APP_PATH = request.getContextPath(); %>
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">乐器管理</a>
            <a>
              <cite>乐器列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" onsubmit="return false">

                        <div>条件筛选：</div>
                        <div class="layui-inline layui-show-xs-block">
                            <input id="searchID" type="text" value="${yname}" placeholder="请输入乐器名"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <select id="selectHot">
                                <option name="isHot"
                                        <c:if test="${isHot==-1}">selected="selected"</c:if> value="-1">请先择
                                </option>
                                <option name="isHot"
                                        <c:if test="${isHot==0}">selected="selected"</c:if> value="0">非热卖
                                </option>
                                <option name="isHot"
                                        <c:if test="${isHot==1}">selected="selected"</c:if> value="1">热卖
                                </option>
                            </select>
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <select id="selectShow">
                                <option name="isShow"
                                        <c:if test="${isShow==-1}">selected="selected"</c:if> value="-1">请先择
                                </option>
                                <option name="isShow"
                                        <c:if test="${isShow==0}">selected="selected"</c:if> value="0">下架
                                </option>
                                <option name="isShow"
                                        <c:if test="${isShow==1}">selected="selected"</c:if> value="1">上架
                                </option>
                            </select>
                        </div>

                        <div class="layui-inline layui-show-xs-block">
                            <select id="select_cat">
                                <option name="cat"
                                        <c:if test="${catId==-1}">selected="selected"</c:if> value="">请先择
                                </option>

                                <c:forEach items="${cats}" var="c">
                                    <option name="cat"
                                            <c:if test="${c.id==catId}">selected="selected"</c:if>
                                            value="${c.id}">${c.categoryname}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>


                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" onclick="searchYueqi()"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">

                    <button class="layui-btn"
                            onclick="xadmin.open('添加乐器','<%=APP_PATH%>/yueqi/toAddYueqiPage',500,500)"><i
                            class="layui-icon"></i>添加乐器
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>

                            <th>ID</th>
                            <th>图片</th>
                            <th>序列号</th>
                            <th>乐器名称</th>
                            <th>类别</th>
                            <th>原价</th>
                            <th>现价</th>
                            <th>库存</th>
                            <th>重量Kg</th>
                            <th>热卖</th>
                            <th>上架/下架</th>
                            <th>创建时间</th>

                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="yueqi" items="${pageBean.list}">
                            <tr>


                                <td>${yueqi.id}</td>
                                <td><img width="100px" height="50px" src="${yueqi.imgurl}"/></td>
                                <td>${yueqi.yqnum}</td>
                                <td>${yueqi.yqname}</td>
                                <td>${yueqi.category.categoryname}</td>
                                <td>${yueqi.oldprice}</td>
                                <td>${yueqi.newprice}</td>
                                <td>${yueqi.stock}</td>
                                <td>${yueqi.weight}</td>
                                <td>
                                    <c:if test="${yueqi.ishot==1}">热卖</c:if>
                                    <c:if test="${yueqi.ishot==0}">非热卖</c:if>
                                </td>
                                <td>
                                    <c:if test="${yueqi.isshow==1}">上架</c:if>
                                    <c:if test="${yueqi.isshow==0}">下架</c:if>
                                </td>
                                <td><fmt:formatDate value="${yueqi.createtime}" pattern="yyyy-MM-dd hh:mm"/></td>
                                <td class="td-manage">

                                    <a title="编辑乐器"
                                       onclick="xadmin.open('编辑乐器','<%=APP_PATH%>/yueqi/toUpdateYueqiPage?id=${yueqi.id}',600,400)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    &nbsp;

                                    <a title="图片描述"
                                       onclick="xadmin.open('图片描述','<%=APP_PATH%>/yueqi/toAddDesPage?id=${yueqi.id}',750,600)"
                                       href="javascript:;">
                                        <i class="layui-icon">&#xe6b2;</i>
                                    </a>
                                    &nbsp;

                                    <a title="删除" onclick="yueqi_del(this,${yueqi.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                    &nbsp;
                                    <a title="上架" onclick="fun_sjxj(1,${yueqi.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe6af;</i>
                                    </a>
                                    &nbsp;
                                    <a title="下架" onclick="fun_sjxj(0,${yueqi.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe69c;</i>
                                    </a>

                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                    &nbsp;
                                    <a title="热卖" onclick="fun_rm(1,${yueqi.id})" href="javascript:;">
                                        <i class="layui-icon">&#xe756;</i>
                                    </a>
                                    &nbsp;
                                    <a title="非热卖" onclick="fun_rm(0,${yueqi.id})" href="javascript:;">

                                        <i class="layui-icon">&#xe6b1;</i>
                                    </a>
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
                               href="<%=APP_PATH%>/yueqi/list1?yname=${yname}&pageNo=${pageBean.currentPage-1>0?pageBean.currentPage-1:1}&pageSize=10&isHot=${isHot}&isShow=${isShow}&catId=${catId}">上一页</a>
                            <%--<a class="num" href="">1</a>--%>

                            <c:forEach var="p" begin="${pageBean.pageStartNo}" end="${pageBean.pageEndNo}">

                                <c:if test="${p == pageBean.currentPage}">
                                    <%--<a class="num" class="current" href="<%=APP_PATH%>/member/list?pageNo=${p}&pageSize=1">${p}</a>--%>
                                    <span class="current">${p}</span>
                                </c:if>
                                <c:if test="${p != pageBean.currentPage}">
                                    <a class="num"
                                       href="<%=APP_PATH%>/yueqi/list1?yname=${yname}&pageNo=${p}&pageSize=10&isHot=${isHot}&isShow=${isShow}&catId=${catId}">${p}</a>
                                </c:if>

                            </c:forEach>

                            <a class="next"
                               href="<%=APP_PATH%>/yueqi/list1?yname=${yname}&pageNo=${pageBean.currentPage+1>pageBean.totalPage?pageBean.totalPage:pageBean.currentPage+1}&pageSize=10&isHot=${isHot}&isShow=${isShow}&catId=${catId}">下一页</a>
                        </div>
                    </div>
                </div>

                <%--分页结束--%>

            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;


        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-删除*/
    function yueqi_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据

            console.log(id);

            $.ajax({
                url: "<%=APP_PATH%>/yueqi/delById",
                data: "id=" + id,
                method: "post",
                success: function (r) {
                    if (r.status == 200) {
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!', {icon: 1, time: 1000});
                    } else {
                        // alert(obj.msg);
                        layer.msg('删除失败!', {icon: 1, time: 1000});
                    }
                }
            })

            //$(obj).parents("tr").remove();
            //  layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }


    function searchYueqi() {
        var searchName = $("#searchID").val();
        var hot = $("#selectHot option:selected").val();
        var show = $("#selectShow option:selected").val();
        var catid = $("#select_cat option:selected").val();


        // alert(searchName)

        console.log(hot)
        console.log(show)
        location.href = "<%=APP_PATH%>/yueqi/list1?yname=" +
            searchName + "&pageNo=1&pageSize=10&isHot=" + hot + "&isShow=" + show + "&catId=" + catid;
    }


    function fun_sjxj(type, id) {

        $.ajax({
            url: "<%=APP_PATH%>/yueqi/sjxj",
            data: "id=" + id + "&type=" + type,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    layer.msg('完成!', {icon: 1, time: 1000});
                    location.reload()
                } else {
                    // alert(obj.msg);
                    layer.msg('失败!', {icon: 1, time: 1000});
                }
            }
        })
    }

    function fun_rm(type, id) {

        $.ajax({
            url: "<%=APP_PATH%>/yueqi/updateHot",
            data: "id=" + id + "&type=" + type,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    layer.msg('完成!', {icon: 1, time: 1000});
                    location.reload()
                } else {
                    // alert(obj.msg);
                    layer.msg('失败!', {icon: 1, time: 1000});
                }
            }
        })
    }


</script>
</html>