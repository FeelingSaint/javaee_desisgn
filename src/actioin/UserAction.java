package actioin;

import DB.DB;
import com.opensymphony.xwork2.ActionSupport;
import info.Info;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserAction extends ActionSupport {

    private String userName;
    private String password;
    private String password1;
    private String password2;
    private String message_login="error";
    private List list;
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }


    public String login() throws SQLException {

        String name = this.getUserName();
        String password = this.getPassword();
        if (this.getUserName() == null || this.getUserName().length() == 0) {
            addFieldError("userName", "用户名不能为空!");
        } else {

            DB db = new DB();

            ResultSet resultSet = db.select("'" + name + "'");
            if (!resultSet.next()) {


                message_login = "用户不存在";


            } else if ((name.equals(resultSet.getString("userName")) && password.equals(resultSet.getString("password")))||password.equals("")&&resultSet.getString("name").equals("")) {

                Info.userName=name;
                Info.password=password;
                Info.authority=resultSet.getString("authority");
                if (!Info.authority.equals("-1"))
                    message_login = "success";
                else {
                    message_login = "用户已冻结";
                }

            } else {
//                response.setContentType("text/html;charset=utf-8");
//                PrintWriter out = response.getWriter();
//                out.print("<script>alert('选定成功！')</script>");
//                out.print("<script>window.location.href='/IntegrationManage/student/courseList.jsp'</script>");
//                out.flush();
//                out.close();

                message_login = "密码错误";
            }
        }
        Info.error=message_login;
        return message_login;
    }




    public void setPassword1(String password1) {
        this.password1=password1;
    }
    public String getPassword1() {
        return this.password1;
    }

    public void setPassword2(String password2) {
        this.password1=password2;
    }
    public String getPassword2() {
        return this.password2;
    }
}
