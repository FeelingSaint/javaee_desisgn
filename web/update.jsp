<%@ page import="java.sql.ResultSet" %>
<%@ page import="DB.DB" %>
<%@ page import="info.Info" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/17
  Time: 00:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改数据</title>
</head>
<body>
        <%
            String name=Info.userName;
            DB db =new DB();
            ResultSet rs=db.select(" '"+ Info.userName+"'");
            rs.next();
            String password=rs.getString("password");
            String pro=rs.getString("place");
            String edu=rs.getString("edu");
            String phone=rs.getString("phone");
            String work=rs.getString("work");
            String email=rs.getString("email");
            String[] place=pro.split("-");

        %>
        <br><br><br>
    <s:form  action="updateInfo" enctype="multipart/form-data" onsubmit="return check()" >
        <table align="center">

            <tr>
                <td>用户名</td>
                <td><%=name%></td >
            </tr>
            <tr>
                <td>原密码</td>
                <td><%=password%></td>
            </tr>
            <tr>
                <td>新密码：</td>
                <td> <input name="password" id="password" value="<%=password%>" size="18" /></td>
                <td>
                    <span id="password_error" style="color: #e60923"></span>
                </td>

            </tr>


            <tr>
                <td>学历：</td>
                <td>
                    <input name="edu" id="edu" value="<%=edu%>" size="18" />
                </td>
                <td>
                    <span id="edu_error" style="color: #e60923"></span>
                </td>
            </tr>
            <tr>
                <td>职称：</td>
                <td>
                    <input name="work" id="work" value="<%=work%>" size="18" />
                </td>
                <td>
                    <span id="work_error" style="color: #e60923"></span>
                </td>
            </tr>
            <tr>
                <td>电话:</td>
                <td>
                    <input name="phone" id="phone" value="<%=phone%>" size="18" />
                </td>
                <td>
                    <span id="phone_error" style="color: #e60923"></span>
                </td>
            </tr>
            <tr>
                <td>
                    住址：
                </td>
                <td>
                        <%--                <s:textfield name="password2" label="住址" size="18" />--%>
                    <select id="province"  onchange="getCity(this)" name="province" >
                        <option><%=place[0]%></option>
                    </select>
                    <select name="city" id="city" onchange="getArea(this)" >
                        <option value=""><%=place[1]%></option>
                    </select>
                    <select name="area" id="area"  >
                        <option value="<%=place[2]%>"><%=place[2]%></option>
                    </select>

                    <span id="place_error" style="color: #e60923"></span>

                </td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <input name="email" id="email" value="<%=email%>" size="18" />
                </td>
                <td>
                    <span id="email_error" style="color: #e60923"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <s:file name="photo" label="头像" id="photo"/>
                </td>
                <td>
                    <span id="photo_error" style="color: #e60923"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交"/>
                    <input type="reset" value="清空"/>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="button" name="Submit" onclick="javascript:history.back(-1)" value="取消">
                </td>
            </tr>
        </table>
    </s:form>
        <script type="text/javascript" src="js/js/infos.js" ></script>
        <script type="text/javascript" src="js/js/PCA.js" ></script>
<%--        <script type="text/javascript" src="js/Y-M-D/YMD.js" ></script>--%>
        <script>
            window.onload=function(){
                getPro();
                var pro=document.getElementById("province").value=<%=place[0]%>;
                var city=document.getElementById("city").value=<%=place[1]%>;
                getArea(pro);
                getCity(city);
                // YYYYDD();
                // init();
            };
            function checkEdu(){
                if(document.getElementById("edu").value=="")
                {
                    document.getElementById("edu_error").innerHTML="学历不能为空";
                    return 1;
                }
                else{
                    document.getElementById("edu_error").innerHTML="";
                    return 0;
                }
            }
            function checkWork(){
                if(document.getElementById("work").value=="")
                {
                    document.getElementById("work_error").innerHTML="职称不能为空";
                    return 1;
                }
                else{
                    document.getElementById("work_error").innerHTML="";
                    return 0;
                }
            }
            function checkPhone(){
                if(document.getElementById("phone").value=="")
                {
                    document.getElementById("phone_error").innerHTML="电话不能为空";
                    return 1;
                }
                else{
                    document.getElementById("phone_error").innerHTML="";
                    return 0;
                }
            }

            function checkPassword(){
                 if(document.getElementById("password").value==""){
                    document.getElementById("password_error").innerHTML="密码不能为空";
                    return 1;
                }
                else{
                    document.getElementById("password_error").innerHTML="";
                    return 0;
                }
            }
            function checkEmail() {
                var accemail = document.getElementById("email");    //获取email控件对象
                if (!accemail.value == "") {
                    var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

                    var bool = reg.test(accemail.value);

                    if (bool == false) {
                        document.getElementById("email_error").innerHTML="邮箱格式不正确";
                        accemail.focus();
                        return 1;
                    }
                    else{
                        document.getElementById("email_error").innerHTML="";
                        return 0;
                    }
                }
                else {
                    document.getElementById("email_error").innerHTML="邮箱不能为空";
                    return 1;


                }
            }
            function checkPhoto(){
                var fileInput = document.getElementById("photo").value;
                // alert(fileInput);
                if(fileInput){
                    document.getElementById("photo_error").innerHTML="";
                    return 0;
                }else{
                    document.getElementById("photo_error").innerHTML="头像不能为空";
                    return 1;
                }
            }
            function checkPlace() {
                if(document.getElementById("area").value==""||document.getElementById("area").value=="请选择区县")
                {
                    document.getElementById("place_error").innerHTML="住址不能为空";
                    return 1;
                }
                else{
                    document.getElementById("place_error").innerHTML="";
                    return 0;
                }
            }
            function check() {
                var value=checkEmail()+checkPassword()+checkEdu()+checkPhone()+checkWork()+checkPhoto()+checkPlace();
                if(value>0){
                    alert("输入的信息有误！");
                    // alert(value);
                    return false;
                }
                else
                    return true;

            }

        </script>

</body>
</html>
