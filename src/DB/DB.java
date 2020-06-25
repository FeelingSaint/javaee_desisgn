package DB;

import java.sql.*;

public class DB {
    private static String url="jdbc:mysql://127.0.0.1:3306/java_design?useUnicode=true&characterEncoding=utf-8";
    private static String user="root";
    private static String password="123456";
    private static Connection conn=null;
    private static Statement stmt=null;
    private static ResultSet rs=null;
    private static String delSql="delete from user where name = ";
    private static String sql_select_ALL="select * from user";
    private static String sql_insert=" insert into `user` (`NAME`,`PASSWORD`) VALUES";
    private static String updateSql1="update `user`  set `password` = ";
    private static String updateSql2=" where `userName` = ";






    public DB() throws SQLException {
        // TODO Auto-generated method stub

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("default");
        }

        try {
            conn=DriverManager.getConnection(url,user,password);

        } catch (SQLException e) {
            // TODO Auto-generated catch block

            System.out.println("conn 失败");
            e.printStackTrace();
        }

//        String updateSql="update user set age = ? where id = ?";


        try {
            stmt=conn.createStatement();
//			stmt.executeUpdate(sql_insert);
//			stmt.executeUpdate(delSql);
//			stmt.executeUpdate(updateSql);
            //批处理
//            update(updateSql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("Update 失败");
        }






//        int colCount = rs.getMetaData().getColumnCount();

//        for (int i=1;i<=colCount;i++) {
//            System.out.print(rs.getMetaData().getColumnName(i)+"\t");
//
//        }
//        System.out.println();
//




    }


    public  Statement getStmt() {
        return stmt;
    }

    public ResultSet getResultSet(){

        try {
            rs=stmt.executeQuery(sql_select_ALL);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    public void delete(String name){
//        System.out.println(delSql);
        try {



            stmt.executeUpdate(delSql+name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insert(String name,String password){


        try {
            stmt.executeUpdate(sql_insert+"('"+name+"','"+password+"')");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean insert(String [] data){


        try {
            stmt.executeUpdate(" insert into `user` VALUES"+"('"+data[0]+"','"+data[1]+"','"+data[2]+"','"+data[3]+"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+data[7]+"','"+data[8]+"','"+data[9]+"','"+data[10]+"',"+Integer.valueOf(data[11])+",'"+data[12]+"'"+")");

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public  void update(String userName,String []data) throws SQLException {
//        System.out.println(updateSql1+" '"+data[0]+"',"+" `edu` = '"+data[1]+"',"+" `work` = '"+data[2]+"',"+" `phone` = '"+data[3]+"',"+" `place` ='"+data[4]+"',"+"`email` = '"+data[5]+"',"+"`image` = '"+data[6]+"' "+updateSql2+"'"+userName+"'");
        stmt.executeUpdate(updateSql1+" '"+data[0]+"',"+" `edu` = '"+data[1]+"',"+" `work` = '"+data[2]+"',"+" `phone` = '"+data[3]+"',"+" `place` ='"+data[4]+"',"+"`email` = '"+data[5]+"',"+"`image` = '"+data[6]+"' "+updateSql2+"'"+userName+"'");

    }
    public  void update(String name,String password) throws SQLException {
//        System.out.println("update success");
        stmt.executeUpdate(updateSql1+password+updateSql2+name);

    }
    public  void update(String userName,int authority) throws SQLException {

//        System.out.println("update success");
        stmt.executeUpdate("update `user`  set `authority` = '"+authority+ "'where `userName` = '"+userName+"'");

    }

    public ResultSet select(String name) throws SQLException {

//        System.out.println("select * from `user` WHERE `name` LIKE "+name);
        ResultSet rs1=stmt.executeQuery("select * from `user` WHERE `userName` = "+name+";");
        return rs1;
    }
    public ResultSet select(String userName,String tableName) throws SQLException {

//        System.out.println("select * from `user` WHERE `name` LIKE "+name);
        ResultSet rs1=stmt.executeQuery("select * from `"+tableName+"` WHERE `userName` LIKE '"+userName+"'");
        return rs1;
    }
    public ResultSet selectAll(String TableName) throws SQLException {

//        System.out.println("select * from `user` WHERE `name` LIKE "+name);
        ResultSet rs1=stmt.executeQuery("select * from `"+TableName+"`");
        return rs1;
    }




}
