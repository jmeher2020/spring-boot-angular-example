package com.jmeher.tutorials.example.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmeher.tutorials.example.model.Customer;
import com.jmeher.tutorials.example.repository.CustomerRepository;

@Service  
public class CustomerService {

	@Autowired 
	CustomerRepository customerRepo;

	@PersistenceContext
	EntityManager entityManager;



	public void addEditCustomerDetails(Customer objCustomer) throws HibernateException{
		customerRepo.save(objCustomer);
	}


	@SuppressWarnings("unchecked")
	public List<Customer> fetchCustomerList() {	
		Query query = entityManager.createNativeQuery("SELECT * from customer", Customer.class);
		return (List<Customer>)query.getResultList();		
	}



	public Customer fetchCustomerWithId(Long customerId) {
		Query query = entityManager.createNativeQuery("SELECT * from customer where customer_id=?", Customer.class);
		query.setParameter(1, customerId);
		return (Customer)query.getSingleResult();	
	}
	
	
	public boolean isCustomerExist(Customer objCustomer) {
        return fetchCustomerWithId(objCustomer.getCustomerId()) !=null;
    }



	public void deleteCustomerDetailsById(Long customerId) {
		customerRepo.deleteById(customerId);
		
	}
	
	
	public void deleteAllCustomers() {
		customerRepo.deleteAll();
		
	}
	
	public String countNoOfCustomer() {
		return String.valueOf(customerRepo.count());		
	}


}
