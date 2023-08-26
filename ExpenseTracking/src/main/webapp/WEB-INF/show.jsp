<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="container">
		<div class="first-line">
			<h1>Expense Details</h1>
			<a href="/expenses">Go back</a>
		</div>
		<h3>
			Expense Name:&nbsp
			<c:out value="${ name }"></c:out>
		</h3>
		<h3>
			Expense Description:&nbsp
			<c:out value="${ description }"></c:out>
		</h3>
		<h3>
			Vendor:&nbsp
			<c:out value="${ vendor }"></c:out>
		</h3>
		<h3>
			Amount Spent:&nbsp
			<c:out value="${ price }"></c:out>
		</h3>
	</div>
</body>
</html>