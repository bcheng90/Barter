angular.module("barter").factory("UserService", function($resource){
   return $resource("/users/:id", {id:'@id'},
   {
    'update': { method:'PUT' }
   });
});

angular.module("barter").factory("TalentService", function($resource){
   return $resource("/talents/:id");
});