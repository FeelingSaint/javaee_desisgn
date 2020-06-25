<%@ page import="DB.DB" %>
<%@ page import="DB.game_DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="info.Info" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/20
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有用户信息</title>
</head>
<body>
<a href="http://localhost:8080/javaee_desisgn_war_exploded/login_success/welcome.jsp"><button>返回</button></a>
<br>
<form name="form_success" id="form_success" method="post" action="http://localhost:8080/javaee_desisgn_war_exploded/login_success/admin.jsp" >
    <table align="right">
        <tr>
            <td><input type="text" name="select" ></td>
            <td><input type="submit" value="查询"></td>
            <input type="hidden" id="用户名" name="用户名"/>
            <input type="hidden" id="权限" name="权限"/>
        </tr>
    </table>
</form>
<br>
<table  border="01"  align="center" >
    <tr>
        <td>
            头像
        </td>
        <td>登录名
        </td>
        <td>密码
        </td >
        <td>真实姓名
        </td>
        <td>性别
        </td >
        <td>出生日期
        </td>
        <td>民族
        </td >
        <td>学历
        </td>
        <td>职称
        </td >
        <td>电话
        </td>
        <td>住址
        </td >
        <td>邮箱
        </td>
        <td>
            用户状态
        </td>
        <td align="center" colspan="2">
            操作
        </td>
    </tr>

    <%
        DB db =new DB();

        String name=request.getParameter("用户名");
        String aut=request.getParameter("权限");
        String select_sql=request.getParameter("select");
        if (name!=null&&aut!=null&&!name.equals("")&&!aut.equals(""))
            db.update(name,Integer.valueOf(aut));


//        if((name!=null||name!="")&&(password==null||password=="")){
//        db.delete("'"+name+"'");
//    }
//        if((name!=null||name!="")&&(password!=null||password!=""))
//            db.update("'"+name1+"'","'"+password+"'");

//            db.update("'"+name+"'","'"+password+"'");
        ResultSet rs;
        ResultSet game_rs = null;
        if (Info.authority.equals("2"))
            if (select_sql!=null)
                rs=db.select("%"+select_sql+"%","user");
            else
                rs=db.selectAll("user");
        else
            rs=db.select(" '"+Info.userName+"'");

        String image = null;
        String authority=null;
        try {
            while(rs.next()!=false) {
                image=rs.getString("image");
                authority=rs.getString("authority");


//                out.println(rs.getString("id")+"\t"+rs.getString("name")+"\t"+rs.getString("age"));
    %>

    <tr>

        <td><img src="<%=image%>" alt="没有上传头像" height="120" width="120"></td>
        <td><%=rs.getString("userName")%>
        </td>
        <td><%=rs.getString("password")%>
        </td>
        <td><%=rs.getString("name")%>
        </td>
        <td><%=rs.getString("sex")%>
        </td>
        <td><%=rs.getString("birth")%>
        </td>
        <td><%=rs.getString("nation")%>
        </td>
        <td><%=rs.getString("edu")%>
        </td>
        <td><%=rs.getString("work")%>
        </td>
        <td><%=rs.getString("phone")%>
        </td>
        <td><%=rs.getString("place")%>
        </td>
        <td><%=rs.getString("email")%>
        </td>

        
        <%
            if (authority.equals("-1")){%>
        <td>冻结</td>
        <td>
            <button type="button" onclick="unfreeze(this)" value="<%=rs.getString("userName")%>">解冻</button>
        </td>
        <%
            }else{
        %>
        <td>正常</td>
        <td>
            <button type="button" onclick="freeze(this)" value="<%=rs.getString("userName")%>">冻结</button>
        </td>
        <%
            }
        %>
    </tr>
    <%

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    %>

</table>
<table  border="1"  align="center">

    <tr>
        <td>玩过的游戏</td>
        <td>最高分</td>
    </tr>
    <%
        game_DB gdb =new game_DB();
        try {
            game_rs=gdb.selectAll("gamescore");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        while(game_rs!=null&&game_rs.next()!=false) {

            //                out.println(rs.getString("id")+"\t"+rs.getString("name")+"\t"+rs.getString("age"));
    %>
    <tr>
        <td><%=game_rs.getString("gameName")%></td>
        <td><%=game_rs.getString("gameScore")%></td>
    </tr>

    <%
        }
    %>
</table>
<script>
    
    function freeze(t) {
        document.getElementById("用户名").value=t.value;
        document.getElementById("权限").value=-1;
        document.getElementById("form_success").submit();
        // alert(document.getElementById("用户名").value);
        // location.reload();
    }
    function unfreeze(t) {
        document.getElementById("用户名").value=t.value;
        document.getElementById("权限").value=0;
        document.getElementById("form_success").submit();
        // alert(document.getElementById("用户名").value);
        // location.reload(false)
    }
</script>
</body>
</html>
