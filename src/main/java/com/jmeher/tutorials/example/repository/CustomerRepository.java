package com.jmeher.tutorials.example.repository;

import org.springframework.data.repository.CrudRepository;

import com.jmeher.tutorials.example.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {

}
