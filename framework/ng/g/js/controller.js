var FriendsCtrl = function($scope){
    //$scope.friends = [ '男丁格爾', 'jelly', '梅干桑', '莫希爾' ];
    $scope.friends = [
        { name: '男丁格爾', age: 18 },
        { name: 'jelly', age: 16 },
        { name: '梅干桑', age: 30 },
        { name: '莫希爾', age: 31 }
    ];

    $scope.add = function(){
        $scope.friends.push({
            name: $scope.pName,
            age: $scope.pAge
        });
    };

    $scope.remove = function(index){
        $scope.friends.splice(index, 1);
    };
};