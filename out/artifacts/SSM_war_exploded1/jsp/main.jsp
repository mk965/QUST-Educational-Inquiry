<%--
  Created by IntelliJ IDEA.
  User:  Mencre
  Email: mencre@163.com
  Date:  2019/1/17/017
  Time:  19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<style>
    .huise{
        -webkit-filter: grayscale(100%);
        -moz-filter: grayscale(100%);
        -ms-filter: grayscale(100%);
        -o-filter: grayscale(100%);
        filter: grayscale(100%);
        filter: gray;
    }
</style>
<div class="weui-tab">
    <div class="weui-tab__panel">
        <h1 class="title">青科 - 教务首页
            <div class="weui-cells__title"id="stuNum">同学你还未登录，请先<a href="index">登录</a>！</div>
            <div id="xuenianxueqi" class="weui-cells__title"></div>
        </h1>
        <!---<div style="text-align: center;margin-bottom: 10px;"><a href="?action=evaluate" class="weui-btn weui-btn_mini weui-btn_primary">[实验性] 点此进行评教 BETA版</a></div>--->
        <div class="weui-grids">
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="../image/all.png" alt="全部成绩">
                </div>
                <p class="weui-grid__label">全部成绩(正在开发)</p>
            </a>
            <a href="currentTermScore" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../image/chengji.png" alt="本学期成绩">
                    <span class="weui-badge" style="position: absolute;top: .5em;right: .5em;">HOT</span>
                </div>
                <p class="weui-grid__label">本学期成绩</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="../image/bujige.png" alt="不及格&amp;重修">
                </div>
                <p class="weui-grid__label">不及格&amp;重修(正在开发)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid"> <!--?action=schedule-->
                <div class="weui-grid__icon">
                    <img class="huise" src="../image/kebiao.png" alt="个人课表">
                </div>
                <p class="weui-grid__label">个人课表(正在开发)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="../image/fangan.png" alt="培养方案">
                </div>
                <p class="weui-grid__label">培养方案(正在开发)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="../image/xuefen.png" alt="学涯统计">
                </div>
                <p class="weui-grid__label">学涯统计(正在开发)</p>
            </a>
            <a href="http://msg.weixiao.qq.com/t/7aa4e8b31a1546a591dbb384e16b9c61" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../image/cet.png" alt="四六级成绩">
                </div>
                <p class="weui-grid__label">四六级成绩</p>
            </a>
            <a href="http://msg.weixiao.qq.com/t/487fb7744b901f2cf4e457d47aecf568" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../image/computer.png" alt="计算机成绩">
                </div>
                <p class="weui-grid__label">计算机成绩</p>
            </a>
            <a href="http://sd.cltt.org/Web/Login/PSCP01001.aspx" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="../image/talk.png" alt="普通话成绩">
                </div>
                <p class="weui-grid__label">普通话成绩</p>
            </a>
        </div>
        <div class="weui-footer">
            <!--<img src="../image/footer.png" width="100%">-->
        </div>
    </div>
    <div class="weui-tabbar">
        <a href="index" class="weui-tabbar__item weui-bar__item_on">
            <img src="../image/home.png" alt="教务首页" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">教务首页</p>
        </a>
        <a href="/jiaowu/logout" class="weui-tabbar__item">
            <img src="../image/logout.png" alt="退出登录" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">退出登录</p>
        </a>
    </div>
</div>
<script src="../js/jweixin-1.js"></script>
<script>
    if(${ sessionScope.name }){
        document.getElementById("stuNum").innerText = ${ sessionScope.name } + "同学，你好！";
    }
    //学年学期
    var date=new Date;
    var year=date.getFullYear();
    var month=date.getMonth()+1;
    var term = 1;
    if(month < 9)
        year = year - 1;
    if (month>2 && month<9)
        term = 2;
    else
        term = 1;
    document.getElementById("xuenianxueqi").innerHTML = year + "-" + (year + 1) + " 学年 第 " + term + " 学期";


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
           timestamp: 1547722193,
           nonceStr: 'gLq9utyFtLpJYNfS',
           signature: 'a40ddd626a1cff04ddef178170b8af4dcd97afd3',
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

</body></html>