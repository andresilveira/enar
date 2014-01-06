'use restrict';

enarServices = angular.module('enarServices', ['ngResource'])

enarServices.factory('Ficha', ['$resource', ($resource) -> 
  return $resource('fichas/:id.json', {id: @id}, {update: {method: "PUT"}})
])