/** ログイン時に利用する */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.SelectEmployeeBean;
import models.UserBean;

public class EmployeeDao extends CommonDao {
	public UserBean findUser(int args_employeeCD, String args_password) {
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            String query = "SELECT * FROM users WHERE employeeCD=? AND password=?"; 
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
				java.sql.Date hire_date = rs.getDate("hire_date");
				int position = rs.getInt("position");
				
				UserBean user  = new UserBean(employeeCD, storeCD, position, name, password, email,hire_date);
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
	
	public void Register(UserBean EmployeeRegister) {
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            String query = "INSERT INTO users(name, email, password, storeCD, hire_date, position) VALUES(?,?,?,?,?,?)"; 
            PreparedStatement statement = con.prepareStatement(query)) {

            statement.setString(1, EmployeeRegister.getName());
            statement.setString(2, EmployeeRegister.getEmail());
            statement.setString(3, EmployeeRegister.getPassword());
            statement.setInt(4, EmployeeRegister.getStoreCD());
            statement.setDate(5, EmployeeRegister.getHire_date());
            statement.setInt(6, EmployeeRegister.getPosition());

            statement.executeUpdate();
            statement.close();
            con.close();
        }catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
	}

    public Integer findStoreCD(int args_managerCD){
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            String query = "SELECT storeCD FROM storeManagers WHERE managerCD = ?";
            PreparedStatement statement = con.prepareStatement(query)) {
                statement.setInt(1, args_managerCD);
                ResultSet rs = statement.executeQuery();
                int storeCD;
                while (rs.next()) {
                    storeCD = rs.getInt("storeCD");
                    statement.close();
                    con.close();
                    return storeCD;
                    } 
            }catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
		return null;
    }
    
    public ArrayList<SelectEmployeeBean> findEmployeeCDOfShiftRegister(int args_storeCD){
        ArrayList<SelectEmployeeBean> employees = new ArrayList<SelectEmployeeBean>();
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            String query = "SELECT employeeCD, name FROM users WHERE storeCD = ?";
            PreparedStatement statement = con.prepareStatement(query)) {
                statement.setInt(1, args_storeCD);
                ResultSet rs = statement.executeQuery();
                
                while (rs.next()) {
                    int employeeCD = rs.getInt("employeeCD");
                    String name = rs.getInt("name");

                    SelectEmployeeBean employee  = new SelectEmployeeBean(employeeCD, name);
                    employees.add(employee);
                    } 
                statement.close();
                con.close();
            }catch (SQLException e) {
            e.printStackTrace();
        }
		return SelectEmployees;
    }
}