<%--
  Created by IntelliJ IDEA.
  User:  Mencre
  Email: mencre@163.com
  Date:  2019/1/16/016
  Time:  23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
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
    <div class="weui-tab__panel">        <h1 class="title">青岛科技大学 - 教务登录</h1>
        <form action="login" method="post" onsubmit="return loginCheck();">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">学号</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="number" name="stuNum" id="number" placeholder="请输入学号" required="" value="">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">密码</label></div>
                    <div class="weui-cell__bd">
                        <input class="weui-input" type="password" name="password" id="jwpass" placeholder="请输入密码" required="">
                    </div>
                </div>
                <div class="weui-cell weui-cell_switch">
                    <div class="weui-cell__bd">记住密码</div>
                    <div class="weui-cell__ft">
                        <label for="remember" class="weui-switch-cp">
                            <input id="remember" class="weui-switch-cp__input" type="checkbox" checked="checked">
                            <div class="weui-switch-cp__box"></div>
                        </label>
                    </div>
                </div>
            </div>
            <div class="weui-cells__tips">* 密码仅存储在你本机中，不会存储在服务器中</div>
            <div class="weui-cells__tips">* 密码即为选课&amp;教务的密码，默认为身份证号后六位</div>
            <div class="weui-cells__tips"style="color: red;">* 近期教务系统不稳定，如登录失败请稍后再试</div>
            <div class="weui-btn-area">
                <input id="btnLogin" class="weui-btn weui-btn_primary" type="submit" value="登录">
            </div>
        </form>
        <script type="text/javascript">
            $(document).ready(function(){
                var number = localStorage.getItem('number');
                var jwpass = localStorage.getItem('jwpass');
                if (number) {
                    $('#number').val(number);
                }
                if (jwpass) {
                    $('#jwpass').val(jwpass);
                }
            });

            function loginCheck(){
                var number = $('#number').val();
                var jwpass = $('#jwpass').val();
                localStorage.setItem('number', number);
                if ($('#remember').is(':checked')) {
                    localStorage.setItem('jwpass', jwpass);
                }else{
                    localStorage.removeItem('jwpass');
                }
            }
        </script>
        <div class="weui-footer">
            <img src="<%=basePath%>image/footer.png" width="100%">
        </div>
    </div>
    <div class="weui-tabbar">
        <a href="<%=basePath%>mian" class="weui-tabbar__item weui-bar__item_on">
            <img src="<%=basePath%>image/home.png" alt="教务首页" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">教务首页</p>
        </a>
        <a href="javascript:alert('该功能正在开发中...');" class="weui-tabbar__item">
            <img src="<%=basePath%>image/logout.png" alt="校园卡查询" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">校园卡查询(正在开发)</p>
        </a>    </div>
</div>
<script src="<%=basePath%>js/jweixin-1.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script>

    /*document.getElementById("btnLogin").onclick = function(){
        $.showLoading("正在登录...");
    };

    if (/Android/gi.test(navigator.userAgent)) {
        window.addEventListener('resize', function () {
            if (document.activeElement.tagName == 'INPUT' || document.activeElement.tagName == 'TEXTAREA') {
                window.setTimeout(function () {
                    document.activeElement.scrollIntoView();
                }, 0);
            }
        })
    }

    wx.config({
        debug: false,
        appId: 'wx637132226ad612b6',
        timestamp: 1547463349,
        nonceStr: 'fl5lL79rm5vgGQmz',
        signature: '2a16f9ee000a1511260d579ee4350e9d8f25058c',
        jsApiList: [
          'hideMenuItems',
        ]
    });
    wx.ready(function () {
        wx.hideMenuItems({
            menuList: [
                'menuItem:copyUrl', // 复制链接
                'menuItem:dayMode', // 日间模式
                'menuItem:nightMode', // 夜间模式
                'menuItem:favorite', // 收藏
                'menuItem:originPage', // 原网页
                'menuItem:readMode', // 阅读模式
                'menuItem:openWithQQBrowser', // 在QQ浏览器中打开
                'menuItem:openWithSafari', // 在Safari中打开
                'menuItem:share:email', // 邮件
                'menuItem:share:appMessage', // 发送给朋友
                'menuItem:share:timeline', // 分享到朋友圈
                'menuItem:share:qq', // 分享到QQ
                'menuItem:share:QZone', // 分享到 QQ 空间
                'menuItem:share:weiboApp', // 分享到Weibo
            ]
        });
    });*/
</script>

</body></html>