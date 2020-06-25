<%@ page import="DB.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="info.Info" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>通讯录管理</title>
</head>
<body>
 尊敬的<%=Info.userName%>,您的通讯录如下：
<table  border="1" align="center">
    <tr>
        <td>好友名称
        </td >
        <td>好友电话
        </td>
        <td>好友邮箱
        </td >
        <td>好友工作单位
        </td>
        <td>好友住址
        </td >
        <td>好友QQ
        </td>

<%--        <td align="center" colspan="2">--%>
<%--            操作--%>
<%--        </td>--%>
    </tr>

    <%


        DB db =new DB();

        String name=request.getParameter("name");
        String name1=request.getParameter("name1");
        String password=request.getParameter("password");

//        if((name!=null||name!="")&&(password==null||password=="")){
//        db.delete("'"+name+"'");
//    }
//        if((name!=null||name!="")&&(password!=null||password!=""))
//            db.update("'"+name1+"'","'"+password+"'");

//            db.update("'"+name+"'","'"+password+"'");
        ResultSet rs=db.select( Info.userName,"friends");

        try {
            while(rs.next()!=false) {



//                out.println(rs.getString("id")+"\t"+rs.getString("name")+"\t"+rs.getString("age"));
    %>

    <tr>

        <td><%=rs.getString("name")%>
        </td>
        <td><%=rs.getString("phone")%>
        </td>
        <td><%=rs.getString("email")%>
        </td>
        <td><%=rs.getString("workplace")%>
        </td>
        <td><%=rs.getString("place")%>
        </td>
        <td><%=rs.getString("QQ")%>
        </td>

<%--        <td>--%>
<%--            <a href="update.jsp?name=<%=rs.getString("name")%>&password=<%=rs.getString("password")%>">修改密码</a>--%>

<%--        </td>--%>
<%--        <td>--%>
<%--            <a href="update.jsp?name=<%=rs.getString("name")%>&password=<%=rs.getString("password")%>">修改密码</a>--%>

<%--        </td>--%>
    </tr>

    <%

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
