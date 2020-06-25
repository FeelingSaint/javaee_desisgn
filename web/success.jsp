<%@ page import="java.sql.SQLException" %>
<%@ page import="DB.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="info.Info" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/09/19
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功页面</title>
</head>
<body>
您的登录名为：<%=Info.userName%>，登录成功！
<br/>

<form name="form_success" method="post" action="select.jsp" >
    <table align="right">
        <tr>
            <td><input type="text" name="select" ></td>
            <td> <input type="submit" value="查询"></td>
        </tr>
    </table>
</form>

<table width="700" border="1" align="center">
    <tr>
        <td>用户名
        </td>
        <td>密码
        </td >
        <td align="center" colspan="2">
            操作
        </td>
    </tr>

    <%


        DB db =new DB();

        String name=request.getParameter("name");
        String name1=request.getParameter("name1");
        String password=request.getParameter("password");

        if((name!=null||name!="")&&(password==null||password=="")){
            db.delete("'"+name+"'");
        }
        if((name!=null||name!="")&&(password!=null||password!=""))
            db.update("'"+name1+"'","'"+password+"'");

//            db.update("'"+name+"'","'"+password+"'");
        ResultSet rs=db.getResultSet();

        try {
            while(rs.next()!=false) {





//                out.println(rs.getString("id")+"\t"+rs.getString("name")+"\t"+rs.getString("age"));
    %>

    <tr>
        <td><%=rs.getString("name")%>
        </td>
        <td><%=rs.getString("password")%>
        </td>
        <td>
            <a href="success.jsp?name=<%=rs.getString("name")%>">删除</a>
        </td>
        <td>
            <a href="update.jsp?name=<%=rs.getString("name")%>&password=<%=rs.getString("password")%>">修改密码</a>

        </td>
    </tr>

    <%



            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    %>
</table>

<button type="submit">
    <hr>

<%--欢迎<%=request.getParameter("name")%>访问本网站--%>
<%--<a href="test.jsp">--%>
<%--    <button>做题</button>--%>
<%--</a>--%>

</body>
</html>
