package com.jmeher.tutorials.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

import com.jmeher.tutorials.example.model.Customer;
import com.jmeher.tutorials.example.services.CustomerService;

@Controller
@RequestMapping(path="/jmeher")
public class CustomerController {

	@Autowired 
	private CustomerService customerServ;

    
    @RequestMapping(value = "/customer/", method = RequestMethod.GET)
    public ResponseEntity<List<Customer>> fetchAllCustomers() {
    	
        List<Customer> objCustomerList = customerServ.fetchCustomerList();
        if(objCustomerList.isEmpty()){
            return new ResponseEntity<List<Customer>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Customer>>(objCustomerList, HttpStatus.OK);
    }
  
     
    @RequestMapping(value = "/customer/{customerId}", method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Customer> getCustomer(@PathVariable("customerId") long customerId) {
    	
        System.out.println("Fetching Customer with id " + customerId);
        Customer objCustomer = customerServ.fetchCustomerWithId(customerId);
        
        if (objCustomer == null) {
            System.out.println("Customer with id " + customerId + " not found");
            return new ResponseEntity<Customer>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Customer>(objCustomer, HttpStatus.OK);
    }
  
      
     
    @RequestMapping(value = "/customer/", method = RequestMethod.POST)
    public ResponseEntity<Void> createCustomer(@RequestBody Customer objCustomer,  
    		UriComponentsBuilder ucBuilder) {
    	
        System.out.println("Creating Customer " + objCustomer.getFirstName());
  
        customerServ.addEditCustomerDetails(objCustomer);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/customer/{customerId}").buildAndExpand(objCustomer.getCustomerId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/customer/{customerId}", method = RequestMethod.PUT)
    public ResponseEntity<Customer> updateCustomer(@PathVariable("customerId") long customerId, 
    		@RequestBody Customer objCustomer) {
    	
        System.out.println("Updating Customer " + customerId);
        
        Customer customer = customerServ.fetchCustomerWithId(customerId);
        if (customer == null) {
            System.out.println("Unable to Edit. Customer with id " + customerId + " not found");
            return new ResponseEntity<Customer>(HttpStatus.NOT_FOUND);
        }
        
        customerServ.addEditCustomerDetails(objCustomer);
        
        return new ResponseEntity<Customer>(objCustomer, HttpStatus.OK);
    }
  
      
    @RequestMapping(value = "/customer/{customerId}", method = RequestMethod.DELETE)
    public ResponseEntity<Customer> deleteCustomer(@PathVariable("customerId") long customerId) {
    	
        System.out.println("Fetching & Deleting Customer with id " + customerId);
  
        Customer customer = customerServ.fetchCustomerWithId(customerId);
        if (customer == null) {
            System.out.println("Unable to delete. Customer with id " + customerId + " not found");
            return new ResponseEntity<Customer>(HttpStatus.NOT_FOUND);
        }
  
        customerServ.deleteCustomerDetailsById(customerId);
        return new ResponseEntity<Customer>(HttpStatus.NO_CONTENT);
    }
 
      
    @RequestMapping(value = "/customer/", method = RequestMethod.DELETE)
    public ResponseEntity<Customer> deleteAllCustomers() {
        System.out.println("Deleting All Customers");
  
        customerServ.deleteAllCustomers();
        return new ResponseEntity<Customer>(HttpStatus.NO_CONTENT);
    }
    
    @RequestMapping(path="/customer/count/") 
	public @ResponseBody String countNoOfCustomer() {
		return customerServ.countNoOfCustomer();
	}
  

}
