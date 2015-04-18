angular.module('barter').controller('WelcomeController', ['UserService', function(UserService){

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

angular.module("barter").controller("TalentsController", ["UserService", function(UserService){
   UserService.get(talents, function(jsonResponse) {
    this.user = jsonResponse;
    console.log("response", jsonResponse);
   }.bind(this));


}]);
