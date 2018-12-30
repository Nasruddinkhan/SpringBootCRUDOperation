
package com.neo.quant.springboot.dao;
import org.springframework.data.repository.CrudRepository;

import com.neo.quant.springboot.model.Employees;
/**
 * @author Nassruddin Khan
 *
 */
public interface EmployeeDao extends CrudRepository<Employees, Integer> {
}
