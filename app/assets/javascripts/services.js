angular.module("barter").factory("UserService", function($resource){
   return $resource("/users/:id", {id:'@id'},
   {
    'update': { method:'PUT' }
   });
 });

angular.module("barter").factory("TalentService", function($resource){
   return $resource("/talents/:id", {id: "@id"},
   {
    'update': { method:'PUT' }
   });
});

angular.module("barter").factory("OfferService", function($resource){
   return $resource("/offers/:id");
});

angular.module("barter").factory("ReputationService", function($resource){
   return $resource("/offers/:id");
});
