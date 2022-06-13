package JDBC.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Register {
    public boolean signIn(String admin,String password,String nickname) throws ClassNotFoundException, SQLException {
        if (admin!=null&&!admin.equals("")&&password!=null&&!password.equals("")&&nickname!=null&&!nickname.equals("")){
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop", "root", "lzy020110");
        PreparedStatement pre = connection.prepareStatement("insert into shop.user values (?,?,?)");
        pre.setString(1,admin);
        pre.setString(2,password);
        pre.setString(3,nickname);
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
    }else {
            return false;
        }
    }
}

