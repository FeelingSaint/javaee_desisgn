package actioin;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import java.io.File;

public class FileUpload extends ActionSupport {
    private static final long serialVersionUID = 1L;
    //表单提供的属性
    private String userName;
    private File photo;
    //struts2在文件上传时提供的属性
    private String photoFileName;//上传的文件名(上传的字段名+fileName)
    private String photoContentType;//上传文件的MIME类型(上传的字段名+contentType)
    private File upload;
    private String uploadFileName;
    public String upload(){
        //1、拿到servletContext
        ServletContext application= ServletActionContext.getServletContext();
        //String filePath=application.getRealPath("/WEB-INF/files");
        //2、调用realPath方法，获取一个虚拟目录而得到一个真实的目录
        String filePath=application.getRealPath("/files");
        File file=new File(filePath);
        //3、如果真实目录不存在则创建
        if(!file.exists()){
            file.mkdirs();
        }
        //4、把photo存过去
        photo.renameTo(new File(file,photoFileName));
//        upload.renameTo(new File(file,uploadFileName));
        return "success";
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
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

    public void setUpload(File upload) {
        this.upload=upload;
    }
}