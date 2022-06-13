package JDBC.DAO;

import java.sql.*;

public class CreateUserTable {
    public boolean createShoppingTrolley(String admin) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping_trolley", "root", "lzy020110");
        Statement statement = connection.createStatement();
        int i = statement.executeUpdate("create table " + admin + "(booknaem varchar(20) primary key ,author varchar(20),press int,count int)");
        if (i==1){
            return true;
        }else {
            return false;
        }

    }
}
