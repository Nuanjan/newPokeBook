<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
		<h1>Edit Expense</h1>
		<form:form action="/update/${expense.id}" method="post" modelAttribute="expense">
	 	<input type="hidden" name="_method" value="put">
    		<p>
		        <form:errors path="expenseName" class="text-danger"/><br/>
		        <form:label path="expenseName" class="w-25">Expense Name: </form:label>
		        <form:input path="expenseName" class="w-50"/>
		    </p>
		    <p>
		        <form:errors path="vendor" class="text-danger"/><br />
		        <form:label path="vendor" class="w-25" >Vendor: </form:label>
		        <form:input path="vendor" class="w-50"/>
		    </p>
		    <p>
		        <form:errors path="amount" class="text-danger"/><br />
		        <form:label path="amount"  class="w-25">Amount: </form:label>
		        <form:input path="amount" type="number" class="w-50"/>
		    </p>
		    <p>
		        <form:errors path="description" class="text-danger"/><br />   
		        <form:label path="description" class="align-top w-25">Description: </form:label>
		        <form:textarea path="description" class="w-50"/>
		    </p>    
			<input type="submit" value="Edit" class="btn btn-primary"/>
		</form:form>  
</div>
</body>
</html>