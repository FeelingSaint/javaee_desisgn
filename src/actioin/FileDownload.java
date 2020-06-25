package actioin;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class FileDownload extends ActionSupport {

    //读取下载文件的目录
    private String inputPath;
    //下载文件的文件名
    private String fileName;
    //读取下载文件的输入流
    private InputStream inputStream;
    //下载文件的类型
    private String conetntType;

    @Override
    public String execute() throws Exception {

        return SUCCESS;
    }

    //创建InputStream输入流
    public InputStream getInputStream() throws FileNotFoundException, FileNotFoundException {
        String path = ServletActionContext.getServletContext().getRealPath(inputPath);
        return new BufferedInputStream(new FileInputStream(path + "\\" + fileName));
    }

    public void setInputPath(String inputPath) {
    }
}