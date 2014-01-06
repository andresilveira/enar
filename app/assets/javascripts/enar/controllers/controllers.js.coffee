'use restrict';

enarControllers = angular.module('enarControllers', [])

enarControllers.controller('FichaListCtrl', ['$scope', 'Ficha', ($scope, Ficha) ->
  $scope.fichas = Ficha.query()
  
  $scope.delete = (ficha) ->
    console.log(ficha)
    ficha.$delete(id: ficha.id)
    $scope.fichas.splice($scope.fichas.indexOf(ficha), 1)
])