package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import models.ShiftRegisterBean;

public class ShiftRegisterDao extends CommonDao {
	public void shiftRegister(ShiftRegisterBean shift) {
		String sql = "INSERT INTO shift(employeeCD, shift_day, start_time, end_time) VALUES(?,?,?,?)";
		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = con.prepareStatement(sql)) {

			statement.setInt(1, shift.getEmployeeCD());
			statement.setInt(1, shift.getShift_day());
			statement.setTime(1, shift.getStart_time());
			statement.setTime(1, shift.getEnd_time());
			statement.executeUpdate();
				
			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			// エラーハンドリングを適切に行う
		}
	}
}
