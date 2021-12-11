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
    <div class="d-flex justify-content-around align-items-center m-3">
    <h1 class="text-primary mb-3">Expense Details</h1>
    <a href="/">Go Back</a>
    </div>
    <div class="card border-info m-3 m-auto">
  <div class="card-header bg-transparent border-info text-primary">price: $<c:out value="${expense.amount}"></c:out></div>
  <div class="card-body text-primary">
    <h5 class="card-title"><c:out value="${expense.expenseName}"></c:out></h5>
    <p class="card-text"><c:out value="${expense.description}"></c:out></p>
  </div>
  <div class="card-footer bg-transparent border-info text-primary">Vendor: <c:out value="${expense.vendor}"></c:out></div>
</div>
        
    </div> <!-- End of Container -->
</body>
</html>
