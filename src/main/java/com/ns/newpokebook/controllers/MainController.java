package com.ns.newpokebook.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ns.newpokebook.models.Expense;
import com.ns.newpokebook.services.NewPokeBookService;




@Controller
public class MainController {
	private final NewPokeBookService newPokeBookService;
	public  MainController(NewPokeBookService newPokeBookService) {
		this.newPokeBookService = newPokeBookService;
	}
	
	
//=========================== Get Routes ==================================
	
	@RequestMapping("/expense/{id}")
	public String expenseDetail(@PathVariable("id") Long id, Model model) {
		Expense expense = newPokeBookService.findExpense(id);
		model.addAttribute("expense", expense);
		return "expenseDetail.jsp";
	}
	
//=========================== Create Routes ==================================
	@RequestMapping("/")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = newPokeBookService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	 @RequestMapping(value="/create", method=RequestMethod.POST)
	    public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		 List<Expense> expenses = newPokeBookService.allExpenses();
			model.addAttribute("expenses", expenses);
			if (result.hasErrors()) {
	            return "index.jsp";
	        } else {
	        	newPokeBookService.saveExpense(expense);
	            return "redirect:/";
	        }
	    }
	 
//=========================== Edit Routes ==================================
	 
	 @RequestMapping("/edit/{id}")
	  public String edit(@PathVariable("id") Long  id, Model model) {
		  Expense expense = newPokeBookService.findExpense(id);
		  model.addAttribute("expense", expense);
		  return "edit.jsp";
	  }

	@RequestMapping("update/{id}")
	public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
            return "index.jsp";
        } else {
        	newPokeBookService.saveExpense(expense);
            return "redirect:/";
        }
	}
	
	
//=========================== Delete Routes ==================================
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	  public String destroy(@PathVariable("id") Long id) {
		newPokeBookService.deleteExpense(id);
	      return "redirect:/";
	  }
	

	
}
