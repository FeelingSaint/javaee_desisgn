<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <meta charset="UTF-8">
    <title>用户注册</title>
</head>
<body>
<br><br><br>



<!--    <br><br><br><br><br><br>-->


<s:form action="register"  enctype="multipart/form-data" onsubmit="return check()">
<table  border="0" align="center" >
    <tr>
        <td>
            <s:textfield name="userName" label="登录名字" id="userName" size="18" />
        </td>
        <td>
            <span id="userName_error" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            <s:password name="password1" id="password1" label="登录密码" size="18" />
        </td>
    </tr>
    <tr>
        <td>
            <s:password name="password2" id="password2"  label="再次输入密码" size="18" onblur="checkPassword()"/>
        </td>
        <td>
            <span id="warning" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            <s:textfield name="name" label="真实姓名" id="name" size="18" />
        </td>
        <td>
            <span id="name_error" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            性别:
        </td>
        <td>
            <select name="sex" size="1">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>
            出生日期：
        </td>
        <td>
            <select id="YYYY" name="YYYY" onchange="MMDD(this)">
                <option value="">请选择 年</option>
            </select>
            <select id="MM" name="MM" onchange="getDD(this)">
                <option value="">请选择 月</option>
            </select>
            <select id="DD" name="DD">
                <option value="">请选择 日</option>
            </select>
            <span id="birth_error" style="color: #e60923"></span>
        </td>


    </tr>
    <tr>
        <td>
            <s:textfield name="nation" label="民族" id="nation" size="18" />
        </td>
        <td>
            <span id="nation_error" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            <s:textfield name="edu" label="学历" id="edu" size="18" />
        </td>
        <td>
            <span id="edu_error" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            <s:textfield name="work" label="职称" id="work" size="18" />
        </td>
        <td>
            <span id="work_error" style="color: #e60923"></span>
        </td>
    </tr>
    <tr>
        <td>
            <s:textfield name="phone" label="电话" id="phone" size="18" />
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
                <option>请选择省份</option>
            </select>
            <select name="city" id="city" onchange="getArea(this)" >
                <option value="">请选择城市</option>
            </select>
            <select name="area" id="area"  >
                <option value="">请选择区县</option>
            </select>
                <span id="place_error" style="color: #e60923"></span>
        </td>

    </tr>
    <tr>
        <td>
            <s:textfield name="email" id="email" label="邮箱" size="18" onblur="checkEmail()"/>
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
            <input type="submit"  value="提交"/>
            <input type="reset" value="清空"/>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input type="button" name="Submit" onclick="javascript:history.back(-1)" value="返回">
        </td>
    </tr>
</table>
</s:form>
<script type="text/javascript" src="js/js/infos.js" ></script>
<script type="text/javascript" src="js/js/PCA.js" ></script>
<script type="text/javascript" src="js/Y-M-D/YMD.js" ></script>

<script>
    window.onload=function(){
        getPro();
        YYYYDD();
    };

    function checkUserName(){
        if(document.getElementById("userName").value=="")
        {
            document.getElementById("userName_error").innerHTML="用户名不能为空";
            return 1;
        }
        else{
            document.getElementById("userName_error").innerHTML="";
            return 0;
        }
    }
    function checkName(){
        if(document.getElementById("name").value=="")
        {
            document.getElementById("name_error").innerHTML="真实性名不能为空";
            return 1;
        }
        else{
            document.getElementById("name_error").innerHTML="";
            return 0;
        }
    }
    function checkNation() {
        if(document.getElementById("nation").value=="")
        {
            document.getElementById("nation_error").innerHTML="民族不能为空";
            return 1;
        }
        else{
            document.getElementById("nation_error").innerHTML="";
            return 0;
        }
    }
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
        if(document.getElementById("password1").value!=
            document.getElementById("password2").value)
        {
            document.getElementById("warning").innerHTML="两次密码的输入不一致";
            return 1;
        }else if(document.getElementById("password1").value==""&&
        document.getElementById("password2").value==""){

            document.getElementById("warning").innerHTML="密码不能为空";
            return 1;
        }

        else{
            document.getElementById("warning").innerHTML="";
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
    function checkBirthDay() {
        if(document.getElementById("DD").value==""||document.getElementById("DD").value=="请选择 日")
        {
            document.getElementById("birth_error").innerHTML="出生日期不能为空";
            return 1;
        }
        else{
            document.getElementById("birth_error").innerHTML="";
            return 0;
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
        var value=checkUserName()+checkEmail()+checkPassword()+checkName()+checkEdu()+checkNation()+checkPhone()+checkWork()+checkPhoto()+checkBirthDay()+checkPlace();
        if(value>0){
            alert("输入的信息有误！");
            // alert(value);
            return false;
        }
        else
            return true;

    }

</script>
<br><br><br><br><br><br><br>
<center style="color: #e60923">性别、出生日期、真实姓名提交后无法更改，请谨慎填选</center>
</body>
</html>