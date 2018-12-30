/**
 * 
 */
package com.neo.quant.springboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Nassruddin Khan
 *
 */
@RestController
public class DashboardController {

	@RequestMapping("/")
	public ModelAndView index() {
		System.out.println("DashboardController.index()");
		return new ModelAndView("register");
	}
	
}
