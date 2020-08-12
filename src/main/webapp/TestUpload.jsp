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
    <title>上传文件测试</title>
    <script type="text/javascript" src="wangEditor/wangEditor.min.js"></script>
</head>
<body>
<div id="div1">
    <p>欢迎使用 wangEditor 富文本编辑器</p>

</div>


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



    editor.create()
</script>
</html>
