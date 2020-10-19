'use strict';

angular.module('jmeherApp').factory('AddressService', ['$http', '$q', function($http, $q){


 var REST_SERVICE_URI = 'http://localhost:8081/jmeher/address/';

    var factory = {
        fetchAllAddress: fetchAllAddress,
        createAddress: createAddress,
        updateAddress: updateAddress,
        deleteAddress: deleteAddress
    };

    return factory;

    function fetchAllAddress(customerId) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+customerId)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Address');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createAddress(Address) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, Address)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Address');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateAddress(Address, addressId) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+addressId, Address)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Address');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteAddress(addressId) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+addressId)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Address');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
   

}]);
