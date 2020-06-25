package actioin;

import DB.DB;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import info.Book;
import info.Info;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BookAction extends ActionSupport {
    private Book book;
    private Map<String, Object> session= ActionContext.getContext().getSession();;
    private DB db=new DB();
    private Statement stmt;
    private HttpServletRequest request  = ServletActionContext.getRequest();
    public BookAction() throws SQLException {
    }


    public String select() throws SQLException {
        //查询图书
        ResultSet rs=db.selectAll("book");
        List<Book> list=new ArrayList<>();
        while(rs.next()){
            Book book=new Book();
            book.setSurplus(rs.getString("surplus"));
            book.setBookname(rs.getString("name"));
            book.setAuthor(rs.getString("author"));
            book.setId(rs.getString("id"));
            book.setPress(rs.getString("press"));
            list.add(book);
        }

        Info.bookList=list;
        session.put("MyBook",list);
        return "success";
    }

    public String tests(){

        System.out.println(request.getParameter("gameName")+request.getParameter("level")+request.getParameter("score")+request.getParameter("hight-score"));
        return "success";
    }



}
