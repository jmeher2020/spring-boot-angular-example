'use strict';

angular.module('jmeherApp').controller('AddressController', ['$scope', 'AddressService', function($scope, AddressService) {
	
    var self = this;
    self.address={addressId:null, addressType:'', street:'', city:'', state:'', postalCode:'', customerId:$("#customerId").val()};
    self.addresses=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;


    fetchAllAddress();

    function fetchAllAddress(){
        AddressService.fetchAllAddress(self.address.customerId)
            .then(
            function(d) {
                self.addresses = d;
            },
            function(errResponse){
                console.error('Error while fetching Address');
            }
        );
    }

    function createAddress(address){
        AddressService.createAddress(address)
            .then(
            fetchAllAddress,
            function(errResponse){
                console.error('Error while creating Address');
            }
        );
    }

    function updateAddress(address, addressId){
        AddressService.updateAddress(address, addressId)
            .then(
            fetchAllAddress,
            function(errResponse){
                console.error('Error while updating Address');
            }
        );
    }
    

    function deleteAddress(addressId){
    	if(confirm("Are you sure to delete?")){
	        AddressService.deleteAddress(addressId)
	            .then(
	            fetchAllAddress,
	            function(errResponse){
	                console.error('Error while deleting Address');
	            }
	        );
        }
    }

    function submit() {
        if(self.address.addressId===null){
            console.log('Saving New Address', self.address);
            createAddress(self.address);
        }else{
            updateAddress(self.address, self.address.addressId);
            console.log('Address updated with id ', self.address.addressId);
        }
        reset();
    }

    function edit(addressId){
        console.log('addressId to be edited', addressId);
        for(var i = 0; i < self.addresses.length; i++){
            if(self.addresses[i].addressId === addressId) {
                self.address = angular.copy(self.addresses[i]);
                break;
            }
        }
    }

    function remove(addressId){
        console.log('addressId to be deleted', addressId);
        if(self.address.addressId === addressId) {
            reset();
        }
        deleteAddress(addressId);
    }


    function reset(){
        self.address={addressId:null, addressType:'', street:'', city:'', state:'', postalCode:'', customerId:$("#customerId").val()};
        $scope.addressForm.$setPristine(); //reset Form
    }
    


}]);
