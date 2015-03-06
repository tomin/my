var myApp = angular.module('MyApp', []);

myApp.filter('clean', function(){
    return function(str, separator){
        return str.toLowerCase().replace(/\s+/g, separator || '-');
    };
});

myApp.controller('Ctrl', function($scope){
    $scope.text = 'Hello Kitty';
});