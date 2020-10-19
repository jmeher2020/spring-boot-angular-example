'use strict';

angular.module('jmeherApp').controller('CustomerController', ['$scope', 'CustomerService', function($scope, CustomerService) {
    var self = this;
    self.customer={customerId:null, firstName:'',lastName:'',phoneNo:'',gender:''};
    self.customers=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
    self.openAddressMgmt = openAddressMgmt;


    fetchAllCustomers();

    function fetchAllCustomers(){
        CustomerService.fetchAllCustomers()
            .then(
            function(d) {
                self.customers = d;
            },
            function(errResponse){
                console.error('Error while fetching Customers');
            }
        );
    }

    function createCustomer(customer){
        CustomerService.createCustomer(customer)
            .then(
            fetchAllCustomers,
            function(errResponse){
                console.error('Error while creating Customer');
            }
        );
    }

    function updateCustomer(customer, customerId){
        CustomerService.updateCustomer(customer, customerId)
            .then(
            fetchAllCustomers,
            function(errResponse){
                console.error('Error while updating Customer');
            }
        );
    }
    

    function deleteCustomer(customerId){
    	if(confirm("Are you sure to delete?")){
	        CustomerService.deleteCustomer(customerId)
	            .then(
	            fetchAllCustomers,
	            function(errResponse){
	                console.error('Error while deleting Customer');
	            }
	        );
        }
    }

    function submit() {
        if(self.customer.customerId===null){
            console.log('Saving New Customer', self.customer);
            createCustomer(self.customer);
        }else{
            updateCustomer(self.customer, self.customer.customerId);
            console.log('Customer updated with id ', self.customer.customerId);
        }
        reset();
    }

    function edit(customerId){
        console.log('customerId to be edited', customerId);
        for(var i = 0; i < self.customers.length; i++){
            if(self.customers[i].customerId === customerId) {
                self.customer = angular.copy(self.customers[i]);
                break;
            }
        }
    }

    function remove(customerId){
        console.log('customerId to be deleted', customerId);
        if(self.customer.customerId === customerId) {//clean form if the customer to be deleted is shown there.
            reset();
        }
        deleteCustomer(customerId);
    }


    function reset(){
        self.customer={customerId:null, firstName:'',lastName:'',phoneNo:'',gender:''};
        $scope.customerForm.$setPristine(); //reset Form
    }
    
    function openAddressMgmt(customerId, firstName, lastName){
         window.location.href="/jmeher/addressMgmt/"+customerId+"/"+firstName+" "+lastName;
    }

}]);
