package com.jmeher.tutorials.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/jmeher")
public class CommonController {


	@GetMapping(path = {"/"})
	public String home_screen() {
		return "/index.jsp";
	}

	@GetMapping(path = {"/index"})
	public String  openIndexScreen(){
		System.out.println("INSIDE: Request Index Page");	
		return "/index.jsp";
	}
	
	@GetMapping(path = {"/customerMgmt/"})
     public String openCustomerManagement() {
         return "/CustomerManagement.jsp";
     }
	
	@GetMapping(path = {"/addressMgmt/{customerId}/{customerName}"})
    public String openAddressrManagement(Model model, @PathVariable("customerId") long customerId, 
    		@PathVariable("customerName") String customerName) {
		model.addAttribute("CUSTOMER_ID", customerId);
		model.addAttribute("CUSTOMER_NAME", customerName);
        return "/AddressManagement.jsp";
    }
}
