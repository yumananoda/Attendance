package models;
import java.util.Date;

public class UserBean {
	private int employeeCD,storeCD, position ;
	private String name, password, email;
	private Date hire_date;



	public UserBean(int employeeCD, int storeCD, int position, String name, String password, String email,
			Date hire_date) {
		super();
		this.employeeCD = employeeCD;
		this.storeCD = storeCD;
		this.position = position;
		this.name = name;
		this.password = password;
		this.email = email;
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
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	
}
	