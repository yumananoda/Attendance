/** 出勤・退勤時刻をテーブルに格納する */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class RegistrationClockDao extends CommonDao {
	
	public void registrationClockIn(LocalDateTime now, int employeeCD) {
		String sql = "INSERT INTO time_records(employeeCD, clock_in_time, clock_out_time) VALUES(?,?,?)";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement statement = con.prepareStatement(sql)) {
            
            statement.setInt(1, employeeCD);
            statement.setObject(2, now);
            statement.setObject(3, null);
            statement.executeQuery();
            
            statement.close();
			con.close();

        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
    }
	
	public void registrationClockOut(LocalDateTime now, int employeeCD) {
		String sql = "UPDATE time_records SET clock_out_time=? WHERE employeeCD=? ORDER BY recordCD DESC LIMIT 1;";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement statement = con.prepareStatement(sql)) {

            System.out.println("eee");
            statement.setObject(1, now);
            statement.setInt(2, employeeCD);
            statement.executeQuery();
            
            statement.close();
			con.close();

        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
    }

//	public void registrationClockOut(int id) {
//		String sql = "SELECT id FROM time_records WHERE ";
//        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
//        		PreparedStatement statement = con.prepareStatement(sql)) {
//
//        	statement.setInt(1, id);
//        	statement.executeQuery();
//           
//            statement.close();
//			con.close();
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            エラーハンドリングを適切に行う
//        }
//    }
}