package com.alexc.expenses.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alexc.expenses.models.ExpenseItem;
import com.alexc.expenses.services.ExpensesService;

@Controller
public class ExpenseController {
	@Autowired
	ExpensesService expensesService;
	
	@GetMapping("/")
	public String root() {
		return "redirect:/expenses";
	}
	

	@GetMapping("/expenses")
	public String newExpense(@ModelAttribute("item") ExpenseItem item, Model model) {
		List<ExpenseItem> items = expensesService.allItems();
		double total = expensesService.expenseTotal();
		int itemCount = expensesService.expenseLength();
		model.addAttribute("total", total);
		model.addAttribute("itemCount", itemCount);
		model.addAttribute("items", items);
		return "index.jsp";
	}
	
	@PostMapping("/expenses")
	public String createExpense(@Valid @ModelAttribute("item") ExpenseItem item, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<ExpenseItem> items = expensesService.allItems();
			model.addAttribute("items", items);
			return "index.jsp";
		} else {
			expensesService.createItem(item);
			return "redirect:/expenses";
		}
	}
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		ExpenseItem item = expensesService.findItem(id);
		model.addAttribute("item", item);
		return "edit.jsp";
	}

	
	@PutMapping("/edit")
	public String update(Model model, @Valid @ModelAttribute("item") ExpenseItem item, BindingResult result) {
		if(result.hasErrors()) {
			return "redirect:/edit/{id}";
		}
		else {
			expensesService.updateItem(item);
			return "redirect:/expenses";
		}
	}
	@DeleteMapping("/expenses/{id}")
	public String destroy(@PathVariable("id") Long id) {
		expensesService.deleteItem(id);
		return "redirect:/expenses";
	}
	@RequestMapping("/expenses/show/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		ExpenseItem item = expensesService.findItem(id);
		model.addAttribute("name", item.getName());
		model.addAttribute("description", item.getDescription());
		model.addAttribute("vendor", item.getVendor());
		model.addAttribute("price", item.getPrice());
		
		return "show.jsp";
	}
}
