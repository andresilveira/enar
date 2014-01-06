'use restrict';

enar = angular.module('enar', ['ngRoute', 'enarControllers', 'enarServices', 'enarDirectives'])

enar.config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content')
])

enar.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
  when('/fichas', {
    templateUrl: 'templates/ficha-list.html',
    controller: 'FichaListCtrl'
    }).
  otherwise({
    redirectTo: '/fichas'
    })
  ])