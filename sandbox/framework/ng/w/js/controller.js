var onePiece = angular.module('OnePiece', [], function($routeProvider){
	$routeProvider.when('/', {
		templateUrl: 'view.html'
	}).when('/edit/:index', {
		templateUrl: 'edit.html',
		controller: 'EditCtrl'
	}).when('/hello', {
		templateUrl: 'hello.html',
		controller: 'GreetingCtrl'
	}).when('/hello/:message', {
		templateUrl: 'hello.html',
		controller: 'GreetingCtrl'
	}).when('/hello/:message/:index', {
		templateUrl: 'hello.html',
		controller: 'GreetingCtrl'
	}).otherwise({
		redirectTo: '/'
	});
});

onePiece.controller('OnePieceCtrl', function($scope){
	$scope.friends = [{
		name: '蒙其·D·魯夫', 
		reward: 400000000
	}, {
		name: '羅羅亞·索隆', 
		reward: 120000000
	}, {
		name: '娜美', 
		reward: 16000000
	}, {
		name: '騙人布', 
		reward: 30000000
	}, {
		name: '香吉士', 
		reward: 77000000
	}, {
		name: '多尼多尼·喬巴', 
		reward: 50
	}, {
		name: '妮可·羅賓', 
		reward: 80000000
	}, {
		name: '佛朗基', 
		reward: 44000000
	}, {
		name: '布魯克', 
		reward: 33000000
	}];
}).controller('GreetingCtrl', function($scope, $routeParams){
	$scope.greeting = $routeParams.message || 'Hi~';
	$scope.index = $routeParams.index || 0;
}).controller('EditCtrl', function($scope, $routeParams){
	$scope.index = $routeParams.index;
});