<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <c:import url="/header.jsp"/>
    <% String APP_PATH = request.getContextPath(); %>
    <![endif]-->
</head>
<script>
    function toSetHiddenId() {
        var catid = $("#select_cat option:selected").val();
        console.log(catid)
        $("#categoryid").val(catid);
        console.log($("#categoryid").val())
    }
</script>
<body>


<div class="layui-fluid">
    <div class="layui-row">
        <form id="addForm" onsubmit="return false">

            <input name="id" type="hidden" value="${yq.id}">

            <div class="layui-form-item">
                <label for="yqname" class="layui-form-label">
                    <span style="color: red;">*</span>乐器名称:</label>
                <div class="layui-input-inline">
                    <input type="text" id="yqname" name="yqname" value="${yq.yqname}" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span style="color: red;">*</span>乐器类别:</label>
                <div class="layui-input-inline">
                    <select id="select_cat" onchange="toSetHiddenId()">
                        <option name="cat" value="-1">请先择
                        </option>
                        <c:forEach items="${cats}" var="c">
                            <option onchange="toSetHiddenId()" <c:if test="${c.id == yq.categoryid}">selected="selected"</c:if>  name="cid" value="${c.id}">${c.categoryname}</option>
                        </c:forEach>
                    </select>
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span style="color: red;">*</span>重量(kg):</label>
                <div class="layui-input-inline">
                    <input type="text" id="weight" value="${yq.weight}" name="weight" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <div class="layui-input-inline">
                    <input type="hidden" id="categoryid" value="${yq.categoryid}" name="categoryid"  lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span style="color: red;">*</span>原价(元):</label>
                <div class="layui-input-inline">
                    <input type="text" id="oldprice" value="${yq.oldprice}" name="oldprice" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>

            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span style="color: red;">*</span>现价(元):</label>
                <div class="layui-input-inline">
                    <input type="text" id="newprice" value="${yq.newprice}" name="newprice" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span style="color: red;">*</span>库存:</label>
                <div class="layui-input-inline">
                    <input type="text" id="stock" value="${yq.stock}" name="stock" required="" lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>




        </form>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <button class="layui-btn" lay-filter="add" onclick="fun_update()">修改</button>
        </div>


    </div>
</div>
<script>
    function fun_update() {
        var d = $("#addForm").serialize();
        var catid = $("#select_cat option:selected").val();
        var yqname = $("#yqname").val();

        if(catid == -1){
            layer.msg("请选择类别", {icon: 2, time: 1000});
            return
        }

        $("#categoryid").val(catid);

       // return

        if(yqname == ""){
            layer.msg("请输入名字", {icon: 2, time: 1000});
            return
        }



        $.ajax({
            url: "<%=APP_PATH%>/yueqi/update",
            data: d,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    layer.msg(r.msg, {icon: 1, time: 1000});
                    //alert("添加乐器成功");
                } else {
                    layer.msg(r.msg, {icon: 2, time: 1000});
                    //alert("添加乐器失败");
                }
            }
        })

    }


</script>

</body>

</html>