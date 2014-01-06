'use restrict';

enarDirectives = angular.module('enarDirectives', [])

enarDirectives.directive('enconfirm', ->
  return {
    restrict: 'A',
    link: (scope, element, attrs) ->
      element.bind 'click', ->
        if window.confirm('Are you sure?')
          scope.$eval(attrs.enconfirm)
  }
)
