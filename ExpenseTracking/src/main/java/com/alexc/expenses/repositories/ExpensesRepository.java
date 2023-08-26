package com.alexc.expenses.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.alexc.expenses.models.ExpenseItem;

@Repository
public interface ExpensesRepository extends CrudRepository<ExpenseItem, Long> {
	List<ExpenseItem> findAll();
}
