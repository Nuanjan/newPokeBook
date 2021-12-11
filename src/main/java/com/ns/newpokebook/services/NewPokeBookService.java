package com.ns.newpokebook.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ns.newpokebook.models.Expense;
import com.ns.newpokebook.repositories.NewPokeBookRepository;

@Service
public class NewPokeBookService {

	private final NewPokeBookRepository newPokeBookRepository;
	public NewPokeBookService(NewPokeBookRepository newPokeBookRepository) {
		this.newPokeBookRepository = newPokeBookRepository;
	}
	
	public List<Expense> allExpenses(){
		return newPokeBookRepository.findAll();
	}
	
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = newPokeBookRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	
	public Expense saveExpense(Expense expense) {
		return newPokeBookRepository.save(expense);
	}
	
	public void deleteExpense(Long id) {
		newPokeBookRepository.deleteById(id);
	}
}
