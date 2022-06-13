package JDBC.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AddBook {
    public boolean add(String bookName,String author,float press,String bookImg,String bookIntro,String authorIntro) throws  Exception{
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        PreparedStatement pre = connection.prepareStatement("insert into shop.books values (?,?,?,?,?,?)");
        pre.setString(1,bookName);
        pre.setString(2,author);
        pre.setFloat(3,press);
        pre.setString(4,bookImg);
        pre.setString(5,bookIntro);
        pre.setString(6,authorIntro);
        int i = pre.executeUpdate();
        if (i==1){
            pre.close();
            connection.close();
            return true;
        }else
        {
            pre.close();
            connection.close();
            return false;
        }
    }
}
