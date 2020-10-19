<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
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
	
  </head>

   <body  ng-app="jmeherApp" >
   		<div  ng-controller="CustomerController as custCtrl">	
			<div class="content-div">
				<h2> JMeher Tutorials - <span ng-hide="custCtrl.customer.customerId ">Add</span> <span ng-show="custCtrl.customer.customerId ">Edit</span> Customer Details</h2>
                  <form ng-submit="custCtrl.submit()" name="customerForm" >
                  
                      <input type="hidden" ng-model="custCtrl.customer.customerId" name="customerId"  id="customerId"   />
                      
                      <div class="row">
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">First Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="custCtrl.customer.firstName" name="firstName"  id="firstName"  class="form-control" placeholder="Enter first name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="customerForm.$dirty">
                                      <span ng-show="customerForm.firstName.$error.required">Required field</span>
                                      <span ng-show="customerForm.firstName.$error.minlength">Minimum length is 3</span>
                                      <span ng-show="customerForm.firstName.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>
                          
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">Last Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="custCtrl.customer.lastName" name="lastName"  id="lastName" class="form-control" placeholder="Enter last name" required />
                                  <div class="has-error" ng-show="customerForm.$dirty">
                                      <span ng-show="customerForm.lastName.$error.required">Required field</span>
                                      <span ng-show="customerForm.lastName.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                
                        
                      
                      <div class="row">
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">Phone No</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="custCtrl.customer.phoneNo" name="phoneNo" id="phoneNo"  class="form-control"  placeholder="Enter Phone no." required  />
                              </div>
                              <div class="has-error" ng-show="customerForm.$dirty">
                                  <span ng-show="customerForm.phoneNo.$error.required">Required field</span>
                                  <span ng-show="customerForm.phoneNo.$error.minlength">Min length is 3</span>
                                  <span ng-show="customerForm.phoneNo.$invalid">Invalid data</span>
                              </div>
                          </div>


                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">Gender</label>
                              <div class="col-md-7">
                                   <select ng-model="custCtrl.customer.gender" name="gender" id="gender"  class="form-control" required >
							      		<option value="">Select Gender</option>
							      		<option value="Male">Male</option>
							      		<option value="Female">Female</option>
							      </select>
							      <div class="has-error" ng-show="customerForm.$dirty">
                                      <span ng-show="customerForm.gender.$error.required">Required field</span>
                                      <span ng-show="customerForm.gender.$invalid">Invalid data</span>
                                  </div>
                              </div>
                          </div>
                      </div>



                      <div class="row">
                          <div style="width: 100%;text-align: center;">
                              <input type="submit"  value="{{!custCtrl.customer.customerId ? 'Add' : 'Update'}}" class="btn btn-primary" ng-disabled="customerForm.$invalid">
                              <button type="button" ng-click="custCtrl.reset()" class="btn btn-warning" ng-disabled="customerForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>


				<h2> JMeher Tutorials - Customer List</h2>	
				<div class="container"> 
				 <table class="table">
						    <thead class="thead-dark" style="white-space: nowrap"> 
	                          <tr>
	                              <th>Cust. ID.</th>
	                              <th>First Name</th>
	                              <th>Last Name</th>
	                              <th>Phone No</th>
	                               <th>Gender</th>
	                              <th width="20%">Actions</th>
	                          </tr>
	                      </thead>
	                      <tbody>
	                          <tr ng-repeat="cust in custCtrl.customers">
	                              <td><span ng-bind="cust.customerId"></span></td>
	                              <td><span ng-bind="cust.firstName"></span></td>
	                               <td><span ng-bind="cust.lastName"></span></td>
	                              <td><span ng-bind="cust.phoneNo"></span></td>
	                              <td><span ng-bind="cust.gender"></span></td>
	                              <td>
	                             		<i ng-click="custCtrl.edit(cust.customerId)" title="Edit Customer" class="fa fa-pencil" ></i>&nbsp;&nbsp;
					                    <i ng-click="custCtrl.remove(cust.customerId)" title="Delete Customer" class="fa fa-trash" ></i>&nbsp;&nbsp;
					                    <i ng-click="custCtrl.openAddressMgmt(cust.customerId,cust.firstName, cust.lastName )" title="Address Management" class="fa fa-list" ></i>&nbsp;&nbsp;
					                    
	                              </td>
	                          </tr>
	                      </tbody>
	                  </table>
	              </div>
			       <div class="row">
                          <div style="width: 100%;text-align: center;">
							<i class="fa fa-home" >
					    	    <a href="/jmeher/index" >Go To Home</a>
					     	</i>
					     </div>					     	
			      </div>
	          </div>
      </div>
      <link rel="stylesheet" href="/css/jmeher_custom-1.0.css" />
	   <script src="/js/jmeher_custom-1.0.js"></script>
		
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/js/jmeher_app.js' />"></script>
      <script src="<c:url value='/js/service/customer_service.js' />"></script>
      <script src="<c:url value='/js/controller/customer_controller.js' />"></script>
  </body>
</html>