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

.controller('UsersController', ['$routeParams', 'UserService', "TalentService", function($routeParams, UserService, TalentService){
  this.categories = ["Art & Music", "Food", "Sport", "Computer"];
  this.experiences = ["novice", "intermediate", "expert"];


  UserService.get({id: $routeParams.id}, function(data){
    this.user = data;
  }.bind(this));

  this.saveUser = function(user) {
    console.log(user);
    UserService.update(user);
  };

  this.saveTalent = function(talent){
    console.log(talent);
    TalentService.save(talent);
  };

  this.toggleTalentShown = function(talent) {
    talent.isShown = ! talent.isShown;
  }

  this.loadTalentsForUser = function(user) {
    console.log('Hello');
    $http.get('/talents/for_user/' + user.id).
     success(function(data, status, headers, config) {
      this.talents = data;
      console.log(this.talents);
  });
  }

  this.acceptOffer = function(offer) {
    offer.status = true;
    $http.put('/offers/' + offer.id, offer)
    .success(function(data, status){
      console.log(data);
      console.log(status);
    });
  };

  this.declineOffer = function(offer) {
    $http.delete('/offers/' + offer.id, offer)
    .success(function(response){
      console.log(response);
      console.log("I am deleting the offer");
      console.log(response)
    }).error(function(response){
      console.log(response);
      console.log("we failed");
    });
  };

  this.createOffer = function(timeslot) {
    console.log("creating offer");
    $http.post('/offers', timeslot)
    .success(function(response){
      console.log("success!!!");
    }).error(function(response){
      console.log("not in success but getting there!!!");
    });
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
