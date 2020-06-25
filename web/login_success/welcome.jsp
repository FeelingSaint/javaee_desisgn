<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/04
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="info.Info" %>
<html>
<head>
    <title>鲜烁小游戏</title>
</head>
<body>
    <h1 align="center" >欢迎来到鲜烁小游戏</h1>
<table align="center" cellpadding="5px">
    <tr>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/fan1xia/FanYiXia.jsp"> 翻一下小游戏</a></td>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/tetris/tetris.jsp" >火拼俄罗斯</a></td>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/DaFeiJi/js/DaFeiJi.jsp" >打飞机</a></td>
        <%
            String authority=Info.authority;
            if(authority.equals("2")){
        %>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/login_success/admin.jsp"> 查看所有用户信息</a></td>
        <%
            }else{
        %>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/info.jsp"> 查看个人信息</a></td>
        <%
            }
        %>
        <td><a href="http://localhost:8080/javaee_desisgn_war_exploded/login.jsp" >退出</a></td>
        <td>欢迎<%=Info.userName%>使用本系统</td>
    </tr>

</table>
</body>
</html>
