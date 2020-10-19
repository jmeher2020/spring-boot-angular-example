'use strict';

angular.module('jmeherApp').factory('CustomerService', ['$http', '$q', function($http, $q){


 var REST_SERVICE_URI = 'http://localhost:8081/jmeher/customer/';

    var factory = {
        fetchAllCustomers: fetchAllCustomers,
        createCustomer: createCustomer,
        updateCustomer: updateCustomer,
        deleteCustomer: deleteCustomer
    };

    return factory;

    function fetchAllCustomers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Customers');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createCustomer(Customer) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, Customer)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Customer');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateCustomer(Customer, customerId) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+customerId, Customer)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Customer');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteCustomer(customerId) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+customerId)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Customer');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
   

}]);
