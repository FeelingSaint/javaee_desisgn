<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/04
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人文件管理系统</title>
</head>
<body>
<s:actionerror/>
<s:form action="actionster" enctype="multipart/form-data">
<%--    <s:textfield name="userName" label="用户名"/>--%>
    <s:file name="photo" label="照片"/>
<%--    <s:file name="upload"></s:file>--%>
    <s:submit value="上传"/>
</s:form>
</body>
</html>
