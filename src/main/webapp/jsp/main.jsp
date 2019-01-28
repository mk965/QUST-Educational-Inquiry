<%--
  Created by IntelliJ IDEA.
  User:  Mencre
  Email: mencre@163.com
  Date:  2019/1/17/017
  Time:  19:01
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
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
    <script src="<%=basePath%>js/jquery.js"></script>
    <script src="<%=basePath%>js/onlyWeChatBrowser.js"></script>
    <title>青科 - 教务查询</title>
    <script src="<%=basePath%>js/prompt.js"></script></head>
<body>
<style>.huise {
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    filter: grayscale(100%);
    filter: gray;
}</style>
<div class="weui-tab">
    <div class="weui-tab__panel">
        <h1 class="title">青科 - 教务首页
            <div class="weui-cells__title" id="stuNum">同学你还未登录，请先<a href="index">登录</a>！</div>
            <div id="xuenianxueqi" class=" weui-cells__title"></div>
        </h1>
        <!---<div style="text-align: center;margin-bottom: 10px;"><a href="?action=evaluate" class="weui-btn weui-btn_mini weui-btn_primary">[实验性] 点此进行评教 BETA版</a></div>--->
        <div class="weui-grids">
            <a href="javascript:;" class="weui-grid open-popup" data-target="#selectTerm">
                <div class="weui-grid__icon">
                    <img src="<%=basePath%>image/all.png" alt="全部成绩">
                    <span class="weui-badge" style="position: absolute;top: .5em;right: .5em;">NEW</span>
                </div>
                <p class="weui-grid__label">全部成绩</p>
            </a>
            <a href="<%=basePath%>currentTermScore" class="weui-grid loading">
                <div class="weui-grid__icon">
                    <img src="<%=basePath%>image/chengji.png" alt="本学期成绩">
                    <span class="weui-badge" style="position: absolute;top: .5em;right: .5em;">HOT</span>
                </div>
                <p class="weui-grid__label">本学期成绩</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="<%=basePath%>image/bujige.png" alt="不及格&amp;重修">
                </div>
                <p class="weui-grid__label">不及格&amp;重修(正在开发)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid"> <!--?action=schedule-->
                <div class="weui-grid__icon">
                    <img class="huise" src="<%=basePath%>image/kebiao.png" alt="个人课表">
                </div>
                <p class="weui-grid__label">个人课表(即将上线)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="<%=basePath%>image/fangan.png" alt="培养方案">
                </div>
                <p class="weui-grid__label">培养方案(正在开发)</p>
            </a>
            <a href="javascript:alert('该功能正在开发中...');" class="weui-grid">
                <div class="weui-grid__icon">
                    <img class="huise" src="<%=basePath%>image/xuefen.png" alt="学涯统计">
                </div>
                <p class="weui-grid__label">学涯统计(正在开发)</p>
            </a>
            <a href="http://msg.weixiao.qq.com/t/7aa4e8b31a1546a591dbb384e16b9c61" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="<%=basePath%>image/cet.png" alt="四六级成绩">
                </div>
                <p class="weui-grid__label">四六级成绩</p>
            </a>
            <a href="http://cjcx.neea.edu.cn/html1/folder/1508/206-1.htm?sid=300" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="<%=basePath%>image/computer.png" alt="计算机成绩">
                </div>
                <p class="weui-grid__label">计算机成绩</p>
            </a>
            <a href="http://sd.cltt.org/Web/Login/PSCP01001.aspx" class="weui-grid">
                <div class="weui-grid__icon">
                    <img src="<%=basePath%>image/talk.png" alt="普通话成绩">
                </div>
                <p class="weui-grid__label">普通话成绩</p>
            </a>
        </div>
        <div class="weui-footer">
            <img src="<%=basePath%>image/footer.png" width="100%">
        </div>
    </div>


    <div class="weui-tabbar">
        <a href="<%=basePath%>index" class="weui-tabbar__item weui-bar__item_on">
            <img src="<%=basePath%>image/home.png" alt="教务首页" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">教务首页</p>
        </a>
        <a href="<%=basePath%>/logout" class="weui-tabbar__item">
            <img src="<%=basePath%>image/logout.png" alt="退出登录" class="weui-tabbar__icon">
            <p class="weui-tabbar__label">退出登录</p>
        </a>
    </div>
</div>

<!--弹出层-->
<div id="selectTerm" class="weui-popup__container popup-bottom">
    <form action="termTermScore" method="get">
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal" style="height: 50%;">
            <div class="weui-cell">
                <div class="weui-cell__hd"><label class="weui-label">选择学期</label></div>
                <div class="weui-cell__bd">
                    <input id="picker" name="year" class="weui-input" type="text" value="2018-2019学年 第1学期" readonly=""style="text-align: center;">
                </div>
            </div>
            <div class="weui-cell">
                <div class="weui-msg__opr-area" style="width: 100%;">
                    <p class="weui-btn-area">
                        <input class="weui-btn weui-btn_primary loading" type="submit" value="查询">
                    </p>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="<%=basePath%>js/jweixin-1.js"></script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>
<script>
    $(".loading").click(function(){
        $.showLoading("正在查询...");
    });
    if(1${sessionScope.name}) {
        document.getElementById("stuNum").innerText = ${sessionScope.name} + "同学，你好！";
    }
//学年学期
var date = new Date;
var year = date.getFullYear();
var month = date.getMonth() + 1;
var term = 1;
if(month < 9)
    year = year - 1;
if(month > 2 && month < 9)
    term = 2;
else
    term = 1;
document.getElementById("xuenianxueqi").innerHTML = year + "-" + (year + 1) + " 学年 第 " + term + " 学期";

//按学期查询
var stuNum = "1508610115";
var nianji = parseInt(Number(stuNum) / 100000000);
console.log(nianji);
$("#picker").picker({
    title: "请选择学年学期",
    cols: [{
        textAlign: 'center',
        values: ["2015-2016学年", '2016-2017学年', '2017-2018学年', '2018-2019学年']
    },
        {
            textAlign: 'center',
            values: ['第1学期', '第2学期']
        }
    ]
});

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
   */</script>

</body>
</html>