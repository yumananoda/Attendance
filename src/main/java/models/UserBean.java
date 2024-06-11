package models;
import java.util.Date;

public class UserBean {
	private int employeeCD,storeCD ;
	private String name, password, position ;
	private Date hire_date;


	public UserBean(int employeeCD, int storeCD, String name, String password, String position, Date hire_date) {
		
		super();
		this.employeeCD = employeeCD;
		this.storeCD = storeCD;
		this.name = name;
		this.password = password;
		this.position = position;
		this.hire_date = hire_date;
	}
	public int getEmployeeCD() {
		return employeeCD;
	}
	public void setEmployeeCD(int employeeCD) {
		this.employeeCD = employeeCD;
	}
	public int getStoreCD() {
		return storeCD;
	}
	public void setStoreCD(int storeCD) {
		this.storeCD = storeCD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}

}
	