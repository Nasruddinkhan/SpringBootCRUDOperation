/**
 * 
 */
package com.neo.quant.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neo.quant.springboot.dao.EmployeeDao;
import com.neo.quant.springboot.model.Employees;

/**
 * @author Nassruddin Khan
 *
 */
@Service
public class EmployeeService implements IEmployeeService{
	@Autowired
	EmployeeDao employeeDao;
	@Override
	public void save(Employees employees) {
		employeeDao.save(employees);
	}
	/**
	 * @return
	 */
	@Override
	public List<Employees> getAllEmployees() {
		List<Employees> employees = new ArrayList<>();
		employeeDao.findAll().forEach(c->employees.add(c));
		return employees;
	}
	@Override
	public void updateEmployee(Employees employees) {
		employeeDao.save(employees);
	}
	@Override
	public void deleteEmp(Integer empId) {
		employeeDao.deleteById(empId);
	}
	@Override
	public Employees getEmployees(Integer empId) {
		return employeeDao.findById(empId).get();
	}
}
