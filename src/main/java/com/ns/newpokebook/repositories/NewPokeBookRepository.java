package com.ns.newpokebook.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.ns.newpokebook.models.Expense;

public interface NewPokeBookRepository extends CrudRepository<Expense, Long> {
	
	List<Expense> findAll();
	
	// check if the object exist, will return true or false.
	Optional<Expense> findById(Long Id);
	
	void deleteById(Long id);
	

}
