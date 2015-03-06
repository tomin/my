var myApp = angular.module('MyApp', []);

myApp.config(function($interpolateProvider){
    $interpolateProvider.startSymbol('<%');
    $interpolateProvider.endSymbol('%>');

    //$interpolateProvider.startSymbol('<%').endSymbol('%>');
});