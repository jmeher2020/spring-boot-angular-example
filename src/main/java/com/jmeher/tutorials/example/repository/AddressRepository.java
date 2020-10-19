package com.jmeher.tutorials.example.repository;

import org.springframework.data.repository.CrudRepository;

import com.jmeher.tutorials.example.model.Address;

public interface AddressRepository extends CrudRepository<Address, Long> {

}
