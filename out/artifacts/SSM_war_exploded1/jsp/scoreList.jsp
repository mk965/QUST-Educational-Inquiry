<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/18/018
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="../css/weui.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/onlyWeChatBrowser.js"></script>
    <title>青科 - 教务查询</title>
    <script src="../js/prompt.js"></script></head>
<body>
<div class="weui-tab">
    <!--没有查询到成绩-->
    <div id="noScore"  class="weui-tab__panel" style="display: none;">
        <div class="weui-msg">
            <div class="weui-msg__icon-area"><i class="weui-icon-waiting weui-icon_msg"></i></div>
            <div class="weui-msg__text-area">
                <h2 class="weui-msg__title">还没有成绩公布</h2>
                <p class="weui-msg__desc">可能还没有老师上传您的成绩</p>
            </div>
            <div class="weui-msg__opr-area">
                <p class="weui-btn-area">
                    <a href="index" class="weui-btn weui-btn_primary">查询全部成绩</a>
                    <a href="index" class="weui-btn weui-btn_default">返回首页</a>
                </p>
            </div>
        </div>
    </div>
    <!--查询到成绩-->
    <div id="yesScore" class="weui-tab__panel"style="display: block;">
        <h1 class="title">青科-本学期成绩
            <div class="weui-cells__title">
                当前版本为：正常显示版
            </div>
            <div class="weui-cells__title">
                <a href="">
                    点击查看分数显示版
                </a>
            </div>
        </h1>

        <c:forEach items="${scoreList}" var="list">
            <div class="weui-cells">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <p>${list.kcmc} [${list.xf}学分<span hidden>，${list.jd}绩点</span>]<small style="position: absolute;padding-left: .2em;font-size: 10px;">${list.kcxz}</small></p>
                    </div>
                    <div class="weui-cell__ft">${list.cj} 分</div>
                </div>
            </div>
        </c:forEach>

        <div class="weui-footer">
            <!--<img src="../image/footer.png" width="100%">-->
        </div>
    </div>

    <div class="weui-tabbar">
        <a href="index" class="weui-tabbar__item weui-bar__item_on">
            <img src="../image/home.png" alt="教务首页" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">教务首页</p>
        </a>
        <a href="https://zhiwei.sangsir.com/urp/?action=logout" class="weui-tabbar__item">
            <img src="../image/logout.png" alt="退出登录" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">退出登录</p>
        </a>    </div>
</div>
<script src="../image/jweixin-1.js"></script>
<script>
    if ('${scoreList}' == null || ${scoreList} == ''){
        document.getElementById("noScore").style.display = "block";
        document.getElementById("yesScore").style.display = "none";
    }
    /*
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
        timestamp: 1547790131,
        nonceStr: 'HIMQ45IWZYazeTZA',
        signature: 'f59b6b18042e77238da089380841c25e8f73d4d0',
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
    });
    */
</script>

</body>
</html>