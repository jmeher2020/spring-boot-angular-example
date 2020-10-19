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

   <body  ng-app="jmeherApp">
   		<div  ng-controller="AddressController as addCtrl">	
			<div class="content-div">
				<h2> JMeher Tutorials - <span ng-hide="addCtrl.address.addressId ">Add</span> <span ng-show="addCtrl.address.addressId ">Edit</span> Address Details</h2>
				<h5> Address Id : ${CUSTOMER_ID},  Name : ${CUSTOMER_NAME}</span></h5>
                  <form ng-submit="addCtrl.submit()" name="addressForm" >
                  
                      <input type="hidden" ng-model="addCtrl.address.customerId" name="customerId"  id="customerId"  value="${CUSTOMER_ID}" />
                      <input type="hidden" ng-model="addCtrl.address.addressId" name="addressId"  id="addressId"   />
                      
                      <div class="row">
                      	
                      	  <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Address Type</label>
                              <div class="col-md-7">
                                   <select ng-model="addCtrl.address.addressType" name="addressType" id="addressType"  class="form-control" required >
							      		<option value="">Select Address Type</option>
							      		<option value="Present">Present</option>
							      		<option value="Permanent">Permanent</option>
							      </select>
							      <div class="has-error" ng-show="addressForm.$dirty">
                                      <span ng-show="addressForm.addressType.$error.required">Required field</span>
                                      <span ng-show="addressForm.addressType.$invalid">Invalid data</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                          
                      <div class="row">
                          
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">Street</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="addCtrl.address.street" name="street"  id="street"  class="form-control" placeholder="Enter Street" required />
                                  <div class="has-error" ng-show="addressForm.$dirty">
                                      <span ng-show="addressForm.street.$error.required">Required field</span>
                                      <span ng-show="addressForm.street.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>
                          
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">City</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="addCtrl.address.city" name="city"  id="city"  class="form-control" placeholder="Enter Street" required />
                                  <div class="has-error" ng-show="addressForm.$dirty">
                                      <span ng-show="addressForm.city.$error.required">Required field</span>
                                      <span ng-show="addressForm.city.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>
                     </div>
                          
                    <div class="row">
                          <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">State</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="addCtrl.address.state" name="state"  id="state" class="form-control" placeholder="Enter last name" required />
                                  <div class="has-error" ng-show="addressForm.$dirty">
                                      <span ng-show="addressForm.state.$error.required">Required field</span>
                                      <span ng-show="addressForm.state.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>
                      
                      	 <div class="form-group col-md-6">
                              <label class="col-md-2 control-lable" for="file">Postal Code</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="addCtrl.address.postalCode" name="postalCode"  id="postalCode" class="form-control" placeholder="Enter last name" required />
                                  <div class="has-error" ng-show="addressForm.$dirty">
                                      <span ng-show="addressForm.postalCode.$error.required">Required field</span>
                                      <span ng-show="addressForm.postalCode.$invalid">Invalid data </span>
                                  </div>
                              </div>
                          </div>               

                      </div>



                      <div class="row">
                          <div style="width: 100%;text-align: center;">
                              <input type="submit"  value="{{!addCtrl.address.addressId ? 'Add' : 'Update'}}" class="btn btn-primary" ng-disabled="addressForm.$invalid">
                              <button type="button" ng-click="addCtrl.reset()" class="btn btn-warning" ng-disabled="addressForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>


				<h2> JMeher Tutorials - Address List</h2>	
				<div class="container"> 
				 <table class="table">
						    <thead class="thead-dark" style="white-space: nowrap"> 
	                          <tr>
	 							  <th>Customer Id</th>          
							      <th>Address Id</th>
							      <th>Address Type</th>                                                       
							      <th>Street</th>
							      <th>City</th>
							      <th>State</th>
							      <th>Postal Code</th>
	                              <th width="20%">Actions</th>
	                          </tr>
	                      </thead>
	                      <tbody>
	                          <tr ng-repeat="addr in addCtrl.addresses">
	                          	  <td><span ng-bind="addr.customerId"></span></td>
	                              <td><span ng-bind="addr.addressId"></span></td>
	                              <td><span ng-bind="addr.addressType"></span></td>
	                              <td><span ng-bind="addr.street"></span></td>
	                              <td><span ng-bind="addr.city"></span></td>
	                              <td><span ng-bind="addr.state"></span></td>
	                              <td><span ng-bind="addr.postalCode"></span></td>
	                              <td>
	                             		<i ng-click="addCtrl.edit(addr.addressId)" title="Edit Address" class="fa fa-pencil" ></i>&nbsp;&nbsp;
					                    <i ng-click="addCtrl.remove(addr.addressId)" title="Delete Address" class="fa fa-trash" ></i>&nbsp;&nbsp;
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
					     	&nbsp; &nbsp; &nbsp;
					     	<i class="fa fa-list" >
					    	    <a href="/jmeher/customerMgmt/" >Go To Customer List</a>
					     	</i>
					     </div>				      
	          		</div>
      </div>
      <link rel="stylesheet" href="/css/jmeher_custom-1.0.css" />
	  <script src="/js/jmeher_custom-1.0.js"></script>
		
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/js/jmeher_app.js' />"></script>
      <script src="<c:url value='/js/service/address_service.js' />"></script>
      <script src="<c:url value='/js/controller/address_controller.js' />"></script>
     
  </body>
</html>