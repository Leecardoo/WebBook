package JDBC.DAO;

import JDBC.VO.Books;


import java.sql.*;
import java.util.ArrayList;

public class GetBooks {
    public ArrayList returnBooks() throws ClassNotFoundException, SQLException {
        ArrayList books =new ArrayList();
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from shop.books");
        while (resultSet.next()){
            Books books1 =new Books();
            books1.setName(resultSet.getString(1));
            books1.setAuthor(resultSet.getString(2));
            books1.setPress(resultSet.getFloat(3));
            books1.setBookImg(resultSet.getString(4));
            books1.setBook_intro(resultSet.getString(5));
            books1.setAuthor_intro(resultSet.getString(6));
            books.add(books1);
        }
        statement.close();
        connection.close();
        return books;
    }
}
