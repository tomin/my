var FriendsCtrl = function($scope){
    //$scope.friends = [ '男丁格爾', 'jelly', '梅干桑', '莫希爾' ];
    /*
    $scope.friends = [
        { name: '男丁格爾', age: 18 },
        { name: 'jelly', age: 16 },
        { name: '梅干桑', age: 30 },
        { name: '莫希爾', age: 31 }
    ];
    */
    $scope.friends = [];

    $scope.add = function(){
        $scope.friends.push({
            paper: $scope.paper,
            box: $scope.box,
            price: $scope.price,
            total: $scope.price / ($scope.paper * $scope.box * $scope.paper)
        });
        document.getElementById("paper").focus();
    };

    $scope.remove = function(index){
        $scope.friends.splice(index, 1);
    };
};

document.getElementById("paper").focus();