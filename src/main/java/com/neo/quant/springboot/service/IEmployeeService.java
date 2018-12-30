/**
 * 
 */
package com.neo.quant.springboot.service;

import java.util.List;

import com.neo.quant.springboot.model.Employees;

/**
 * @author Nassruddin Khan
 *
9:06:00 PM
 */
public interface IEmployeeService {
	void save(Employees employees);
	List<Employees> getAllEmployees();
	void updateEmployee(Employees employees);
	void deleteEmp(Integer empId);
	 Employees getEmployees(Integer empId);
}
