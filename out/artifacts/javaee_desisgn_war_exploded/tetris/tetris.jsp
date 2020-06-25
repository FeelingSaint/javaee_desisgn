<%@ page import="DB.game_DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="info.Info" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>火拼俄罗斯</title>
<%--    <link rel="stylesheet" href="css/style.css" type="text/css">--%>

    <style type="text/css">

        .square{
            width: 400px;
            height: 600px;
            float: left;
        }
        .title{
            font-size: 30px;
            margin: 20px auto;
        }
        .game{
            width: 200px;
            height: 400px;
            background-color: #F2FAFF;
            border-left: 1px solid blue;
            border-right: 1px solid blue;
            border-bottom: 1px solid blue;
            position: relative;
            float: left;
        }

        .next{
            width: 80px;
            height: 80px;
            background-color: #F2FAFF;
            border: 1px solid blue;
            position: relative;
            float: left;
            margin-left: 20px;
        }

        .info{
            float: left;
            margin-left: 20px;
            margin-top: 10px;
        }

        .none,.current,.done{
            width: 20px;
            height: 20px;
            position: absolute;
            box-sizing: border-box;;
        }

        .none{
            background-color: #F2FAFF;
        }

        .current{
            background-color: pink;
            border: 1px solid red;
        }

        .done{
            background-color: gray;
            border: 1px solid black;
        }

        .gameover{
            position: absolute;
            left: 60px;
            top: 150px;
            color: red;
            font-size: 22px;
            /*display: none;*/
        }


    </style>
</head>
<body>
<a href="http://localhost:8080/javaee_desisgn_war_exploded/login_success/welcome.jsp"><button>返回</button></a>
<%
    String userName= Info.userName;
    String gameName="tetris";
    game_DB game_db=new game_DB();
    ResultSet rs =game_db.select(gameName);
    String score=0+"";
    if (rs.next()&&!userName.equals("")&&userName!=null){
        score=rs.getString("gameScore");
    }
    else
        score=0+"";
%>
<div>提示：请用方向键和F进行操作，上->旋转 F->坠落</div>
<div id="local" class="square" >
    <div class="title">我的游戏区域</div>
    <div class="game" id="local_game" ></div>
    <div class="next" id="local_next"></div>
<%--    <div class="info" id="info">--%>
    <br><br><br><br><br>
    已用时： <span id="local_time">0</span>s <br>
    已得分： <span id="local_score">0</span>分 <br>
    历史最高分： <span id="hight_score"><%=score%></span>分 <br>
        <div class="gameover" id="local_gameover"></div>
</div>

<div><input id="local_start" type="button" value="开始" /></div>
<div><input id="local_pause" type="button" value="暂停" /></div>
    <s:form action="saveScore" method="POST" class="square">
        <button onclick="save()" >保存得分</button>
        <input type="hidden" id="gameName"  name="gameName" value="<%=gameName%>"/>
        <input type="hidden" id="score1"  name="score" value="score"/>
        <input type="hidden" id="score2"  name="hight-score" value="<%=score%>"/>
        <input type="hidden" id="level"  name="level" value="level"/>
    </s:form>



<%--</s:form>--%>
<!-- <div class="square" id="remote">
    <div class="title">对方游戏区域</div>
    <div class="game" id="remote_game"></div>
    <div class="next" id="remote_next"></div>
    <div class="info">
        <div>已用时： <span id="remote_time">0</span>s</div>
        <div>已得分： <span id="remote_score">0</span>分</div>
        <div class="gameover" id="remote_gameover"></div>
    </div>
</div> -->
<script src="js/square.js" type="text/javascript"></script>
<script src="js/squareFactory.js" type="text/javascript"></script>
<script src="js/game.js" type="text/javascript"></script>
<script src="js/local.js" type="text/javascript"></script>
<script src="js/remote.js" type="text/javascript"></script>
<script src="js/script.js" type="text/javascript"></script>
<script>
    function save() {
        var gameName="tetris";
        var level="1";
        var score=document.getElementById("local").getElementsByTagName("span")[1].innerHTML;//$("#local span[id='local_score']").text();
        var higth_score=document.getElementById("local").getElementsByTagName("span")[2].innerHTML;//$("#local span[id='hight_score']").text();
        var gameName="FanYiXia";
        document.getElementById("score1").value=score;
    }
</script>

</body>
</html>
