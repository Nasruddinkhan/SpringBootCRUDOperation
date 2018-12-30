/**
 * 
 */
package com.neo.quant.springboot.model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * @author Nassruddin Khan
 *
 */
@Entity
public class Employees {
	@Id
	private Integer empID;
	private String  firstName;
	private String  lastName;
	private Double salary;
	private String userID;
	private String password;
	
	/**
	 * @param empID
	 * @param firstName
	 * @param lastName
	 * @param salary
	 */
	public Employees(Integer empID, String firstName, String lastName, Double salary) {
		super();
		this.empID = empID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
	}

	/**
	 * 
	 */
	public Employees() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getEmpID() {
		return empID;
	}

	public void setEmpID(Integer empID) {
		this.empID = empID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Employees [empID=" + empID + ", firstName=" + firstName + ", lastName=" + lastName + ", salary="
				+ salary + "]";
	}

	/**
	 * @return the userID
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @param userID the userID to set
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

}
