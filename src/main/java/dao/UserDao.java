/** ログイン時に利用する */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import models.UserBean;

public class UserDao extends CommonDao {
	public UserBean findUser(int args_employeeCD, String args_password) {
        String query = "SELECT * FROM users WHERE employeeCD=? AND password=?"; 
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement statement = con.prepareStatement(query)) {

            statement.setInt(1, args_employeeCD);
            statement.setString(2, args_password);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
				int employeeCD = rs.getInt("employeeCD");
                String name = rs.getString("name");
                String email = rs.getString("email");
				String password = rs.getString("password");
				int storeCD = rs.getInt("storeCD");
				Date hire_date = rs.getDate("hire_date");
				int position = rs.getString("position");
				
				UserBean user  = new UserBean(employeeCD, name, email, password, storeCD, hire_date, position);
				System.out.println(user.getName());
				return user;
			}
            statement.close();
			con.close();

        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
        return null;
    }
}