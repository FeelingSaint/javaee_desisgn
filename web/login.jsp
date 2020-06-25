<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/09/19
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
</head>
<body>

<br><br><br>
    <s:form  method="post" action="login">
        <table align="center">

            <tr>
                <td><s:textfield name="userName" label="登录名" size="18" /></td>
            </tr>

            <tr>
                <td><s:password name="password" label="登录密码" size="18" /></td>
            </tr>

            <tr>
                <td>
                    <s:submit value="登录" />
                </td>
            </tr>
        </table>
    </s:form>
<center><a href="register.jsp" >没有账号，现在去注册</a></center>

</body>
</html>
