angular.module('barter')
  .controller('WelcomeController', ['$routeParams', "UserService", "TalentService", function($routeParams, UserService, TalentService ){
    this.tals = [];
    this.persons = [];
    this.selectedCategory = 'Music';

     UserService.query(function(data) {
      this.persons = data;
      console.log("response", data);
     }.bind(this));

     TalentService.query(function(data) {
      this.tals = data;
      console.log("response", data);
     }.bind(this));

     this.filterFunction = function(array, key){
       for(var i = 0; i < array.length; i++){
         if (array[i].type === key){
           return true
         }
       };
      return false;
     };

     // var rep = function(persons) {
     //  for(var i = 0; i < persons.length; i++){
     //    persons[i].reputation =
     //  }
     // };



}]);

angular.module('barter')
.controller('UsersController', ['$routeParams', 'UserService', function($routeParams, UserService, TalentService){
    UserService.get({id: $routeParams.id}, function(data){
      this.user = data;
    }.bind(this));

    this.saveUser = function(user) {
      console.log(user);
      UserService.update(user);
    };

}]);


angular.module('barter').controller('TimeslotsController', ['UserService', function(UserService){
   // here you'd put code to e.g.
   // load the timeslots from a service, handle form subsmissions etc
   console.log('TimeslotsController instantiated');
   this.slots = [ "a", "b", "c", "d" ]

   UserService.get({id:4}, function(jsonResponse) {
     this.user = jsonResponse;
     console.log('response', jsonResponse);
   }.bind(this));
}]);
