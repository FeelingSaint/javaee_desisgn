<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/09/17
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.lang.String"%>
<%@page import="DB.DB"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="info.Info" %>

<html>
<head>
    <title>注册成功</title>

</head>
<body>
    <%

    request.setCharacterEncoding("UTF-8");
//    设置支持中文字符的字符集
    String name = Info.userName;
//    request.getParameter("name");
//    name=new String(name.getBytes("ISO-8859-1"),"GBK");
    String pwd = Info.password;
//    request.getParameter("pwd");
    String[] channels = request.getParameterValues("channel");
%>

<h1 align="center">恭喜<%=name%>注册成功！</h1>


<%--你输入的注册信息：<br><br><br>--%>
<%--<table border="1" align="center">--%>
<%--    <tr>--%>
<%--        <td>用户名：</td>--%>
<%--        <td><%=name%>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>密码：</td>--%>
<%--        <td><%=pwd%>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--&lt;%&ndash;    <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td>爱好：</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;%>--%>
<%--&lt;%&ndash;            if (channels != null) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                for (int i = 0; i < channels.length; i++) {&ndash;%&gt;--%>
<%--&lt;%&ndash;        %>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <td><%=channels[i]%>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        &lt;%&ndash;%>--%>
<%--&lt;%&ndash;//                     out.println(channels[i]);&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;        %>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </tr>&ndash;%&gt;--%>
<%--</table>--%>
<center>

    <a href="login.jsp">
    <button>去登录</button>
    </a>

</center>
</html>
