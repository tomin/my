var PersonCtrl = function($scope){
	$scope.name = '男丁格爾';
	$scope.age = 18;

	$scope.$watch('name', function(){
		console.log($scope.name);
	});

	$scope.$watch('age', function(){
		if($scope.age < 18){
			console.error('可能是謊報年齡');
		}
        if($scope.age > 130){
            console.error('可能謊報年齡');
        }
	});
};