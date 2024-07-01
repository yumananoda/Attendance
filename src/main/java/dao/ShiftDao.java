package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.ShiftRegisterBean;

public class ShiftDao extends CommonDao {

	public ArrayList<ShiftRegisterBean> findShiftByEmployeeCD(int args_employeeCD) {
		ArrayList<ShiftRegisterBean> shifts = new ArrayList<ShiftRegisterBean>();
		String query = "SELECT employeeCD, shift_day, start_time, end_time  FROM shift WHERE employeeCD=?";
		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = con.prepareStatement(query)) {

			statement.setInt(1, args_employeeCD);

			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				int employeeCD = rs.getInt("employeeCD");
				int shift_day = rs.getInt("shift_day");
				java.sql.Time start_time = rs.getTime("start_time");
				java.sql.Time end_time = rs.getTime("end_time");

				ShiftRegisterBean shift = new ShiftRegisterBean(employeeCD, shift_day, start_time, end_time);
				System.out.println(shift.getShift_day());
				shifts.add(shift);
			}
			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			// エラーハンドリングを適切に行う
		}
		return shifts;
	}

	public ShiftRegisterBean findShiftDay(ShiftRegisterBean shift) {
		String query = "SELECT * FROM shift WHERE employeeCD=? AND shift_day=?";
		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = con.prepareStatement(query)) {

			statement.setInt(1, shift.getEmployeeCD());
			statement.setInt(2, shift.getShift_day());

			ResultSet rs = statement.executeQuery();
			System.out.println(rs);
			int employeeCD = rs.getInt("employeeCD");
			int shift_day = rs.getInt("shift_day");
			java.sql.Time start_time = rs.getTime("start_time");
			java.sql.Time end_time = rs.getTime("end_time");

			ShiftRegisterBean shiftBean = new ShiftRegisterBean(employeeCD, shift_day, start_time, end_time);
			System.out.println(shift.getShift_day());
			statement.close();
			con.close();
			return shiftBean;

		} catch (SQLException e) {
			e.printStackTrace();
			// エラーハンドリングを適切に行う
		}
		return null;
	}

	public void shiftUpdate(ShiftRegisterBean shift) {
		String sql = "UPDATE shift SET start_time, end_time WHERE employeeCD=? AND shift_day=?;";
		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = con.prepareStatement(sql)) {

			statement.setObject(1, shift.getEmployeeCD());
			statement.setInt(2, shift.getShift_day());
			statement.executeQuery();

			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			// エラーハンドリングを適切に行う
		}
	}

	public void shiftRegister(ShiftRegisterBean shift) {
		String sql = "INSERT INTO shift(employeeCD, shift_day, start_time, end_time) VALUES(?,?,?,?)";
		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement statement = con.prepareStatement(sql)) {

			statement.setInt(1, shift.getEmployeeCD());
			statement.setInt(2, shift.getShift_day());
			statement.setTime(3, shift.getStart_time());
			statement.setTime(4, shift.getEnd_time());
			statement.executeUpdate();

			statement.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
			// エラーハンドリングを適切に行う
		}
	}

}