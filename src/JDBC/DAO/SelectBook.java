package JDBC.DAO;

import JDBC.VO.Book_VO;
import JDBC.VO.SelectBookVo;

import java.sql.*;
import java.util.ArrayList;

public class SelectBook {
    public ArrayList selectBook(String bookName) throws ClassNotFoundException, SQLException {
        ArrayList selectedBook=new ArrayList();
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        PreparedStatement pre = connection.prepareStatement("select * from shop.books where name like '%"+bookName+"%'");
        ResultSet resultSet = pre.executeQuery();
        while (resultSet.next()){
            SelectBookVo selectBookVo=new SelectBookVo();
            selectBookVo.setName(resultSet.getString(1));
            selectBookVo.setAuthor(resultSet.getString(2));
            selectBookVo.setPress(resultSet.getFloat(3));
            selectBookVo.setBookImg(resultSet.getString(4));
            selectBookVo.setBook_intro(resultSet.getString(5));
            selectBookVo.setAuthor_intro(resultSet.getString(6));
            selectedBook.add(selectBookVo);
        }
        return selectedBook;
    }
}
