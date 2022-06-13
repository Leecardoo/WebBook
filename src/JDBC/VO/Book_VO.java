package JDBC.VO;

public class Book_VO {
    private String bookName;
    private float bookPress;
    private int bookCount;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public float getBookPress() {
        return bookPress;
    }

    public void setBookPress(float bookPress) {
        this.bookPress = bookPress;
    }

    public int getBookCount() {
        return bookCount;
    }

    public void setBookCount(int bookCount) {
        this.bookCount = bookCount;
    }
}
