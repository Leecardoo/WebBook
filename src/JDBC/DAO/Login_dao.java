package JDBC.DAO;

import JDBC.VO.UserData;

import java.sql.*;

public class Login_dao {
    public UserData getUserData(String admin) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        PreparedStatement pre = connection.prepareStatement("select * from shop.user where admin=?;");
        pre.setString(1,admin);
        ResultSet resultSet = pre.executeQuery();
        UserData userData =new UserData();
        while (resultSet.next()){
            userData.setAdmin(resultSet.getString(1));
            userData.setPassword(resultSet.getString(2));
            userData.setNickname(resultSet.getString(3));
        }
        pre.close();
        connection.close();
        return userData;
    }
}
