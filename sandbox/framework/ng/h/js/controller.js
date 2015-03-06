var FilterCtrl = function($scope, $filter){
    // number
    $scope.num = 1234.56789123456;
    console.log($filter('number')($scope.num, 5));

    // currency
    $scope.money = 1234.567;
    console.log($filter('currency')($scope.money, 'NTD '));

    // date
    $scope.birth = '2013-08-26';
    console.log($filter('date')($scope.birth, 'yyyy 年 MM 月 dd 日'));

    // json
    $scope.obj = {
        name: 'abgne.tw',
        age: 18,
        skills: [ 'jQuery', 'JavaScript']
    };
    console.log($filter('json')($scope.obj));

    // lowercase
    $scope.lower = 'ABGNE.TW';
    console.log($filter('lowercase')($scope.lower));

    // uppercase
    $scope.upper = 'abgne.tw';
    console.log($filter('uppercase')($scope.upper));
};