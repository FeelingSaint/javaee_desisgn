package actioin;

import DB.DB;
import com.opensymphony.xwork2.ActionSupport;
import info.Info;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.SQLException;

public class updateAction extends ActionSupport {

    private String userName=null;
    private String password=null;
    private String name=null;
    private String sex=null;
    private String birth=null;
    private String nation=null;
    private String edu=null;
    private String work=null;
    private String phone=null;
    private String place=null;
    private String email=null;
    private String province=null;
    private String city=null;
    private String area=null;
    private String message_register = "error";
    private HttpServletRequest request  = ServletActionContext.getRequest();
    private static final long serialVersionUID = 1L;
    //表单提供的属性
    private File photo;
    //struts2在文件上传时提供的属性
    private String photoFileName;//上传的文件名(上传的字段名+fileName)
    private String photoContentType;//上传文件的MIME类型(上传的字段名+contentType)
    public String updateAction() throws SQLException {

        password=request.getParameter("password");
        edu=request.getParameter("edu");
        work=request.getParameter("work");
        email=request.getParameter("email");
        phone=request.getParameter("phone");
        place=request.getParameter("province")+"-"+request.getParameter("city")+"-"+request.getParameter("area");
        DB db = new DB();
        ServletContext application= ServletActionContext.getServletContext();
        //String filePath=application.getRealPath("/WEB-INF/files");
        //2、调用realPath方法，获取一个虚拟目录而得到一个真实的目录
        String filePath=application.getRealPath("/files");
        File file=new File(filePath);
        //3、如果真实目录不存在则创建
        if(!file.exists()){
            file.mkdirs();
        }
        String[]data=new String[7];
        data[0]= password;
        data[1]= edu;
        data[2]= work;
        data[3]= phone;
        data[4]= place;
        data[5]= email;
        if (photo!=null){
            photo.renameTo(new File(file,photoFileName));
            data[6]="http://localhost:8080/javaee_desisgn_war_exploded/files/"+photoFileName;
        }
        else
            data[6]="";
        db.update(Info.userName,data);


        return "success";
    }


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEdu() {
        return edu;
    }

    public void setEdu(String edu) {
        this.edu = edu;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public File getPhoto() {
        return photo;
    }

    public void setPhoto(File photo) {
        this.photo = photo;
    }

    public String getPhotoFileName() {
        return photoFileName;
    }

    public void setPhotoFileName(String photoFileName) {
        this.photoFileName = photoFileName;
    }

    public String getPhotoContentType() {
        return photoContentType;
    }

    public void setPhotoContentType(String photoContentType) {
        this.photoContentType = photoContentType;
    }
}
