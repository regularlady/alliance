(function(){
  app = angular.module('welcome', []);

  app.controller("clientsController", ['$scope', '$http',
    function($scope,$http) {
    
    $http.get("/clients.json")
    .success(function(response) {$scope.clients = response;}
      );  
  }]);

})();

$(function() {
	$("#datepicker").datepicker();
});
