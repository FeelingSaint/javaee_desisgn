package info;

import java.util.List;

public class Info {

    public static String userName=null;
    public static String password=null;
    public static List<Book> bookList=null;
    public static String  authority=null;
    public static String error=null;

    public static String getUserName() {
        return userName;
    }

    public static void setUserName(String userName) {
        Info.userName = userName;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        Info.password = password;
    }

    public static List<Book> getBookList() {
        return bookList;
    }

    public static void setBookList(List<Book> bookList) {
        Info.bookList = bookList;
    }

    public static String getAuthority() {
        return authority;
    }

    public static void setAuthority(String authority) {
        Info.authority = authority;
    }

    public static String getError() {
        return error;
    }

    public static void setError(String error) {
        Info.error = error;
    }
}
