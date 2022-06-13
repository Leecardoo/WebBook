package JDBC.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteBook {
    public boolean delBook(String bookName) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        PreparedStatement pre = connection.prepareStatement("delete from shop.books where name=?");
        pre.setString(1,bookName);
        int i = pre.executeUpdate();
        if (i==1){
            pre.close();
            connection.close();
            return true;
        }else {
            pre.close();
            connection.close();
            return false;
        }
    }
}
