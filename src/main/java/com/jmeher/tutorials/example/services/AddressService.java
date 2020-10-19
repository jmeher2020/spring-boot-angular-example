package com.jmeher.tutorials.example.services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jmeher.tutorials.example.model.Address;
import com.jmeher.tutorials.example.repository.AddressRepository;

@Service  
public class AddressService {

	@Autowired 
	AddressRepository addressRepo;

	@PersistenceContext
	EntityManager entityManager;



	public void addEditAddressDetails(Address objAdd) throws HibernateException{
		if(objAdd != null) {
			addressRepo.save(objAdd);
		}
		
	}


	@SuppressWarnings("unchecked")
	public List<Address> fetchAddressWithCustomerId(Long customerId) {
		Query query = entityManager.createNativeQuery("SELECT * from address where customer_id=?", Address.class);
		query.setParameter(1, customerId);
		return (List<Address>) query.getResultList();	
	}


	public Address fetchAddressWithId(Long addressId) {

		Query query = entityManager.createNativeQuery("SELECT * from address where address_id=?", Address.class);
		query.setParameter(1, addressId);
		return (Address)query.getSingleResult();	
	}



	public void deleteAddressDetailsById(Long addressId) {
		addressRepo.deleteById(addressId);
		
	}
	
	public void deleteAllAddresss() {
		addressRepo.deleteAll();
		
	}
	
	public String countNoOfAddress() {
		return String.valueOf(addressRepo.count());		
	}


}
