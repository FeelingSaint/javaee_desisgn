<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.game_DB" %>
<%@ page import="info.Info" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/22
  Time: 08:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>飞机大作战</title>
    <meta http-equiv="content" content="text/html" charset="utf-8"/>
<%--    <link rel="stylesheet" type="text/css" href="../css/main.css"/>--%>
    <style type="text/css">

        *{
            margin: 0;
            padding: 0;
        }
        #contentdiv{
            position: absolute;
            left: 500px;
        }
        #startdiv{
            width: 320px;
            height: 568px;
            background-image: url(../image/开始背景.png);
        }
        button{
            outline: none;
        }
        #startdiv button{
            position: absolute;
            top: 500px;
            left: 82px;
            width: 150px;
            height: 30px;
            border: 1px solid black;
            border-radius: 30px;
            background-color: #c4c9ca;
        }
        #maindiv{
            width: 320px;
            height: 568px;
            background-image:url(../image/background_1.png) ;
            display: none;
        }
        #maindiv img{
            position: absolute;
            z-index: 1;
        }
        #scorediv{
            font-size: 16px;
            font-weight: bold;
            position: absolute;
            top: 10px;
            left: 10px;
            display: none;
        }
        #scorediv{
            font-size: 18px;
            font-weight: bold;
        }
        #suspenddiv{
            position: absolute;
            top: 210px;
            left: 82px;
            display: none;
            z-index: 2;
        }
        #suspenddiv button{
            width: 150px;
            height: 30px;
            margin-bottom: 20px;
            border: 1px solid black;
            border-radius: 30px;
            background-color: #c4c9ca;
        }
        #enddiv{
            position: absolute;
            top: 210px;
            left: 75px;
            border: 1px solid gray;
            border-radius: 5px;
            text-align: center;
            background-color:#d7ddde;
            display: none;
            z-index: 2;
        }
        .plantext{
            width: 160px;
            height: 30px;
            line-height: 30px;
            font-size: 16px;
            font-weight: bold;
        }
        #planscore{
            width: 160px;
            height: 80px;
            line-height: 80px;
            border-top: 1px solid gray;
            border-bottom: 1px solid gray;
            font-size: 16px;
            font-weight: bold;
        }
        #enddiv div{
            width: 160px;
            height: 50px;
        }
        #enddiv div button{
            margin-top:10px ;
            width: 90px;
            height: 30px;
            border: 1px solid gray;
            border-radius: 30px;
        }

    </style>
</head>
<body>
<a href="http://localhost:8080/javaee_desisgn_war_exploded/login_success/welcome.jsp"><button>返回</button></a>
<%
    String userName= Info.userName;
    String gameName="DaFeiJi";
    game_DB game_db=new game_DB();
    ResultSet rs =game_db.select(gameName);
    String score=0+"";
    if (rs.next()&&!userName.equals("")&&userName!=null){
        score=rs.getString("gameScore");
    }
    else
        score=0+"";
%>
<div id="contentdiv">
    <div id="startdiv">
        <button onclick="begin()">开始游戏</button>
    </div>
    <div id="maindiv">
        <div id="scorediv">
            <label>分数：</label>
            <label id="label">0</label>
            <label>历史最高分：<%=score%></label>
        </div>
        <div id="suspenddiv">
            <button>继续</button><br/>
            <button>重新开始</button><br/>
            <button>回到主页</button>
        </div>
        <div id="enddiv">
            <p class="plantext">飞机大战分数</p>
            <p>分数：</p><p id="planscore">0</p>
            <p>击毁敌机：</p><p id="hitcount">0</p>
            <s:form action="saveScore" method="POST">
                <input type="hidden" id="gameName"  name="gameName" value="<%=gameName%>"/>
                <input type="hidden" id="score1"  name="score" value="score"/>
                <input type="hidden" id="score2"  name="hight-score" value="<%=score%>"/>
                <input type="hidden" id="level"  name="level" value="level"/>
                <button onclick="save()">继续</button>
            </s:form>
        </div>
    </div>
</div>
<script>
    window.onload=function () {
        window.onkeypress=function (e) {
// alert(e.key)//弹出按键对应的字母
// alert(e.keyCode)
            if (e.charCode==103){
                ClearScreen();
            }
        }
    }
        function save() {
            var gameName="DaFeiJi";
            var level="1";
            var score=document.getElementById("maindiv").getElementsByTagName("label")[1].innerHTML;//$("#local span[id='local_score']").text();
            // var higth_score=document.getElementById("local").getElementsByTagName("span")[2].innerHTML;//$("#local span[id='hight_score']").text();
            // $("input[id='score1']").val(score);
            document.getElementById("score1").value=score;
            // alert(score)
        }

</script>
<script type="text/javascript" src="aircraft.js"></script>
<script type="text/javascript" src="enemyAircraft.js"></script>
<script type="text/javascript" src="totalScore.js"></script>
<script type="text/javascript" src="selfAircraft.js"></script>
<script type="text/javascript" src="bullet.js"></script>
<script type="text/javascript" src="controller.js"></script>
</body>
</html>
<%--<li id="storage_cluster_failover_manual_control_action" class="act_off" data-topic="storage_cluster_failover_manual_control_action" data-click-function="" data-max_chk="1" data-min_chk="1" permit_act="true" onselectstart="return false;">--%>
<%--    <img class="act_icon" src="/images/blank.png?1415607937" alt="Blank">--%>
<%--    <span class="">Failover</span>--%>