<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ page isErrorPage="true" %>
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="ISO-8859-1">
					<title>Expenses</title>
					<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
					<!-- YOUR own local CSS -->
					<link rel="stylesheet" href="/css/style.css" />
					<!-- For any Bootstrap that uses JS or jQuery-->
					<script src="/webjars/jquery/jquery.min.js" type="text/javascript"></script>
					<script src="/webjars/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
				</head>

				<body>
					<div class="container">
						<h1>My Expenses</h1>
						<table class="table table-striped" id="book-table">
							<thead>
								<tr>
									<th>Expense</th>
									<th>Vendor</th>
									<th>Amount</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="expense" items="${ items }">
									<tr>
										<td><a href="/expenses/show/${expense.getId()}">
												<c:out value="${ expense.getName() }"></c:out>
											</a></td>
										<td>
											<c:out value="${ expense.getVendor() }"></c:out>
										</td>
										<td>
											<c:out value="${ expense.getPrice() }"></c:out>
										</td>
										<td class="action-box"><a class="delete-button"
												href="/edit/${ expense.getId() }">edit</a>
											<form action="/expenses/${expense.getId()}" method="post">
												<input type="hidden" name="_method" value="delete"> <input type="submit"
													value="Delete">
											</form>
										</td>


									</tr>
								</c:forEach>
								<tr>
									<td>Expsenses: <c:out value="${ itemCount }"></c:out></td>
									<td></td>
									<td>Total: <c:out value="${ total }"></c:out></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="container">
						<h1>Add an expense:</h1>
						<form:form action="/expenses" method="post" modelAttribute="item" id="expenseForm">
							<form:errors path="name" class="text-danger" />
							<form:errors path="vendor" class="text-danger" />
							<form:errors path="price" class="text-danger" />
							<form:errors path="description" class="text-danger" />
							<div class="formBlock">
								<p>
									<form:label path="name">Expense Name: </form:label>

									<form:input path="name" />
								</p>
								<p>
									<form:label path="vendor">Vendor: </form:label>

									<form:input path="vendor" />
								</p>
								<p>
									<form:label path="price">Amount: </form:label>

									<form:input type="number" step="0.01" path="price" />
								</p>
							</div>
							<p id="descriptionBlock">
								<form:label path="description">Description: </form:label>

								<form:textarea path="description" rows="3" cols="19" />
							</p>
							<input type="submit" value="Submit" />
						</form:form>
					</div>

				</body>

				</html>