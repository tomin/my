// var Ctrl = function(a){
// 	a.name = '男丁格爾';
// 	console.log(a);
// };

// Ctrl.$inject = ['$scope'];

var myApp = angular.module('MyApp', []);

myApp.controller('Ctrl', ['$scope', function(new$scope){
    new$scope.name = '(新)男丁格爾';
}]);