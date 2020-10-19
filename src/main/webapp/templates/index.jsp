<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>JMeher Tutorials</title>
	<link rel="icon" href="${contextPath}/images/favicon1.ico" type="image/ico">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="${contextPath}/css/jmeher_custom-1.0.css" />
	<script src="${contextPath}/js/jmeher_custom-1.0.js"></script>
	
</head>
<body style="text-align: -webkit-center;">
	
	<div class="content-div">
		<h2> Welcome To JMeher Tutorials (Spring Boot - AngularJS) </h2>
		<div class="form-group" style="text-align: center">
			<i class="fa fa-user" >
	     		<a href="/jmeher/customerMgmt/" >Customer Management</a>
	     	</i>
	    </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/js/app.js' />"></script>
      <script src="<c:url value='/js/service/customer_service.js' />"></script>
      <script src="<c:url value='/js/controller/customer_controller.js' />"></script>
</body>
</html>