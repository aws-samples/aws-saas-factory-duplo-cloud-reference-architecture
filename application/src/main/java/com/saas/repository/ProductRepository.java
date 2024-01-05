package com.saas.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.saas.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
