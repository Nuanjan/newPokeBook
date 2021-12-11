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
<title>Title Here</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1>Successful connect to DB!!!</h1>
        
        <table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Expense</th>
		      <th scope="col">Vendor</th>
		      <th scope="col">Amount</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		 <c:forEach var="expense" items="${expenses}">
		  <tbody>
		    <tr>
		      <td><a href="/expense/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
		      <td><c:out value="${expense.vendor}"></c:out></td>
		      <td><c:out value="${expense.amount}"></c:out></td>
		      <td class="d-flex align-items-center justify-content-around">
		      	<a href="/edit/${expense.id}">Edit</a>
		      <form action="/delete/${expense.id}" method="post">
    			<input type="hidden" name="_method" value="delete">
		      	<input class="btn btn-link p-0" type="submit" value="Delete">
		      </form>
		      </td>
		    </tr>
		  </tbody>
		  </c:forEach>
		</table>
		
		<div>
		<h1>Track an expense:</h1>
		<form:form action="/create" method="post" modelAttribute="expense">
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
		    <input type="submit" value="Submit" class="btn btn-primary"/>
		</form:form>  
  
		</div>
       
    </div> <!-- End of Container -->
</body>
</html>
