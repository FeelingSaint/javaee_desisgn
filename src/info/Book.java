package info;

public class Book {
    private String Bookname;
    private String Author;

    private String Press;
    private String Surplus;
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookname() {
        return Bookname;
    }

    public void setBookname(String bookname) {
        Bookname = bookname;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String author) {
        Author = author;
    }

    public String getPress() {
        return Press;
    }

    public void setPress(String press) {
        Press = press;
    }

    public String getSurplus() {
        return Surplus;
    }

    public void setSurplus(String surplus) {
        Surplus = surplus;
    }

}
