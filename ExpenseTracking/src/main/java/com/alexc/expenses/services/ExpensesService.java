package com.alexc.expenses.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.stereotype.Service;

import com.alexc.expenses.models.ExpenseItem;
import com.alexc.expenses.repositories.ExpensesRepository;

@Service
public class ExpensesService {
	private final ExpensesRepository expensesRepository;
	
	public ExpensesService(ExpensesRepository expensesRepository) {
		this.expensesRepository = expensesRepository;
	}
	public List<ExpenseItem> allItems() {
		return expensesRepository.findAll();
	}
	public ExpenseItem createItem(ExpenseItem item) {
		return expensesRepository.save(item);
	}
	public ExpenseItem findItem(Long id) {
		Optional<ExpenseItem> optionalItem = expensesRepository.findById(id);
		if(optionalItem.isPresent()) {
			return optionalItem.get();
		}
		else {
			return null;
		}
	}
	public ExpenseItem updateItem(ExpenseItem item) {
		return expensesRepository.save(item);
	}
	
	public void deleteItem(Long id) {
		Optional<ExpenseItem> optional = expensesRepository.findById(id);
		if(optional.isPresent()) {
			expensesRepository.deleteById(id);
		}
	}
	
	public double expenseTotal() {
		double total = 0;
		List<ExpenseItem> items = expensesRepository.findAll();
		for(ExpenseItem item : items) {
			total = total + item.getPrice();
		}
		return total;
	}
	
	public int expenseLength() {
		List<ExpenseItem> items = expensesRepository.findAll();
		return items.size();
	}
}
