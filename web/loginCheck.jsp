<%@ page import="DB.DB" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/09/19
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据处理界面</title>
</head>
<script type="text/javascript" language="javascript">
    function xAlert(str)
    {
        alert(str);

    }
</script>

<body>

    <%
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        String password=request.getParameter("password");

        DB db =new DB();

        ResultSet resultSet =db.select("'"+name+"'");
        if (!resultSet.next()){

            %>


    <script type="text/javascript" language="javascript">
        alert("用户不存在");
        window.document.location.href="login.jsp";
    </script>
    <%
        }
        else if (name.equals(resultSet.getString("name"))&&password.equals(resultSet.getString("password"))){



    %>
    <jsp:forward page="success.jsp">
        <jsp:param name="user" value="<%=name%>"/>
    </jsp:forward>
    <%
        }else{


    %>
    <script type="text/javascript" language="javascript">
        alert("密码错误");
        window.document.location.href="login.jsp";
    </script>


    <%

        }
    %>
</body>
</html>
