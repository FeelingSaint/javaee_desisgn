package DB;

import info.Info;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class game_DB extends DB {

    private static String delSql="delete from gamescore where name = ";
    private static String sql_select_ALL="select * from gamescore";
    private static String sql_select1="select * from gamescore where `userName` =";
    private static String sql_select2="AND `gameName` = ";
    private static String sql_insert=" insert into `gamescore` (`NAME`,`PASSWORD`) VALUES";
    private static String sql_insertALL=" insert into `gamescore`  VALUES ";
    private static String updateSql1="update `gamescore`  set `gameScore` = ";
    private static String updateSql2="where `userName` = '";
    private static String updateSql3="' AND `gameName` = ";
    private static String userName= Info.userName;
    private static Connection conn=null;
    private static Statement stmt=null;
    private static ResultSet rs=null;
    public game_DB() throws SQLException {
        super();
        stmt=getStmt();
        userName= Info.userName;
    }

    public Statement getStmt()
    {
        return super.getStmt();
    }

    public ResultSet select(String gameName) throws SQLException {

//        System.out.println("select * from `user` WHERE `name` LIKE "+name);
        ResultSet rs1=stmt.executeQuery(sql_select1+"'"+userName+"'"+sql_select2+"'"+gameName+"'");
        return rs1;
    }
    public String insertALL(String gameName,String score){

        try {
            stmt.executeUpdate(sql_insertALL+"('"+userName+"',"+"'"+gameName+"','"+score+"')");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "success";
    }
    public String Update(String gameName,String score)  {

        try {
            stmt.executeUpdate(updateSql1+"'"+score+"' "+updateSql2+userName+updateSql3+"'"+gameName+"'");

        } catch (SQLException e) {
            e.printStackTrace();
            return "error";
        }

        return "success";
    }
    public ResultSet selectAll(String TableName) throws SQLException {

        ResultSet rs1=null;
//        System.out.println("select * from `user` WHERE `name` LIKE "+name);
        if(userName==null)
            return rs1;
        rs1=stmt.executeQuery("select * from `"+TableName+"`"+" where `userName` = '"+userName+"'");
        return rs1;
    }

}
