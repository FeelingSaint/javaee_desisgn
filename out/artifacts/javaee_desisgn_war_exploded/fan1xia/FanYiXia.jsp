<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/20
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>翻一下</title>
    <!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
    <link rel="shortcut icon" href="images/fan.gif" />
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <![endif]-->

    <link href="./css/reset.css" rel="stylesheet" />
    <link href="./css/index.css" rel="stylesheet"/>
    <link href="./plugins/assets/countdown/jquery.countdown.css" rel="stylesheet"/>
    <link href="./plugins/animate-custom/animate-custom.css" rel="stylesheet"/>

    <!-- 添加百度分析 -->
    <script src="//yanhaijing.com/assets/plugin/tongji/baidu.js"></script>
</head>
<body>

<a href="http://localhost:8080/javaee_desisgn_war_exploded/login_success/welcome.jsp"><button>返回</button></a>
<div id="loading" class="loading">
    <img src="images/ajax-loader.gif" />
    <p>
        Loading core module please wait a while...
    </p>
</div><!-- end .loading -->
<div id="home">

    选择游戏难度

    <ul>
        <li><button class="animated my-animate" for="rotateIn">1</button></li>
        <li><button class="animated my-animate" for="rotateIn">2</button></li>
        <li><button class="animated my-animate" for="rotateIn">3</button></li>
        <li><button class="animated my-animate" for="rotateIn">4</button></li>
        <li><button class="animated my-animate" for="rotateIn">5</button></li>
        <li><button class="animated my-animate" for="rotateIn">6</button></li>
        <li><button class="animated my-animate" for="rotateIn">7</button></li>
        <li><button class="animated my-animate" for="rotateIn">8</button></li>
        <li><button class="animated my-animate" for="rotateIn">9</button></li>
        <li><button class="animated my-animate" for="rotateIn">10</button></li>
    </ul>
</div><!--end of #home-->

<div id="success">
    <h1>success</h1>
    <ul id="test">
        <li id="level" >
            难度: <strong>1</strong>
        </li>
        <li id="pair">
            消除: <strong>5</strong> 对
        </li>
        <li id="click">
            点击: <strong>5</strong> 次
        </li>
        <li id="error">
            点错: <strong>5</strong> 次
        </li>
        <li id="score" >
            总评分:<strong>100</strong>

        </li>
        <li id="hight-score">
            历史最高分: <strong>0</strong>

        </li>
<%
    int i=0;
%>
        <li>
            <a id="share-qzone-success" version="1.0" class="share-qzone qzOpenerDiv" href="#" target="_blank"></a>
        </li>
    </ul>


    <script>
        function save(){
            var level=$("#success li[id='level']").html();
            var score=$("#success li[id='score']").html();
            var higth_score=$("#success li[id='hight-score']").html();
            var gameName="FanYiXia";
            // var num = parseInt(ss);
            $("#success input[id='gameName']").val(gameName);
            $("#success input[id='level']").val(level);
            $("#success input[id='score1']").val(score);
            $("#success input[id='score2']").val(higth_score);
            // alert($("#success input[id='score2']").val());

        }
    </script>


    <button class="try-again">Try again</button>
    <button class="go-home" >Go Home</button>
<%--    <button onclick="save()">保存得分</button>--%>
    <s:form action="saveScore" method="POST">
        <input type="hidden" id="gameName"  name="gameName" value="gameName"/>
        <input type="hidden" id="score1"  name="score" value="score"/>
        <input type="hidden" id="score2"  name="hight-score" value="hight-score"/>
        <input type="hidden" id="level"  name="level" value="level"/>
        <button class="go-home" onclick="save()">保存得分</button>
    </s:form>

</div><!--end of #success-->
<div id="failed">
    <p>很遗憾失败了</p>
    <button class="try-again">Try again</button>
    <button class="go-home">Go Home</button>
    <a id="share-qzone-failed" version="1.0" class="share-qzone qzOpenerDiv" href="#" target="_blank"></a>
</div><!--end of @failed-->
<div id="wrap">
    <aside id="time-wrap">
        <div id="time" class="animated my-animate" for="pulse">
        </div><!-- end of #time-->
        <div id="result" class="animated my-animate" for="tada">
            <img src="./images/store.png" />
        </div><!--end of #result-->
    </aside><!--end of #time-wrap-->
    <div id="canvas">
        <div>
            <table>
                <tbody>
                </tbody>
            </table>
        </div>
    </div><!-- end of #canvas -->
    <div id="wall-warp">
        <aside id="score-panel" class="animated my-animate" for="flash">
            <table>
                <tbody>
                <tr><td>总共</td><td>10对</td></tr>
                <tr><td>还剩</td><td>5对</td></tr>
                <tr><td>点击</td><td>10次</td></tr>
                <tr><td>失败</td><td>5次</td></tr>
                <tr><td>难度</td><td>1</td></tr>
                </tbody>
            </table>
        </aside><!-- end of #score-panel-->
        <aside id="help">
            <img src="./images/help.png" class="animated my-animate" for="bounceIn"/>
            <button id="go-home" title="回到首页" class="animated my-animate" for="wiggle"></button>
        </aside><!--end of #help-->
    </div><!--end of #wall-warp-->
</div><!-- end of #wrap -->
<script type="text/javascript" src="plugins/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript" src="./plugins/rotate3Di-master/rotate3Di.js"></script>
<script type="text/javascript" src="./plugins/assets/countdown/jquery.countdown.js"></script>
<script type="text/javascript" src="./plugins/yanSound/sound.js"></script>
<script type="text/javascript" src="./plugins/animate-custom/animate-custom.js"></script>

<script type="text/javascript" src="./plugins/jquery.yan.ui/jquery.yan.ui.3.0.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
<script type="text/javascript" src="js/model/canvasModel.js"></script>
<script type="text/javascript" src="js/model/imagesModel.js"></script>
<script src="js/model/storageModel.js"></script>

<!-- 分享组件js -->
<script src="js/share.js"></script>
<!-- 导入load js -->
<script src="js/loading.js"></script>
</body>
</html>
