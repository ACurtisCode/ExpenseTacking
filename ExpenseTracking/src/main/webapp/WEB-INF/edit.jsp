<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		<h1>Edit Expense:</h1>
		<form:form action="/edit/${expense.getId()}" method="post" modelAttribute="item">
			<input type="hidden" name="_method" value="put">
			
			
			
			
			<p>
				<form:label path="name">Expense Name: </form:label>
				<form:errors path="name" class="text-danger" />
				<form:input path="name" />
			</p>
			<p>
				<form:label path="vendor">Vendor: </form:label>
				<form:errors path="vendor" class="text-danger" />
				<form:input path="vendor" />
			</p>
			<p>
				<form:label path="price">Amount: </form:label>
				<form:errors path="price" class="text-danger" />
				<form:input type="number" step="0.01" path="price" />
			</p>
			<p>
				<form:label path="description">Description: </form:label>
				<form:errors path="description" class="text-danger" />
				<form:textarea path="description" rows="3" cols="25" />
			</p>
			<input type="submit" value="Submit" />
		</form:form>
	</div>
</body>
</html>