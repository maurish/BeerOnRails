'use strict';

angular.module('BeerApp',['ngResource'])
.controller('BreweryController', ['$scope','Brewery', function($scope, Brewery){
	$scope.breweries = Brewery.query()
	$scope.sortBy = ''

}]).factory('Brewery', ['$resource', function($resource){
	return $resource('http://localhost:3000/breweries',{id:'@id'}, {
		query:{
			method:'GET',
			headers:{'Accept':'application/json'},
			isArray:true
		}
	})
}])
