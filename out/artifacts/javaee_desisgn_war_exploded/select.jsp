<%@ page import="DB.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/17
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询结果</title>
</head>
<body>
<table width="700" border="1" align="center">

    <tr>
        <td>用户名
        </td>
        <td>密码

    </tr>

<%


    request.setCharacterEncoding("UTF-8");
    String select_sql=request.getParameter("select");
    out.println("查询"+select_sql+"的结果如下：");
    DB db =new DB();
    ResultSet resultSet=db.select("%"+select_sql+"%","user");
    try {
        while(resultSet.next()) {





//                out.println(rs.getString("id")+"\t"+rs.getString("name")+"\t"+rs.getString("age"));
%>

<tr>
    <td><%=resultSet.getString("name")%>
    </td>
    <td><%=resultSet.getString("password")%>
    </td>
</tr>


<%



        }
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
%>


    <tr >
        <td colspan="2"> <input type="button" name="Submit" onclick="javascript:history.back(-1)" value="返回"></td>
    </tr>

</table>


</body>
</html>
