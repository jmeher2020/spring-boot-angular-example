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
import org.springframework.web.util.UriComponentsBuilder;

import com.jmeher.tutorials.example.model.Address;
import com.jmeher.tutorials.example.services.AddressService;

@Controller
@RequestMapping(path="/jmeher")
public class AddressController {

	@Autowired 
	private AddressService addressServ;


	@RequestMapping(value = "/address/{customerId}", method = RequestMethod.GET)
	public ResponseEntity<List<Address>> fetchAllAddresss(@PathVariable("customerId") long customerId) {

		List<Address> objAddressList = addressServ.fetchAddressWithCustomerId(customerId);
		if(objAddressList.isEmpty()){
			return new ResponseEntity<List<Address>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Address>>(objAddressList, HttpStatus.OK);
	}


	@RequestMapping(value = "/address/{customerId}/{addressId}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Address> getAddress(@PathVariable("addressId") long addressId) {

		System.out.println("Fetching Address with id " + addressId);
		Address objAddress = addressServ.fetchAddressWithId(addressId);

		if (objAddress == null) {
			System.out.println("Address with id " + addressId + " not found");
			return new ResponseEntity<Address>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Address>(objAddress, HttpStatus.OK);
	}



	@RequestMapping(value = "/address/", method = RequestMethod.POST)
	public ResponseEntity<Void> addAddress(@RequestBody Address objAddress,  
			UriComponentsBuilder ucBuilder) {

		System.out.println("Creating Address " + objAddress.getCustomerId());

		addressServ.addEditAddressDetails(objAddress);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/address/{addressId}").buildAndExpand(objAddress.getAddressId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/address/{addressId}", method = RequestMethod.PUT)
	public ResponseEntity<Address> updateAddress(@PathVariable("addressId") long addressId, 
			@RequestBody Address objAddress) {

		System.out.println("Updating Address " + addressId);

		Address customer = addressServ.fetchAddressWithId(addressId);
		if (customer == null) {
			System.out.println("Unable to Edit. Address with id " + addressId + " not found");
			return new ResponseEntity<Address>(HttpStatus.NOT_FOUND);
		}

		addressServ.addEditAddressDetails(objAddress);

		return new ResponseEntity<Address>(objAddress, HttpStatus.OK);
	}


	@RequestMapping(value = "/address/{addressId}", method = RequestMethod.DELETE)
	public ResponseEntity<Address> deleteAddress(@PathVariable("addressId") long addressId) {

		System.out.println("Fetching & Deleting Address with id " + addressId);

		Address customer = addressServ.fetchAddressWithId(addressId);
		if (customer == null) {
			System.out.println("Unable to delete. Address with id " + addressId + " not found");
			return new ResponseEntity<Address>(HttpStatus.NOT_FOUND);
		}

		addressServ.deleteAddressDetailsById(addressId);
		return new ResponseEntity<Address>(HttpStatus.NO_CONTENT);
	}


	@RequestMapping(value = "/address/", method = RequestMethod.DELETE)
	public ResponseEntity<Address> deleteAllAddresss() {
		System.out.println("Deleting All Addresss");

		addressServ.deleteAllAddresss();
		return new ResponseEntity<Address>(HttpStatus.NO_CONTENT);
	}



}
