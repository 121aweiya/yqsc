<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020/03/09
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐器描述</title>
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
    <script type="text/javascript" src="../wangEditor/wangEditor.min.js"></script>

</head>
<body>


<div id="imgr">
    <form action="<%=APP_PATH%>/upload1" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${id}">
        <p>展示图片：
            <input type="file" name="upload"></p>
        <br>
        <input class="layui-btn" type="submit" value="修改图片">
    </form>

</div>
<br>
<br>
</hr>
<br>

<div id="div1">
    ${yq.yqdescription}
</div>
<input id="btn1" type="button" class="layui-btn" value="提交描述">

</body>

<script>
    var E = window.wangEditor
    var editor = new E('#div1')

    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '/yqsc/upload'
    editor.customConfig.uploadFileName = 'upload'

    // 进行下文提到的其他配置
    // ……
    // ……
    // ……
    document.getElementById('btn1').addEventListener('click', function () {
        // 读取 text
        console.log(editor.txt.html())
        var des = encodeURI(editor.txt.html());


        $.ajax({
            url: "<%=APP_PATH%>/yueqi/updateDes",
            data: "id=" + ${id} + "&des=" + des,
            method: "post",
            success: function (r) {
                if (r.status == 200) {
                    layer.msg('修改成功，请关闭窗口。', {icon: 1, time: 1000});
                } else {
                    // alert(obj.msg);
                    layer.msg('修改失败，请重试', {icon: 1, time: 1000});
                }
            }
        })


    }, false)


    editor.create()
</script>
</html>
