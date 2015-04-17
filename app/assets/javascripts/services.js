angular.module("barter").factory("UserService", function($resource){
   return $resource("/users/:id");
});
