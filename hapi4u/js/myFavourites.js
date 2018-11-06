var app1 = angular.module('app1', []);

app1.controller('ctrl1', function($scope)) {
  $scope.saveFav = "fa fa-heart-o";
  $scope.deleteFav = "fa fa-heart";
  $scope.activateSave = False;
  $scope.activateDelete = False;

  $scope.saveMyFavourites = function() {
    $scope.saveFav = "fa fa-heart";
    $scope.activateSave = True;
  }

  $scope.deleteMyFavourites = function() {
    $scope.deleteFav = "fa fa-heart-o";
    $scope.activateDelete = True;
  }
}

/*var saveMyFavourites = function(user_id, pharmacy_id) {
  var fdao = Java.type("com.sivajavatechie.script.MyFavouritesDAO")
  fdao.saveMyFavourites( user_id, pharmacy_id)
}

var deleteMyFavourites = function(user_id, pharmacy_id) {
  var fdao = Java.type("com.sivajavatechie.script.MyFavouritesDAO")
  fdao.deleteMyFavourites( user_id, pharmacy_id)
}*/
