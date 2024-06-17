package models;

public class EmployeeRegisterBean {
	private String name, email;
	private int position;
	
	public EmployeeRegisterBean(String name, String email, int position) {
		super();
		this.name = name;
		this.email = email;
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	
}
