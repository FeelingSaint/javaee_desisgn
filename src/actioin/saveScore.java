package actioin;

import DB.game_DB;
import com.opensymphony.xwork2.ActionSupport;
import info.Info;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.sql.ResultSet;
import java.sql.SQLException;

public class saveScore extends ActionSupport {
    private String gameName;
    private int score;
    private int hight_score;
    private HttpServletRequest request  = ServletActionContext.getRequest();

    public String saveScore() throws SQLException {


        score=Integer.valueOf(get_StringNum(request.getParameter("score")));
        hight_score=Integer.valueOf(get_StringNum(request.getParameter("hight-score")));
        if (request.getParameter("level")==null||request.getParameter("level").equals("")||request.getParameter("level").equals("level"))
            gameName=request.getParameter("gameName");
        else
            gameName=request.getParameter("gameName")+"-难度"+get_StringNum(request.getParameter("level"));



        if(score>hight_score)
            hight_score=score;
        System.out.println(hight_score+gameName);
        game_DB game_db=new game_DB();
        ResultSet rs =game_db.select(gameName);
        if (Info.userName.equals("")||Info.userName==null)
            return "未登录不能保存！";
        if (!rs.next()) {
            game_db.insertALL(gameName,String.valueOf(hight_score));
        }
        else
            game_db.Update(gameName,String.valueOf(hight_score));

        return request.getParameter("gameName");
    }
    private String get_StringNum(String str){

        str=str.trim();
        String str2="";
        if(str != null && !"".equals(str)){
            for(int i=0;i<str.length();i++){
                if(str.charAt(i)>=48 && str.charAt(i)<=57){
                    str2+=str.charAt(i);
                }
            }

        }
        return str2;
    }

}
