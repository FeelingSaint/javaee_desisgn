<%@ page import="info.Info" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/07
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录或者注册失败</title>
</head>
<body>
<center>
    <h1><%=Info.error%></h1>
<input type="button" name="Submit" onclick="javascript:history.back(-1)" value="返回">
</center>
</body>
</html>
