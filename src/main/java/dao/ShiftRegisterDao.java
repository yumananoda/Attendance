package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import models.TimeRecordsBean;

public class ShiftRegisterDao extends CommonDao{
	public void shiftRegister(int args_employeeCD) {
		String sql = "INSERT INTO shift(employeeCD, shift_date, start_time, end_time) VALUES(?,?,?)";
        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
            PreparedStatement statement = con.prepareStatement(sql)) {
        	for() {
        		statement.setInt(1, args_employeeCD);
    			statement.setInt(1, args_employeeCD);
    			statement.setInt(1, args_employeeCD);
    			statement.executeQuery();
        	}
			
			
			ResultSet rs = statement.executeQuery();
            while (rs.next()) {
            	// Timestampとして取得
				Timestamp timestamp1 = rs.getTimestamp("clock_in_time");
				Timestamp timestamp2 = rs.getTimestamp("clock_out_time");
//            	
				TimeRecordsBean timeRecord  = new TimeRecordsBean(timestamp1, timestamp2);
				TimeRecords.add(timeRecord);
			}
            statement.close();
			con.close();

        } catch (SQLException e) {
            e.printStackTrace();
            // エラーハンドリングを適切に行う
        }
    }
}
