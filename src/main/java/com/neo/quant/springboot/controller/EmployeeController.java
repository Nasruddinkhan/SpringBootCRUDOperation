/**
 * 
 */
package com.neo.quant.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.neo.quant.springboot.model.Employees;
import com.neo.quant.springboot.service.IEmployeeService;

/**
 * @author Nassruddin Khan
 *
 */
@RestController
public class EmployeeController {
	@Autowired
	private IEmployeeService empService;
	
	@RequestMapping(value="test", method = RequestMethod.GET )
	public ResponseEntity<?> getSayHello() {
		return ResponseEntity.ok(new Employees(101, "Nasruddin", "khan", 18000.00));	
	}
	
	@RequestMapping(value="allemp", method = RequestMethod.GET )
	public List<Employees> getAllEmployees() {
		return empService.getAllEmployees();
	}
	
	@RequestMapping(value="save", method = RequestMethod.POST )
	public void save(@RequestBody Employees employees) {
		empService.save(employees);
	}
	
	@RequestMapping(value="update", method = RequestMethod.PUT )
	public void update(@RequestBody Employees employees) {
		empService.updateEmployee(employees);
	}

	@RequestMapping(value="delete/{empID}", method = RequestMethod.DELETE )
	public void update( @PathVariable Integer empID) {
		empService.deleteEmp(empID);
	}
	
	@RequestMapping(value="getemp/{empID}", method = RequestMethod.DELETE )
	public Employees getEmployees( @PathVariable Integer empID) {
		return empService.getEmployees(empID);
	}
}
