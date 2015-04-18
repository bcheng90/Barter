angular.module("barter").factory("UserService", function($resource){
   return $resource("/users/:id");
});

angular.module("barter").factory("TalentService", function($resource){
   return $resource("/talents/:id");
});
