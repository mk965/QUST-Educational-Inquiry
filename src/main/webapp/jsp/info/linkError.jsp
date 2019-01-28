<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/19/019
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="<%=basePath%>css/weui.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/onlyWeChatBrowser.js"></script>
    <title>青科 - 教务查询</title>
    <script src="<%=basePath%>js/prompt.js"></script></head>
<body>
<div class="weui-tab">
    <div class="weui-tab__panel">
        <div class="weui-msg">
            <div class="weui-msg__icon-area"><i class="weui-icon-warn weui-icon_msg"></i></div>
            <div class="weui-msg__text-area">
                <h2 class="weui-msg__title">教务系统连接失败</h2>
                <p class="weui-msg__desc">教务系统不稳定，可以稍后再试</p>
            </div>
            <div class="weui-msg__opr-area">
                <p class="weui-btn-area">
                    <a href="<%=basePath%>/index" class="weui-btn weui-btn_primary">重新登录</a>
                    <a href="<%=basePath%>/index" class="weui-btn weui-btn_default">返回首页</a>
                </p>
            </div>
        </div>
        <div class="weui-footer">
            <img src="<%=basePath%>image/footer.png" width="100%">
        </div>
    </div>
</div>
</body>
</html>
